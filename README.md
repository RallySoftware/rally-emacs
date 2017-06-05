## What is this repository?
This repository contains a fully functional Clojure setup of the Emacs editor. rally-emacs contains many hours of setup and discovery
that you would otherwise have to do on your own.

## Why would I want to use Emacs?
We think for a couple of reasons.

1. Emacs is currently the best environment for developing Clojure.
2. Using Emacs allows us to [remote pair](README.md#remote-pairing) without having the "lag" of a VNC session.

## How do I get started?
* Make sure you have the latest emacs. Maverick comes with version 22 but you need 24 for rally emacs to work
* `emacs --version`
* Get the latest emacs if needed:
* `brew update`
* `brew install emacs --with-cocoa`
* Clone this repo.
* Quit `iterm2` and launch `terminal`
* `cd` into the clone of this repository and run `setup`.
* `source ~/.zshrc` or restart your terminal session.
* Quit `terminal` and launch `iterm2` (rally-emacs only works in `iterm2`)

## Setup Protips
* Rally-emacs has been tested in `iTerm` with some custom `iTerm` config. To make sure everything is setup just right. Quit the `iTerm` process. Open `Terminal`. Run `setup`. Quit `Terminal`. Reopen `iTerm`.
* Make sure your `~/.zshrc` has `emacs` in the `plugin` list

## Using Stable version of Cider

By default, we use the snapshot version of cider and cider-nrepl.

If you have problems with this, and want to use the stable versions, here is what you need to do:

- Change the symlink of `profiles.clj` in `~/.lein` to point to `profiles-stable.clj` instead of `profiles.clj` in the root of this repo.
- In `~/.emacs.d` create a folder named `checkouts`
- Inside checkouts, clone cider and clj-refactor from github (see below), and checkout the tags for the stable versions
- Restart emacs

```
> cd ~/.lein
> rm profiles.clj
> ln -s ~/project/rally-emacs/profiles-stable.clj profiles.clj
> cd ~/.emacs.d
> mkdir checkouts
> cd checkouts
> git clone https://github.com/clojure-emacs/cider
> git clone https://github.com/clojure-emacs/clj-refactor.el
> cd cider
> git checkout v0.8.2
> cd ../clj-refactor.el
> git checkout 1.0.5
```

## OK, Now what? How do I use Emacs?
It does take some work to become an emacs master, but with just a few keyboard shortcuts you can get started.

```bash
cd your_clojure_project_directory

emacs . 
```
After running this, you should be taken to a list of files/directories that are in your projects home directory.
Use your arrow keys to select the file you want to open and hit enter.

Congratulations!!! You are now editing your first file. The following keyboard shortcuts should get you started.

* `C-x C-s`              Save the current file (buffer)
* `C-x C-f`              Open another file (or create a new file)
* `M-x nrepl-jack-in`    Start a clojure nrepl session
* `C-x C-k`              Load the current file into the repl

Note: `C-x` means hold the control key and press x. `M-x` means hold the meta (alt/option) key and press x. After you have mastered 
the above keyboard shortcuts, you can find more information below.

* To launch the emacs tutorial press `C-h t`
* [Clojure with Emacs tutorial](http://clojure-doc.org/articles/tutorials/emacs.html)
* [Hotkeys](docs/hotkeys.md)
* [http://www.cs.rutgers.edu/LCSR-Computing/some-docs/emacs-chart.html](http://www.cs.rutgers.edu/LCSR-Computing/some-docs/emacs-chart.html)

## Remote Pairing
1. Launch `iTerm` 
  * Terminal will not currently work correctly
  * Make sure you are using [iTerm2](http://www.iterm2.com/#/section/home)
2. run `tmux`
3. run `emacs`
4. anyone you want to pair with can ssh to your computer then type `tmux attach`
5. to disconnect from the tmux session (but leave it running) type `C-b d`

## But wait, I can't live without my forked version of \<obscure .el package\>!

You can put your own `.emacs` or `.init.el` in `~/.emacs.d/user.init.el`. This file will be loaded at the end of the default init file.

## Emacs Packages
The following packages are installed the very first time you start emacs.

* [Paredit](http://emacswiki.org/emacs/PareditCheatsheet) - Helps keep your parens balanced.
* [nrepl](https://github.com/kingtim/nrepl.el) - Evaluates clojure code within emacs
* [ac-nrepl](https://github.com/purcell/ac-nrepl) - Provides a function completion list
* [clojure-mode](https://github.com/technomancy/clojure-mode) - Clojure indentation and navigation
* [find-file-in-project](http://emacswiki.org/emacs/FindFileInProject) - Searches for files in a project
* What other packages are being installed? What is their purpose? Link to their docs?
