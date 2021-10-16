---
title: Migrating from init.vim to init.lua
author: Ben Smith
date: 2021-10-29
patat:
  incrementalLists: true
  pandocExtensions:
    - patat_extensions
  slideLevel: 2
  margins:
    left: 20
    right: 20
  images:
    backend: iterm2
  eval:
    lua_eval:
      command: luajit
      fragment: true
      replace: false
# this presentation uses [patat](https://github.com/jaspervdj/patat)
---

# Migrating from init.vim to init.lua

# Who Am I?


## Me

![](greenshirt-smile-scaled.jpg)



## Who am I?

- Web Developer at [Vincit USA](https://vincit.com)
- Recent college graduate from UC Irvine with a degree in Informatics
- Passionate about open-source software, Neovim, command line, Unix
- Manchester United and Golden State Warriors fan
- Drinks of choice are coffee, gin and tonics, dry hard ciders



# About this talk

## What this talk is *NOT*

- Lua !> Vimscript (they both have their places!)
- Deep dive into internals of Neovim
- Deep dive into Lua, Lua syntax, or LuaJit
- Optimizations for performance
- What is LSP?
- What is Treesitter?
- Comparison of package managers
- Comparison of Lua plugins vs Vimscript plugins



## Well, what if I wanted this talk to be about those things?

### Resources for further learning about a number of the topics:

> - [Why embed Lua instead of X? (Neovim FAQs)](https://github.com/neovim/neovim/wiki/FAQ#why-embed-lua-instead-of-x)
> - [What is LSP? (Microsoft)](https://microsoft.github.io/language-server-protocol/)
> - [What is Treesitter? (FOSDEM)](https://www.youtube.com/watch?v=0CGzC_iss-8)
> - [Learning how to write and use Lua in Neovim (Nanotee's guide)](https://github.com/nanotee/nvim-lua-guide)

### Resources from Telescopic Johnson (TJ DeVries) himself

> - [Treesitter & LSP Compared](https://youtu.be/c17j09vY5sw)
> - [Why did Neovim add a builtin LSP client?](https://www.youtube.com/watch?v=ArwDgvYEZYk)
> - [What is Neovim builtin LSP?](https://www.youtube.com/watch?v=C9X5VF9ASac)
> - [Why Lua is a good fit for Neovim](https://www.youtube.com/watch?v=IP3J56sKtn0)



## What this talk *IS*

- How to start your Lua journey in Neovim
- Common Lua syntax and Lua config mistakes and misconceptions
- Writing basic configuration with the Lua APIs instead of Vimscript
- Writing your first custom functions/mappings
- Assorted tips/tricks I've picked up over the last year of my Neovim journey
- Live demo of migrating a configuration!



# How I hope you feel after this presentation

![](pepegaHackerman.gif)

# How I feel about doing a live demo of tweaking configuration

![](monkaGiga.gif)



## Why choose Lua as a tool in your config setup?

- Fast
- Forgiving syntax
- Relatively simple and small language
- Fun to use (I'm a bit biased :D)



# Common misconceptions about Lua syntax
## Common misconceptions about Lua syntax

### `require`-ing modules

```lua
require('plugins.telescope')
require('plugins/telescope')
require('plugins\telescope')
```

### String or curly brackets following the name of a function??

```lua
require"telescope.builtin".find_files {}
```



# Common functions, variables, and concepts when configuring with Lua

## Neovim-specific variables

- Vimscript

```vim
let g:name = 'Ben Smith'
let w:name = 'Ben Smith'
let b:name = 'Ben Smith'
let t:name = 'Ben Smith'
```

- Lua

```lua
vim.g.name = 'Ben Smith'
vim.w.name = 'Ben Smith'
vim.b.name = 'Ben Smith'
vim.t.name = 'Ben Smith'
```

## `set` command in Neovim

- Vimscript

```vim
" boolean
set autoindent/noautoindent
" number
set shiftwidth=2
" string
set wildmode=full
```

- Lua

```lua
-- boolean
vim.opt.autoindent = true
-- number
vim.opt.shiftwidth = 2
-- string
set wildmode = 'full'
```


## Keymappings

- Vimscript

```vim
" map lhs rhs
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
```

- Lua

```lua
-- vim.api.nvim_set_keymap(mode, lhs, rhs, options_table)

-- normal
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require('telescope.builtin').find_files()<cr>', { noremap = true })
```



## Miscellaneous tips and tricks 

- Search the help docs efficiently!
    * use `:helpgrep your-query-here` to search for a regex pattern in the help docs
    * use [Telescope](https://github.com/nvim-telescope/telescope.nvim)'s `help_tags` picker to search for tags in the help docs
        + `:lua require('telescope.builtin').help_tags()`
- Ask questions on [Discourse](https://discourse.neovim.io) and the [subreddit](https://reddit.com/r/neovim)



# Demo time!



# Thank you, any questions?
