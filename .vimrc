"          _
"   __   _(_)_ __ ___  _ __ ___
"   \ \ / / | '_ ` _ \| '__/ __|
"  _ \ V /| | | | | | | | | (__
" (_) \_/ |_|_| |_| |_|_|  \___|
"
" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc.
"              If you are a newbie, basing your first
"              .vimrc on this file is a good choice.
"              If you're a more advanced user, building
"              your own .vimrc based on this file is
"              still a good idea.
" 
"----------------------------------------------------------
" VIM Plugin Management
call plug#begin('~/.vim/plugged')
"
Plug 'flazz/vim-colorschemes'		" Ton of colorschemes for vim
Plug 'vifm/vifm.vim'			" vifm in a vim buffer
Plug 'itchyny/lightline.vim'		" Status Line with Word Count
Plug 'preservim/nerdcommenter'		" Quickly change lines to commented or uncommented
Plug 'voldikss/vim-floaterm'		" Floating terminal window
Plug 'junegunn/fzf.vim'			" Fuzzy file finder in vim
" Plug 'maciakl/vim-neatstatus'		" Simple Status Line adopt colorscheme
" Plug 'godlygeek/tabular'		" Programming tool for lining up code
" Plug 'TheNiteCoder/markdown.vim'	" Markdown helper scripts
" Plug 'PProvost/vim-ps1'		" Syntax Highlighting for PowerShell
call plug#end()
"----------------------------------------------------------
" VIM Plugin Configuration Options
"
" nerdcommenter needed option
filetype plugin on
" nerdcommenter option, adds one space after comment character
let g:NERDSpaceDelims = 1
" nerdcommenter enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" nerdcommenter align line-wise comment delimiters flush left not code indentation
let g:NERDDefaultAlign = 'left'
" lightline - function to add word count to lightline
fun! WordCount()
      if index(g:user_lightline_filetypes_show_wordcount, &ft) < 0
      	return ''
      endif
      let result = wordcount()
      if has_key(result, 'visual_words')
      	return get(result, 'visual_words', 0) . ' words'
      endif
      return get(result, 'words', 0) . ' words'
endfun
" lightline - add WordCount() to lightline and define the files in which it shows up
let g:lightline = {}
let g:lightline.component_function = { 'wordcount' : 'WordCount' }
let g:lightline.active = { 'left' : [ ['mode'], ['readonly', 'filename', 'modified'], ['wordcount'] ] }
" lightline - define a list of filetypes in which word count appears
let g:user_lightline_filetypes_show_wordcount = ['markdown', 'asciidoc', 'text']
" vim-floaterm options
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_autoclose = 1
"__________________________________________________________
" Important Features from https://vim.fandom.com
"
" Set 'nocompatible' to ward off unexpected things that
" your distro might have made, as well as sanely reset
" options when re-sourcing .vimrc
set nocompatible
" Attempt to determine the type of a file based on its
" name and possibly its contents. Use this to allow
" intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on
" Enable syntax highlighting
syntax on
" Enable Spell Checking on .txt files
autocmd BufRead,BufNewFile *.txt setlocal spell
" Turn off Showing VIM mode at bottom because it is in status line
set noshowmode
"------------------------------------------------------------
" Highly Recommended Options from https://vim.fandom.com
" 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden
" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall
" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd
" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
"------------------------------------------------------------
" Usability options {{{1 from https://vim.fandom.com
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline
" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler
" Always display the status line, even if only one window is displayed
set laststatus=2
" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm
" Use visual bell instead of beeping when doing something wrong
set visualbell
" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=
" Enable use of the mouse for all modes
set mouse=a
" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2
" Display line numbers on the left
set number
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200
" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
" Set word wrapping of lines
set wrap linebreak nolist
" Enable System Clipboard
set clipboard=unnamedplus
" Setting up Unlimited Undo
set undodir=~/.vim/undo
set undofile
"------------------------------------------------------------
" Indentation options {{{1 from https://vim.fandom.com
"
" Indentation settings according to personal preference.
" 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4
"------------------------------------------------------------
" Mappings {{{1 from https://vim.fandom.com
"
" Useful mappings
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
"----------------------------------------------------------
" Colorschemes Favorites List
" colo elflord
" colo gruvbox
" colo desert
 colo desert256
" colo wombat256dave
" colo wombat256mod
" colo seashell
" colo night
" colo nordisk
" colo PaperColor
" colo relaxedgreen
" colo mrkn256
"____________________________________________________________
"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()
"__________________________________________________________
" For Fuzzy Searching for Files
set path=
set path+=**
"__________________________________________________________
" Function to Open Asciidoc Syntax Reference
" Put help file path here
let s:asciidoc_help_file = '~/Public/doc/asciidocsyntax.adoc'

fun! s:VAsciidocShowSyntaxHelp()
        if exists('g:user_asciidoc_syntax_help_buffer')
            execute 'bd '. g:user_asciidoc_syntax_help_buffer
            unlet! g:user_asciidoc_syntax_help_buffer
            return
        endif
	execute 'vnew | 0read ' . s:asciidoc_help_file
	setlocal filetype=asciidoc buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
	normal gg
	normal dd
	setlocal nomodifiable
        nnoremap <buffer>q :q<CR> " Makes it so q closes the split
        let g:user_asciidoc_syntax_help_buffer = bufnr("%")
endfun

nnoremap <F8> :call <SID>VAsciidocShowSyntaxHelp()<CR>
"__________________________________________________________

