# use vim as the visual editor
export VISUAL=lvim
export EDITOR=$VISUAL
export LC_ALL=$LANG

# do not overide here, use zshenv.local instead
export CC_GOOD_COMMAND="☻"
export CC_BAD_COMMAND="☻"

# ensure dotfiles bin directory is loaded first
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"
