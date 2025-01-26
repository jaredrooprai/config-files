My neovim + kitty integrated setup

brew install neovim\
brew install ripgrep\
brew install --cask kitty\
brew install --cask font-jetbrains-mono

Neovim as git pager
git config --global core.pager "nvim -R"\
git config --global color.ui false\
