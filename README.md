# Vim Files

My Vim files made from scratch, focusing in plugins that I use. I prefer to type fast,
than having to record many plugins shortcuts.

This configuration is used in VIM terminal, since I stopped to use GUI versions.

## Installing

```console
$ git submodule init
$ git submodule update
```

## Plugins

### Adding a new plugin

```console
$ git submodule add <remote_repo> bundle/<plugin_name>
$ git add bundle/<plugin_name>
$ git commit -m "Adding <plugin_name> plugin"
```

Note that when adding a new submodule you have to add without trailing slash.

### Updating all plugins

```console
$ git submodule foreach git pull
$ git add bundle/plugin1 bundle/plugin2 ... bundle/pluginN
```

Note that when adding a new submodule you have to add without trailing slash.

### Removing

1. Delete the relevant section from the `.gitmodules` file.
2. Delete the relevant section from `.git/config`.
3. Run `git rm --cached path_to_submodule` (no trailing slash).
4. Commit
5. Delete the now untracked submodule files
6. `rm -rf path_to_submodule`

Extracted from: http://stackoverflow.com/questions/1260748/how-do-i-remove-a-git-submodule

## Maintaining

### Go

Copied from `$(brew --prefix go)/misc/vim`.

```console
$ cp -R $(brew --prefix go)/misc/vim bundle/go
```
