# Chat list for commands to use Lazy vim

### Movement commands

- <number>k _move up than number of lines Ej: 10k_
- <number>j _move down that number of lines Ej: 10j_
- gg Go to the first line
- :$ Go to the last line of the document
- 0 Go to the start of thr line
- ^ Go to the first non-blank character of the line
- $ Go to the end of the line
- w Jump forward to the start of the next word
- b Jump backward to the start of the previous word
- e Jump forward to the end of a word
- G Go to the last line of the document
- <number>G Go to a specific line number Ej: 25G goes to line 25
- Ctrl-d Move half a page down
- Ctrl-u Move half a page up
- Ctrl-o Jump back to previous cursor position
- Ctrl-i Jump forward to next cursor position
- % Jump to matching bracket/parenthesis
- # Search backward for the word under the cursor

### Modes

- i Insert mode (to write and edit files as normal used to)
- Esc Return to Normal mode
- v Visual mode (select text character by character)
- V Visual Line mode (select whole lines)
- Ctrl-v Visual Block mode (select a rectangular block of text)
- R Replace mode (overwrite text as you type)
- : Command mode (run Ex commands)
- a Insert mode, right after the cursor
- A Insert mode, at the end of the line
- o Insert mode, on a new line below
- O Insert mode, on a new line above

### Folder and files management

- <leader>e Open explorer files.
- a creates a new file(With the explorer files opened)
- A creates a new folder(With the explorer files opened)
- d Delete file/folder (With the explorer files opened)
- r Rename file/folder (With the explorer files opened)
- x Cut file/folder (With the explorer files opened)
- y Copy file/folder (With the explorer files opened)
- p Paste file/folder (With the explorer files opened)
- R Refresh explorer
- H Show hidden directories and dotfiles
- <leader>ff Find files (Telescope)
- <leader>fr Recently opened files
- <leader>fg Live grep, search text across the whole project
- <leader>fb Find open buffers
- :w Save current file
- :wa Save all open files
- :q Close current window/buffer
- :qa Quit Neovim (all windows)
- :wq Save and quit
- Ctrl-h Moves to the window on the left (Explorer)
- Ctrl-l Moves to the window on the right (Code or buffers)

### Editing commands

- dd Delete (cut) the current line
- <number>dd Delete that number of lines Ej: 3dd
- yy Copy (yank) the current line
- p Paste after the cursor/line
- P Paste before the cursor/line
- u Undo last change
- Ctrl-r Redo
- x Delete the character under the cursor
- r<char> Replace the character under the cursor with <char>
- cw Change (delete and enter insert mode) the current word
- ciw Change the word under the cursor, regardless of cursor position in it
- dw Delete from cursor to the start of the next word
- D Delete from cursor to the end of the line
- . Repeat the last change
- > > Indent the current line
- << Un-indent the current line
- == Auto-indent the current line

### Search and replace

- / Search forward in the document
- ? Search backward in the document
- n Go to the next search match
- N Go to the previous search match
- :%s/old/new/g Replace all occurrences of "old" with "new" in the file
- :%s/old/new/gc Replace all occurrences, asking for confirmation each time

### Window and buffer management

- <leader>bd Close (delete) current buffer
- Ctrl-w s Split window horizontally
- Ctrl-w v Split window vertically
- Ctrl-w w Move cursor to the next window
- Ctrl-w q Close current window
- Ctrl-w h/j/k/l Move to the window on the left/below/above/right

### LSP (Language Server) commands

- gd Go to definition
- gr Go to references
- K Show hover documentation for the symbol under the cursor
- <leader>ca Show code actions
- <leader>rn Rename symbol under the cursor
- ]d Go to next diagnostic (error/warning)
- [d Go to previous diagnostic
- <leader>cf Format current file

### Git (with LazyVim's built-in git integration)

- <leader>gg Open Lazygit (if installed)
- ]h Go to next git hunk/change
- [h Go to previous git hunk/change
- <leader>gb Show git blame for the current line a creates a new file(With the explorer files opened)
