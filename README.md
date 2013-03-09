## What is this repository?
This repository contains a fully functional Clojure setup of the Emacs editor. rally-emacs contains many hours of setup and discovery
that you would otherwise have to do on your own.

## Why would I want to use Emacs?
We think for a couple of reasons.

1. Emacs is currently the best environment for developing Clojure.
2. Using Emacs allows us to [remote pair](README.md#remote-pairing) without having the "lag" of a VNC session.

## How do I get started?
* First install emacs.  Download a .dmg from http://emacsformacosx.com/  
* Clone this repo.  
* Set up shell
  * If you are using Rally's oh-my-zsh, do a pull and source `.zshrc`.
  * If not, make sure you add the following to your shell.

```bash
export TERM=xterm-256color
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
```

* `cd` into the clone of this repository and run `setup.sh`.

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
* [Clojure with Emacs tutorial] (http://clojure-doc.org/articles/tutorials/emacs.html)
* [Hotkeys] (docs/hotkeys.md)
* [http://www.cs.rutgers.edu/LCSR-Computing/some-docs/emacs-chart.html](http://www.cs.rutgers.edu/LCSR-Computing/some-docs/emacs-chart.html)

## Remote Pairing
1. Launch `iTerm` 
  * Terminal will not currently work correctly
  * Make sure you are using [iTerm2](http://www.iterm2.com/#/section/home)
2. run `tmux`
3. run `emacs`
4. anyone you want to pair with can ssh to your computer then type `tmux attach`
5. to disconnect from the tmux session (but leave it running) type `C-b d`

## Emacs Packages
The following packages are installed the very first time you start emacs.

* [Paredit] (http://emacswiki.org/emacs/PareditCheatsheet) - Helps keep your parens balanced.
* [nrepl] (https://github.com/kingtim/nrepl.el) - Evaluates clojure code within emacs
* [ac-nrepl] (https://github.com/purcell/ac-nrepl) - Provides a function completion list
* [clojure-mode] (https://github.com/technomancy/clojure-mode) - Clojure indentation and navigation
* [find-file-in-project] (http://emacswiki.org/emacs/FindFileInProject) - Searches for files in a project
* What other packages are being installed? What is their purpose? Link to their docs?
