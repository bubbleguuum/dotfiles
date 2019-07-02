# dotfiles

This config elaborated on openSUSE Tumbleweed starts:

- i3 if login on tty1 console
- Plasma if login on tty2 console
- Plasma  + i3 (replacing kwin) on tty3 console

Although it is primarly used to login on the console, it is also compatible with Display Managers with
proper separation of stuff in files where they belong (.profile, .xinitrc, .xprofile, .bashrc)

It is tweaked for a 27" 4K screen, using 192dpi for fonts and 2x scaling for Plasma.

It uses some common keyboard shortcuts between i3 and Plasma for muscle memory.

Common shortcuts are handled by sxhkd while i3 specific shortcuts are handled in i3's config.
