# neovim
Minimal productive configuration

requires neovim or vim 8+ (tested on neovim)
(for full functionality also requires pyhton 2 and python 3 and corresponding vim mappings installed)
(usage of a fuzzy finder for files is recommended: FZF, CtrlP, ...)

![](https://raw.github.com/lifepillar/Resources/master/solarized8/solarized8_dark_flat.png)

```vim
colorscheme solarized8_high
enable airline

let mapleader = "\<space>"
let maplocalleader = "\<space>"
```

## Configuration
- init.vim - contains all the basic settings
- terminal.vim - in-vim terminal configuration, automatically loaded if terminal is available
- coc.vim - completion configuration, automatically loaded
- local.vim - custom configuration, loaded after everything else if present

## Customizing and overrides
Place custom configuration and overrides into "local.vim" at vim root.

## Contains
Completion:
- coc.nvim
	- LSP (language server protocol) enabled completion engine, for full IDE level language support
	- see [this link](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) for help with installing extensions
- UltiSnips, vim-snippets
	- code snippets for coc.nvim
- Denite
  - coc dialogues

Plugins:
- vim-surround + vim-jdaddy + vim-ragtag
  - surround word objects with braces/brackets/tags
  - extends vim word objects for json and tags
- auto-pairs
  - automatically insert closing brackets
- vim-commentary
  - ```gc<MOTION>``` to comment/uncomment
- vim-unimpaired
  - ```[<space>``` to insert an empty line up
  - ```]e``` to exchange line downwards
  - ```[o``` to toggle options (s - spell, | - column highlight, n - absolute
    numbering, ...)
- vim-obsession
  - automagical session tracking (creates + updates + sources Session.vim)
  - ```:Obsession``` to start
- vim-easymotion
  - ```<leader><leader>``` to trigger movement helper
- vim-abolish
  - :Abolish to create abbreviations for derivations
  - :Subvert to search for derivations
  - crc (coerce camel case), csc (coerce snake case), ...
- vim-eunuch
  - commands for Linux file handling: ```:Move```, ```:Rename```, ```:Delete```, ```:Chmod```, ```:SudoWrite```, ...
  - new files with shebang are made executable
  - new init scripts are prepopulated with ```/etc/init.d/skeleton```
- vim-trailing-whitespace
  - highlight trailing whitespace
  - ```:FixWhitespace``` for quick fix
- vim-vinegar
  - sane defaults for netrw
  - ```-``` to jump into directory view
- vim-css-color
  - shows css color as background
- vim-repeat
  - makes plugins ```.``` repeatable
- rainbow_parentheses.vim
  - colors matching parentheses for lisp dialects
- vim-markdown
  - sane defaults for markdown files

Git plugins:
- vim-git
  - syntax, indent, filetype detect for ```git, gitcommit, gitconfig, gitrebase, and gitsendemail```
- vim-fugitive
  - ```:Gstatus``` for ```git status```, use ```-``` to add/reset changes
  - ```:Gdiff``` to see changes and stage a subset of them
  - ```:Gcommit``` to commit (brings up a message buffer)
  - ```:Ggrep``` ```:Gmove``` ```:Gdelete``` ...
  - shows changes + branch in the status line
- vim-gitgutter
  - shows git changes in the sign collumn

---
by [WhoMeNope](https://github.com/whomenope/nvim)
