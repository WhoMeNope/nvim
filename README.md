# neovim
Minimal productive configuration

requires neovim or vim 8+ (tested on neovim)

![](https://raw.github.com/lifepillar/Resources/master/solarized8/solarized8_dark_256.png)

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
- neosnippet.vim + neosnippet-snippets
	- code snippets for coc.nvim

Plugins:
- vim-surround + vim-jdaddy + vim-ragtag
- auto-pairs
- vim-commentary
- vim-unimpaired
- vim-obsession
- vim-easymotion
- rainbow_parentheses.vim
- vim-markdown
- vim-abolish
- vim-eunuch
- vim-vinegar
- vim-css-color
- vim-repeat

Git plugins:
- vim-git
- vim-gitgutter
- vim-fugitive

---
by [WhoMeNope](https://github.com/whomenope/nvim)
