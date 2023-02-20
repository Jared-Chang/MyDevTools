to-bpe-workstation-1() {
  establish_proxy bpe-workstation-1 5050 8080
}

to-kkbox-corp-bpe-workstation() {
  establish_proxy kkbox-corp-bpe-workstation 5050 8080
}

establish_proxy() {
  readonly ssh_server_url=${1:?"The ssh server url/ip must specified."}
  readonly ssh_tunnel_port=${2:?"The ssh tunnel port must specified."}
  readonly proxy_port=${3:?"The proxy port must specified."}

  tunnel_response=$(tmux new-session -s ssh_tunnel -d "ssh -D $ssh_tunnel_port $ssh_server_url" 2>&1)
  proxy_response=$(tmux new-session -s http_proxy -d "hpts -s 127.0.0.1:$ssh_tunnel_port -p $proxy_port" 2>&1)

  if [ "$tunnel_response" = 'duplicate session: ssh_tunnel' ] || [ "$proxy_response" = 'duplicate session: http_proxy' ]; then
    echo "Proxy already established, please \033[0;31m disestablish_proxy \033[0m if you want to establish new proxy"
    return
  fi

  echo "http proxy to \033[0;31m$ssh_server_url\033[0m has established on \033[0;31m$proxy_port\033[0m"
}

disestablish_proxy() {
  tmux kill-session -t ssh_tunnel
  tmux kill-session -t http_proxy

  echo "http proxy has disestablished"
}

connect_to_first_pod_by_name() {
  kubectl exec --stdin --tty $(kubectl get pods | grep "$1") -- /bin/bash
}

to_kfa_db() {
  aws_assume_kfa_rdc
  establish_kfa_proxy 15432 5432 kkbox-rdc rds-kfa.cluster-cigsijjetbtc.us-west-2.rds.amazonaws.com
}

establish_kfa_proxy() {
  readonly local_port=${1:?"The local_port must specified."}
  readonly remote_port=${2:?"The remote_port must specified."}
  readonly ssh_server_url=${3:?"The ssh_server_url must specified."}
  readonly remote_server_url=${4:?"The remote_server_url must specified."}
  
  echo "establishing tunnel"

  tunnel_response=$(tmux new-session -s ssh_tunnel -d 2>&1)

  if [ "$tunnel_response" = 'duplicate session: ssh_tunnel' ]; then
    echo "Proxy already established, please \033[0;31m disestablish_proxy \033[0m if you want to establish new proxy"
    return
  fi

  tmux send-keys -t ssh_tunnel "export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" ENTER
  tmux send-keys -t ssh_tunnel "export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" ENTER
  tmux send-keys -t ssh_tunnel "export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN" ENTER
  tmux send-keys -t ssh_tunnel "ssh -NL $local_port:$remote_server_url:$remote_port $ssh_server_url" ENTER

  echo "tunnel established"
}

aws_assume_kfa_rdc() {

  echo "start assume kfa rdc"

  aws_mfa kfa $(op item get "[aws] [kfa] [jared]" --otp)
  aws_assume_role arn:aws:iam::036714224176:role/goingcloud
}

aws_mfa() {
  readonly profile=${1:?"The aws profile must specified."}
  readonly mfa_token=${2:?"The mfa token must specified."}

  echo "verifying mfa"
  
  mfa_arn=$(aws --profile $profile iam list-mfa-devices | jq -r ".MFADevices[0].SerialNumber")
  credential=$(aws --profile $profile sts get-session-token --serial-number $mfa_arn --token-code $mfa_token)

  echo "mfa verfied"

  aws_set_credential $credential

  echo "mfa credential setted"
}

aws_assume_role() {
  readonly role_arn=${1:?"The aws role arn must specified."}

  echo "assuming role"

  credential=$(aws sts assume-role --role-arn $role_arn --role-session-name 3984758273486723)
  aws_set_credential $credential

  echo "role assumed"
}

aws_set_credential() {
  readonly credential=${1:?"The aws credential json must specified."}

  export AWS_ACCESS_KEY_ID=$(echo $credential | jq -r .Credentials.AccessKeyId)
  export AWS_SECRET_ACCESS_KEY=$(echo $credential | jq -r .Credentials.SecretAccessKey)
  export AWS_SESSION_TOKEN=$(echo $credential | jq -r .Credentials.SessionToken)
}
