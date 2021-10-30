---
title: Migrating from init.vim to init.lua
author: Ben Smith
date: 2021-10-29

---

# Notes for talk

## Reasons why people haven't switched / questions people have

- Lack of Lua support for:
  - :command
  - :autocmd
  - :highlight
  - Can't put functions into mappings
- Confusion around vim.opt / vim.bo / vim.wo / vim.o
- How steep is the Lua learning curve?
- How *actually* insane is the performance (lua vs vimscript)?
- How do different plugin managers work? (packer, paq, etc)
- Support for remaps in Lua elegantly?
- Lua development setup? (sumneko_lua, formatter, repl, etc)
- Basic autocompletion setup?
- Lua vs Vimscript? Why use one over the other?
- VimPlug -> packer.nvim
- Should you switch to *only* Lua? (no, common misconception)
  - Can you switch in parts/migrate a little at a time? (YES!)
    - `vim.cmd [[runtime vimscript/functions.vim]]` <- source vimscript files from Lua
- Statusline and highlight groups set from Lua?
- How much Lua do I need to know?
- Lua versions of `let/set/map` -> `vim.g`
- Abbreviation `abbr` commands in Lua
- How to import Lua modules
  - https://vi.stackexchange.com/questions/34616/how-to-add-config-nvim-into-runtime-path-for-lua
- Avoiding breaking changes to APIs and such on nightly



## Init.vim files

- https://github.com/nagy135/dots/blob/master/nvim/.vimrc
- https://github.com/matu3ba/dotfiles/blob/master/.config/nvim/init.lua
- u/HellsMaddy
  - Lua: https://github.com/b0o/nvim-conf
  - Vimscript: https://github.com/b0o/nvim-conf/tree/4027fe85e8b71543c417d1f1c22b913b5e8563f9
- https://git.sr.ht/%7Esanchayanmaity/dotfiles/tree/master/item/nvim/.config/nvim
- https://github.com/mrjones2014/dotfiles/tree/master/.config/nvim
- https://github.com/MitchMarq42/dotfiles/tree/main/.config/nvim
- https://github.com/augustocdias/dotfiles/tree/main/.config/nvim
- https://github.com/JuanVqz/dotfiles/blob/main/config/nvim/init.vim
- u/toddyk
  - Vimscript: https://github.com/toddyamakawa/vim
  - Lua: https://github.com/toddyamakawa/nvim



## Advanced questions out of scope of the talk

- How does caching in LuaJit work?
- Are files that depend on reloaded/rejitted files also required to be reloaded/rejitted?
- What is the ecosystem for caching behavior (i.e. how does packer.nvim or plenary do it)?
- Is there a performance cost for `vim.cmd` calls or other Lua APIs?
- How do you measure performance of your configuration?
- How do you lazy load plugins or setup files?


## References to add

- [Why embed Lua instead of X? (Neovim FAQs)](https://github.com/neovim/neovim/wiki/FAQ#why-embed-lua-instead-of-x)
- [What is LSP? (Microsoft)](https://microsoft.github.io/language-server-protocol/)
- [What is Treesitter? (FOSDEM)](https://www.youtube.com/watch?v=0CGzC_iss-8)
- TJ
  - [Treesitter & LSP Compared](https://youtu.be/c17j09vY5sw)
  - [Why did Neovim add a builtin LSP client?](https://www.youtube.com/watch?v=ArwDgvYEZYk)
  - [What is Neovim builtin LSP?](https://www.youtube.com/watch?v=C9X5VF9ASac)
  - [Why Lua is a good fit for Neovim](https://www.youtube.com/watch?v=IP3J56sKtn0)
