cp .tmux.conf ~/.
cp pristine/com.googlecode.iterm2.plist ~/Library/Preferences/.
ln -s `pwd`/ ~/.emacs.d
brew install tmux
brew install ack

if [ ! -f `pwd`/user.init.el ];
then
    cp `pwd`/pristine/user.init.el.default `pwd`/user.init.el
fi

git submodule init
git submodule update

vendor/gitutils/submodule-hooks/install.sh `pwd`
