# configs

Configuration files created as accessories to various tools:
 - .bashrc (many terminal emulators, i.e. gnome-terminal, xterm)
 - .vimrc  (vim text editor)
 - i3 config (window manager)
 - compton config (animation handler for i3)
 - i3status config (supplementary monitor bar for i3)

For an outline of prerequisite software, see internal documentation before use.
Backup pre-existing configuration files before using these.

For correct placement of these files, see .bashrc's conf() function, which lists
their potential directories. If they do not exist there, use the following
commands:
 - cd /
 - sudo find | grep compton.conf
And obviously change conf() function entries accordingly.

