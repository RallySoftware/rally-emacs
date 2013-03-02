##rally-emacs

Hooray we can pair with no lag.  You just need to use emacs.  That isn't a trivial switch to make, but this should help a bunch.  

* First install emacs.  Download a .dmg from http://emacsformacosx.com/  
* Clone this repo.  
* Pull oh-my-zsh.  
* `cd` into the directory and run `setup.sh`.

Restart iterm and you are ready for hot tmuxxx action.

##To start a pairing session

1. Launch `iTerm` 
  * Terminal will not currently work correctly
  * Make sure you are using [iTerm2](http://www.iterm2.com/#/section/home)
2. run `tmux`
3. run `emacs`
4. anyone you want to pair with can ssh to your computer then type `tmux attach`
5. to disconnect from the tmux session (but leave it running) type Control+b, d

##Update your shell

If you use the Rally Software version of oh-my-zsh you will have these changes to your shell.  If not, add these lines to you shell configuration:

```bash
export TERM=xterm-256color
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
```

## Emacs Packages

The following packages are installed the very first time you start emacs.

* [Paraedit] (http://emacswiki.org/emacs/PareditCheatsheet) - Helps keep your parens balanced.
* What other packages are being installed? What is their purpose? Link to their docs?

## Getting Started with Emacs

Maybe a couple of examples of the most important commands. Maybe a link to a more complete list of shutcuts.
