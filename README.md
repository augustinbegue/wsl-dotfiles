# Execute the script

# Or

-   register the alias:

```sh
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

-   make the source repo ignore the folder where its cloned

```sh
echo ".cfg" >> .gitignore
```

-   clone the dotfiles into a bare repo in a _dot_ folder of the $HOME:

```sh
git clone --bare <git-repo-url> $HOME/.cfg
```

-   setup the repo

```sh
config checkout
config config --local status.showUntrackedFiles no
```
