# Original README from upstream
[here](./README_orig.md)

# Difference
- Use XDG config to have an isolated env
- Add plugin `whichkey`

# Get Started
1. Install the repo to `~/.config/$YOUR_NVIM_ENV_NAME` via `stow`. This will create symlinks to this repo.

``` bash
$ source install.sh
```

2. Append the following to a profile like `.bashrc`:
```bash
# Isolated neovim env
export NVZ=~/.config/nvz
alias nvz='XDG_DATA_HOME=$NVZ/share XDG_CONFIG_HOME=$NVZ nvim'
```
