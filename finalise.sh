sed '4s|^|export PATH="$PATH:$HOME/opt/cross/bin"\\n|' .bashrc \
  && sed '4s|^|export SDK_DIR="PATH-TO/hollyhock-2/sdk"\\n|' .bashrc