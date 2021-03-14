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