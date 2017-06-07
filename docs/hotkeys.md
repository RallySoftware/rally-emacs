File/buffer/window commands
===========================
* `C-x C-f`     Find file
* `C-c f`       Find a file within the current git project
* `C-x C-s`     Save buffer
* `C-x s`       Save file (like save-as)
* `C-x b`       Switch buffer
* `C-x k`       Kill buffer
* `C-x 1`       Delete other windows
* `C-x 0`       Delete current window
* `C-x 2`       Split window horizontally
* `C-x 3`       Split window vertically
* `S-Arrow`     Activate window to the direction you press
* `C-S-Arrow`   Shrink or grow active window
* `F9`          Toggle paredit mode (will default to on for clojure)
* `M-x`         Run/search for a command

Movement commands
=================
* `C-a`         Beginning of line
* `C-e`         End of line
* `C-n`         Next line (down)
* `C-p`         Previous line (up)
* `C-b`         Back (left)
* `C-f`         Forward (right)
* `M-f`         Forward a word
* `M-b`         Back a word
* `C-v`         Forward a page
* `M-v`         Back a page

Edit commands
=============
* `C-d`         Kill character
* `M-d`         Kill word
* `M-delete`    Kill word backwards

Misc commands
=============
* `C-s`         Regex search forwards
* `C-r`         Regex search backwards
* `M-%`         Query replace

Help commands
=============
* `C-h t`     Tutorial (goes over the basics)
* `C-h b`     Describe all current key bindings
* `C-h m`     Describe the current mode
* `C-h a`     Apropos - search the help for a term
* `C-h k`     Describe key

Clojure Commands
================
* `C-c ,`          Run tests
* `C-c '`          View test failure messages
* `C-c C-k`        Compile and load buffer
* `C-x C-e`        Evaluate sexp
* `M-.`            Jump to definition
* `M-/`            Auto-complete word
* `q`              Dismiss a temporary buffer that has appeared
* `C-c C-d C-d`    Show docs for function
* `C-x C-i`        Fuzzy-find all symbols in buffer

NRepl Commands
==============
* `M-x nrepl-jack-in` Starts the nrepl
* `M-x nrepl`         Connects to an already running nrepl server
* `C-c C-l`           Loads the file currently selected (or will prompt to load a file)
* `C-c M-n`           Load namespace of active buffer into REPL
* `C-c M-o`           Clears repl buffer leaving only prompt
* `C-up C-down`       Move up or down history of previously executed functions
* `M-p`               Back through REPL history
* `C-c M-j`           Alternate start for nrepl
