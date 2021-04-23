PUSHD %HomeDrive%%HomePath%
echo %CD%
mklink .gitconfig %~dp0\.gitconfig
mklink .gitalias %~dp0\gitalias\gitalias.txt
POPD
setx /m VIM %~dp0
