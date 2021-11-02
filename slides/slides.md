---
title: Migrating from init.vim to init.lua
author: Ben Smith
date: 2021-10-29
---

# Migrating from init.vim to init.lua

---

## whoami

<section class='grid-3'>

![](images/greenshirt-smile-scaled.jpg)

- Web Developer 👨‍💻at [Vincit USA](https://vincit.com)
- Recent college graduate 👨‍🎓from UC Irvine with a degree in Informatics
  - (*yes, nobody else has heard of this degree, you're not crazy*)
- Passionate about open-source software, Neovim, command line, Unix
- Manchester United ⚽️ and Golden State Warriors 🏀 fan
- Drinks of choice are coffee ☕️, gin and tonics 🥃, dry hard ciders 🍻

![](images/graduate-scaled.jpg)

</section>

---

# About this talk

---

## What this talk is *NOT*

- Lua !> Vimscript (they both have their places!)
- Deep dive into internals of Neovim
- Deep dive into Lua, Lua syntax, or LuaJit
- Optimizations for performance
- What is LSP?
- What is Treesitter?
- Comparison of package managers
- Comparison of Lua plugins vs Vimscript plugins

---


# Well, what if I wanted this talk to be about those things?

---

### Resources for further learning about a number of the topics:

- [Why embed Lua instead of X? (Neovim FAQs)](https://github.com/neovim/neovim/wiki/FAQ#why-embed-lua-instead-of-x)
- [What is LSP? (Microsoft)](https://microsoft.github.io/language-server-protocol/)
- [What is Treesitter? (FOSDEM)](https://www.youtube.com/watch?v=0CGzC_iss-8)
- [Learning how to write and use Lua in Neovim (Nanotee's guide)](https://github.com/nanotee/nvim-lua-guide)
- [Programming in Lua: a detailed look at the Lua programming language](https://www.lua.org/pil/contents.html)

---

### Resources from Telescopic Johnson (TJ DeVries) himself

- [Treesitter & LSP Compared](https://youtu.be/c17j09vY5sw)
- [Why did Neovim add a builtin LSP client?](https://www.youtube.com/watch?v=ArwDgvYEZYk)
- [What is Neovim builtin LSP?](https://www.youtube.com/watch?v=C9X5VF9ASac)
- [Why Lua is a good fit for Neovim](https://www.youtube.com/watch?v=IP3J56sKtn0)

---

## What this talk *IS*

- How to start your Lua journey in Neovim
- Common Lua syntax and Lua config mistakes and misconceptions
- Writing basic configuration with the Lua APIs instead of Vimscript
- Writing your first custom functions/mappings
- Assorted tips/tricks I've picked up over the last year of my Neovim journey
- Live demo of migrating a configuration!

---

## How I hope you feel after this presentation

![](images/pepegaHackerman.gif)

---

## Why choose Lua as a tool in your config setup?

- Fast
- Forgiving syntax
- Relatively simple and small language
- Fun to use (I'm a bit biased :D)

---

# Common misconceptions about Lua syntax

---

## `require`-ing modules
```lua
-- lua handles directory separators for you with dots!
require('plugins.telescope')
-- if you *really* want your unix file path...
require('plugins/telescope')
-- or for you windows users (yes, we have to escape the backslash):
require('plugins\\telescope')
```

---

## What's that string/`{}` after a function??

```lua
-- the following line is
require"telescope.builtin".find_files {}
-- same as this one:
require("telescope.builtin").find_files({})
```
- If you are passing a `string` or `table` as a *single* parameter to a function, the parenthesis may be omitted

---

## What is the colon between two functions?

```lua
local name = 'Ben Smith'

-- this is the same
string.match(name, 'Ben')
-- as this:
name:match('Ben')
```
- Lua's version of object-oriented programming (OOP)
- Passes the item you call the function on as the first parameter to the function

---

## Common functions, variables, and concepts when configuring with Lua

---

## Neovim-specific variables

<section class='code-compare'>

### Vimscript

```vim
" global
let g:name = 'I am globally available!'
" tab-local
let t:name = 'I am available to this tabpage!'
" window-local
let w:name = 'I am available to this window!'
" buffer-local
let b:name = 'I am available to this buffer!'
```

### Lua

```lua
-- global
vim.g.name = 'I am globally available!'
-- tab-local
vim.t.name = 'I am available to this tabpage!'
-- window-local
vim.w.name = 'I am available to this window!'
-- buffer-local
vim.b.name = 'I am available to this buffer!'
```

</section>

---

## `set` command in Neovim

<section class='code-compare'>

### Vimscript

```vim
" boolean
set autoindent/noautoindent
" number
set shiftwidth=2
" string
set wildmode=full
```

### Lua

```lua
-- boolean
vim.opt.autoindent = true
-- number
vim.opt.shiftwidth = 2
-- string
set wildmode = 'full'
```

</section>

---

## Keymappings

<section class='code-compare'>

### Vimscript

```vim
" |mode|no-recursive|map lhs rhs
nnoremap <leader>ff <cmd>lua
	\ require('telescope.builtin').find_files()<cr>
```

### Lua

```lua
-- vim.api.nvim_set_keymap(mode, lhs, rhs, options_table)
vim.api.nvim_set_keymap(
	'n', -- normal mode
	'<leader>ff', -- lhs
	[[<cmd>lua require'telescope.builtin'.find_files()<cr>]],
	{ noremap = true, silent = true } -- options_table
)
```

</section>

---

## Miscellaneous tips and tricks 

- Search the help docs efficiently!
  - use `:helpgrep your-query-here` to search for a regex pattern in the help docs
  - use [Telescope](https://github.com/nvim-telescope/telescope.nvim)'s `help_tags` picker to search for tags in the help docs
    - `:lua require('telescope.builtin').help_tags()`
- Ask questions on [Discourse](https://discourse.neovim.io) and the [subreddit](https://reddit.com/r/neovim)

---

# Demo time!

![](images/monkaGiga.gif)
