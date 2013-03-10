##Keybindings

#Working with a file
* `C-v`     -- page down
* `M-v`     -- page up
* `C-x C-s` -- Save current file/buffer
* `C-x C-f` -- Open file
* `C-_`     -- Undo(no need to hold shift)
* `C-k`     -- Will delete an entire context. Everything between parens...

#Working with a buffer/window
* `C-x o`   -- Selects other window
* `C-x 1`   -- deletes window that is not selected...
* `C-x 2`   -- splits window vertically
* `C-x 3`   -- splits window horizontally
* `C-x b`   -- prompts for buffer selection (allows you to switch buffers)
* `C-x C-b` -- opens buffer selection in window
* `C-x k`   -- Kill a buffer

#Working with the nrepl
* `M-x nrepl-jack-in` -- Starts the nrepl
* `M-x nrepl`         -- Connects to an already running nrepl server
* `C-c C-l`           -- Loads the file currently selected (or will prompt to load a file)
* `C-c M-o`           -- Clears repl buffer leaving only prompt
* `C-up C-down`       -- Move up or down history of previously executed functions
