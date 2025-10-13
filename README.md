My neovim + kitty integrated setup

brew install neovim\
brew install ripgrep\
brew install bat\
brew install --cask kitty\
brew install --cask font-jetbrains-mono

Neovim as git pager
git config --global core.pager "nvim -R"\
git config --global color.ui false\

Bat for git status pager
git config --global pager.status bat
