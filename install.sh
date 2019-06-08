DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ~
if [ ! -d ./.vim/bundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
fi
cp ${DIR}/.vimrc .
vim +PluginInstall +qall
cp ${DIR}/.tmux.conf .
rm -rf ${DIR}
