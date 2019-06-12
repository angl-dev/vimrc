DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd ~
case $1 in
    --remote)
        cp ${DIR}/.remote.tmux.conf .tmux.conf
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cp ${DIR}/.zprofile .zprofile
        ;;
    --local)
        cp ${DIR}/.local.tmux.conf .tmux.conf
        ;;
    *)
        echo "ERROR: use --remote or --local to specify if you're configuring a local machine or a server."
        exit 1
        ;;
esac
if [ ! -d ./.vim/bundle ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git .vim/bundle/Vundle.vim
fi
cp ${DIR}/.vimrc .
vim +PluginInstall +qall
rm -rf ${DIR}
