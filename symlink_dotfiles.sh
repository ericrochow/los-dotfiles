#!/bin/bash
function verify_dir {
  if [ ! -d "$1" ]; then
    /bin/mkdir -p $1
  fi
  cd $1
}


/bin/ln -s ~/los-dotfiles/.bash_profile
/bin/ln -s ~/los-dotfiles/.bashrc
/bin/ln -s ~/los-dotfiles/.tmux.conf
/bin/ln -s ~/los-dotfiles/.vimrc
/bin/ln -s ~/los-dotfiles/terminator.conf
/bin/ln -s ~/los-dotfiles/.editorconfig
/bin/ln -s ~/los-dotfiles/.selected_editor
/bin/ln -s ~/los-dotfiles/.gitconfig

verify_dir "~/.atom"
/bin/ln -s ~/los-dotfiles/.atom/config.cson
/bin/ln -s ~/los-dotfiles/.atom/keymap.cson
/bin/ln -s ~/los-dotfiles/.atom/styles.less
verify_dir "~/.bash_it"
/bin/ln -s ~/los-dotfiles/.bash_it/bash_it.sh
verify_dir "~/.bash_it/custom"
/bin/ln -s ~/los-dotfiles/.bash_it/custom/personal_aliases.bash
verify_dir "~/.config/Atom"
/bin/ln -s ~/los-dotfiles/.config/Atom/Preferences
verify_dir "~/.config/powerline/config_files"
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colors.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/config.json
verify_dir "~/.config/powerline/config_files/colorschemes"
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/ipython/__main__.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/pdb/__main__.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/pdb/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/pdb/solarized.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/shell/__main__.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/shell/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/shell/solarized.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/solarized.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/tmux/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/tmux/solarized.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/__main__.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/solarized.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/solarizedlight.json
verify_dir "~/.config/powerline/config_files/themes"
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/ascii.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/ipython/in.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/ipython/in2.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/ipython/out.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/ipython/rewrite.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/pdb/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/powerline.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/powerline_unicode7.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/shell/__main__.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/shell/continuation.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/shell/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/shell/default_leftonly.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/shell/select.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/tmux/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/unicode.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/unicode_terminus.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/unicode_terminus_condensed.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/__main__.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/cmdwin.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/default.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/help.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/plugin_commandt.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/plugin_gundo-preview.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/plugin_gundo.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/plugin_nerdtree.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/quickfix.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/vim/tabline.json
/bin/ln -s ~/los-dotfiles/.config/powerline/config_files/themes/wm/default.json
verify_dir "~/.fonts"
/bin/ln -s ~/los-dotfiles/.fonts/AvantGarde_LT_Medium.ttf
/bin/ln -s ~/los-dotfiles/.fonts/DroidSans.ttf
/bin/ln -s ~/los-dotfiles/.fonts/GE_Inspira.ttf
/bin/ln -s ~/los-dotfiles/.fonts/OpenSans-Light.ttf
/bin/ln -s ~/los-dotfiles/.fonts/Ubuntu.ttf
verify_dir "~/.ipython"
/bin/ln -s ~/los-dotfiles/.ipython/profile_default/ipython_config.py
verify_dir "~/.remmina"
/bin/ln -s ~/los-dotfiles/.remmina/remmina.pref
verify_dir "~/.ssh"
/bin/ln -s ~/los-dotfiles/.ssh/config

