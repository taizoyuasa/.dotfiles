#!/bin/zsh

# パスワード入力
read -sp "パスワードを入力してください: " PASSWORD

sudo apt update -y
sudo apt upgrade -y

# パッケージのインストール
sudo apt install -y zsh git wget vim-gtk neovim openssh-server tmux tree curl cargo python3-pip xsel xclip nodejs nodejs-dev node-gyp libssl1.0-dev fonts-ricty-diminished
sudo apt install -y npm
cargo install lsd
pip3 install pynvim neovim

# node.jsのインストール
sudo npm install n -g -y
sudo n lts -y
sudo apt purge -y nodejs npm
sudo npm install -g -y yarn

# その他リポジトリなどをインストール
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# dracula vim
mkdir -p ~/.vim/pack/themes/start
cd ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git dracula
cd $HOME
# plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# dein.vim
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein
# Google Chromeのインストール
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
rm -rf ./google-chrome-stable_current_amd64.deb
# VSCodeのインストール
curl -L https://go.microsoft.com/fwlink/?LinkID=760868 -o vscode.deb
sudo apt install ./vscode.deb

# デフォルトのログインシェルをzshに変更
echo $PASSWORD | chsh -s /bin/zsh
echo ""
echo ""
echo "1. Install 'FiraCode Nerd Font' from nerdfonts.com/font-downloads"
echo "2. Reboot your PC"
echo "3. Run setup2.sh"
echo ""
echo ""
