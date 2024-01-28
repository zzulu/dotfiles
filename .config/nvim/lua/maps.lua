local keymap = vim.keymap


keymap.set('n', '<C-d>', '<C-d>zz')
keymap.set('n', '<C-u>', '<C-u>zz')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

