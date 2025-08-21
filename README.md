I previously used [LunarVim](https://www.lunarvim.org/), which gives you a
ready to use neovim experience including many well known plugins. It's really
helpful (try it if you want!) but can be a pain to debug when something doesn't
work as expected, because you probably know next to nothing about neovim if
you're using something like LunarVim. At least that was my case.

Not so long ago I needed to configure some LSP and, while I knew the plugins
that come with LunarVim are pinned to specific versions from the past, I didn't
know they were that old (maybe more than a year ago), and I learned it the hard
way (not realizing I was missing something from a newer version).

Yes, it's possible to overwrite those versions and use the latest ones instead,
but that's more configuration than what I would have expected. Furthermore,
LunarVim seems to not get too much maintenance lately. All of these were just
excuses so I could finally write my own fresh neovim configuration. This is
what I have, and as a result, most of it resembles what I could do with LunarVim
because I'm already used to work like that.

Disclaimer: I'm reading some config documentation here and there, but I mostly
created my config using ChatGPT. No shame. I was just not that interested in 
reading so much documentation. Maybe I will later on, as I get to improve this.
