## Dotfiles
### Description
This is a repository that contains my dotfiles.

### Installation
#### Linux
(*NOTE: below script pushes conflicting files to stash*)
```
export GIT_DIR=$HOME/.dotfiles.git &&
export GIT_WORK_TREE=$HOME &&
git clone --bare --branch linux git@github.com:almaqyn/dotfiles.git $GIT_DIR &&
git config --local status.showUntrackedFiles no &&
git stash push -m "Overridden dotfiles" &&
unset GIT_DIR &&
unset GIT_WORK_TREE
```

#### Minimal (clones a minimal branch, which has only git dotfiles and README.md)
(*NOTE: below script pushes conflicting files to stash*)
```
export GIT_DIR=$HOME/.dotfiles.git &&
export GIT_WORK_TREE=$HOME &&
git clone --bare --branch minimal git@github.com:almaqyn/dotfiles.git $GIT_DIR &&
git config --local status.showUntrackedFiles no &&
git stash push -m "Overridden dotfiles" &&
unset GIT_DIR &&
unset GIT_WORK_TREE
```
