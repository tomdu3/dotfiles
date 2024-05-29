vim.cmd("let g:netrw_liststyle = 3")

-- set ejs filetype to html
vim.cmd("autocmd BufNewFile,BufRead *.ejs set filetype=html")

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- highlight
-- Set light red color for colorcolumn
vim.cmd("highlight ColorColumn guibg=#FFB6B1 ctermbg=lightred")

-- Set colorcolumn at 80 characters
vim.opt.colorcolumn = "80"

-- Function to set 2-space tabs for specific file types
function SetTwoSpaceTabs()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
end

-- Autocommands to set 2-space tabs for HTML, CSS, and JavaScript
vim.cmd([[
  augroup SetTwoSpaceTabs
    autocmd!
    autocmd FileType html,css,javascript,lua call v:lua.SetTwoSpaceTabs()
  augroup END
]])

-- Function to set color columns for Python files
function SetPythonColorColumns()
    vim.opt_local.colorcolumn = "80,100"
    vim.cmd("highlight ColorColumn ctermbg=red guibg=#FF0000") -- Set the color for the columns
end

-- Autocommand to set color columns for Python files
vim.cmd([[
  augroup SetPythonColorColumns
    autocmd!
    autocmd FileType python call v:lua.SetPythonColorColumns()
  augroup END
]])
