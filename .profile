#
# ~/.profile
#

if [ -d "$HOME/.local/bin" ]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

if uwsm check may-start; then
	exec uwsm start default
fi

. "$HOME/.ghcup/env"

# nix
if [ -d "$HOME/.nix-profile/bin" ]; then
	export PATH="$HOME/.nix-profile/bin:$PATH"
fi

if [ -d "$HOME/.nix-profile/share" ]; then
	export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS"
fi

