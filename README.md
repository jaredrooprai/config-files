# config-files

Neovim + kitty + zsh setup for macOS (Apple Silicon). `~/.config` is a symlink to this repo.

## What's in here

| Path | Purpose |
| --- | --- |
| `nvim/` | Neovim config (lazy.nvim, LSP, treesitter, telescope, oil, codediff, obsidian, leap) |
| `kitty/` | kitty config, zenbones theme, vim/kitty split navigation (`pass_keys.py`), `macos-launch-services-cmdline` |
| `scripts/` | `kitty-splits.sh` (`vsplit`, `hsplit`, `rename_tab`), `worktree-add`, `worktree-remove` (must be sourced) |
| `tmux/tmux.conf` | tmux pane navigation (read via `~/.config/tmux/tmux.conf`) |
| `karabiner/` | Karabiner-Elements rules (ctrl + numpad -> arrows / ctrl+u) |
| `Brewfile` | Everything installed through Homebrew |

## New machine setup

### 1. Xcode tools, Homebrew, repo

```sh
xcode-select --install

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

mkdir -p ~/code
git clone <this-repo-url> ~/code/config-files
```

### 2. Link `~/.config` to the repo

```sh
# If ~/.config already exists, move anything you want to keep out of it first.
[ -d ~/.config ] && [ ! -L ~/.config ] && mv ~/.config ~/.config.bak
ln -s code/config-files ~/.config
```

### 3. Homebrew packages

```sh
brew bundle --file ~/code/config-files/Brewfile
```

Installs: neovim, ripgrep, tree-sitter-cli, lua-language-server, shfmt, lazygit, nvm, tmux, uv, kitty, JetBrains Mono, Karabiner-Elements.

### 4. Shell (oh-my-zsh + additions to `~/.zshrc`)

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
mkdir -p ~/.nvm
```

Keep the `.zshrc` oh-my-zsh generates. Edit `ZSH_THEME` to `"superjarin"` (ships with oh-my-zsh), leave `plugins=(git)`, then append this to the end of `~/.zshrc`:

```zsh
PROMPT=" $JARIN_CURRENT_LOCA_ "

# Show "tree" in the prompt when inside a linked git worktree
function git_worktree_prompt() {
	local git_dir common_dir
	git_dir=$(git rev-parse --absolute-git-dir 2>/dev/null) || return
	common_dir=$(git rev-parse --path-format=absolute --git-common-dir 2>/dev/null) || return
	[[ "$git_dir" == "$common_dir" ]] && return
	echo "%{$fg[green]%}tree%{$reset_color%} "
}
PROMPT+='$(git_worktree_prompt)'

# Paths (the Obsidian vault is synced through iCloud)
CONFIG_FILES="$HOME/code/config-files"
VAULT="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/Shared"

# Aliases
alias v="nvim"
alias vault="cd \"$VAULT\" && v ."
alias config-files="cd $CONFIG_FILES && v ."
alias wta=worktree-add
alias wtr="worktree-remove --force"
alias ai="agent"

# Open CodeDiff in nvim, or log a message if there's nothing to diff
diff() {
	# Outside a repo, git prints its own "fatal: not a git repository" error
	local changes
	changes=$(git status --porcelain) || return $?

	if [ -z "$changes" ]; then
		echo "nothing to commit, working tree clean"
		return 0
	fi

	nvim -c CodeDiff
}

# Files from this repo (these must be sourced, not executed)
source "$CONFIG_FILES/scripts/kitty-splits.sh"   # vsplit, hsplit, vsplit_cmd, hsplit_cmd, rename_tab
source "$CONFIG_FILES/scripts/worktree-add"      # worktree-add (wta)
source "$CONFIG_FILES/scripts/worktree-remove"   # worktree-remove (wtr)


### 5. Node (via nvm) + global packages for the LSPs

Open a new terminal (so nvm loads), then:

```sh
nvm install 20
npm install -g typescript typescript-language-server @angular/language-server
```

`ts_ls`, `angularls` come from those npm packages; `lua_ls` comes from brew's `lua-language-server`.

### 6. CLI tools (install to `~/.local/bin`)

`~/.local/bin` is added to `PATH` by the `.zshrc` snippet in step 4.

```sh
curl https://cursor.com/install -fsS | bash      # provides `agent` (aliased to `ai`) and `cursor-agent`
curl -fsSL https://claude.ai/install.sh | bash   # provides `claude`
```

Optional, only if you work with Java:

```sh
curl -s "https://get.sdkman.io" | bash
```

### 7. Git

```sh
git config --global user.name "Jared Rooprai"
git config --global user.email "hello@jaredrooprai.com"
git config --global color.ui false
git config --global core.pager "nvim -R"   # neovim as git pager
```

