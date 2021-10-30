# Migrating from Init.vim -> Init.lua (VimConf 2021)


## What is all of this?

This is the repository for talk that I gave at [VimConf 2021](https://vimconf.live) this year! The actual talk ended up having some serious technical issues unfortunately and I ended up running out of time to talk about everything that I wanted. HOWEVER!! That means that you have more learning content here to explore if you're curious how to move from an `init.vim` -> `init.lua`! This readme should get you through quite a ways through your journey on putting together an `init.lua` file!


### Structure

- `./init.vim` is the basic vimscript config file that we start from in order to migrate to a Lua-focused setup
- `./init.lua` is the basic Lua file that should be a one-to-one mapping from the original init.vim file but in Lua!
- The `lua_advanced_setup` folder is where you will find a more fleshed-out `init.lua`-based setup! It takes what we had in the original `init.vim` file and expands it into multiple different smaller files, shows you how to use `require()` properly, and adds some really cool custom functions and mappings that I used in my setup personally! If you can understand the gist of what is happening in this folder (with my added comments hopefully helping you be able to learn!), you'll be off to the races with your new Lua setup!


### Want to run the slides?

Install the command-line slideshow presenter [patat](https://github.com/jaspervdj/patat) and run the command `patat slides.md` to see my slides live! You'll have to have the Kitty terminal installed to view the images in it (it uses kitty's image feature to render them), but otherwise the content should be there 😃.
