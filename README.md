# Contents

Configuration files created as accessories to various tools:
 - .bashrc (many terminal emulators, i.e. gnome-terminal, xterm)
 - .vimrc  (vim text editor)
 - i3 config (window manager)
 - compton config (animation handler for i3)
 - i3status config (supplementary monitor bar for i3)

For an outline of prerequisite software, see internal documentation before use.
Backup pre-existing configuration files before using these.

# Installation

For correct placement of these files, see .bashrc's conf() function, which lists
their potential directories. If they do not exist there, use the following
commands:
 - cd /
 - sudo find | grep compton.conf

And obviously change conf() function entries accordingly.

I recommend creating hard links from a clone of this git repo if you'd like your
configuration to be identical to mine:
 - ln /git/repo/.bashrc ~/.bashrc

 This way your ~ directory has a file .bashrc which points to an inode also
 pointed to by git. This means you can place each config file in their
 respective directories and update all at once. Dotfile management will then
 occur all in the git clone directory while the scattered hard-links are reached
 by their respective packages.

# Screenshots:
![ws1](https://user-images.githubusercontent.com/38335668/40662198-009f5830-6399-11e8-95f6-573535e5bc6a.jpg)
![ws2](https://user-images.githubusercontent.com/38335668/40761340-84b32854-64de-11e8-81eb-c31024632cb5.jpg)
![ws4](https://user-images.githubusercontent.com/38335668/40621427-0881506c-62e0-11e8-87ca-ec4575b28b6b.jpg)
![ws10](https://user-images.githubusercontent.com/38335668/40621432-0a44328e-62e0-11e8-9816-040ac434a321.jpg)

