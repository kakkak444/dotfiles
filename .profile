#
# ~/.profile
#

if [ -d "$HOME/.local/bin" ]; then
	PATH="$HOME/.local/bin:$PATH"
fi

if uwsm check may-start; then
	exec uwsm start default
fi

. "$HOME/.cargo/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

