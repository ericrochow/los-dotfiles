#!/bin/bash
function verify_dir {
  if [ ! -d $1 ]; then
    /bin/mkdir -p $1
  fi
  cd $1
}

cd ~

# Verify bash-it is cloned
if [ ! -d ~/.bash_it ]; then
  /usr/bin/git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  /usr/bin/git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ ! -f ~/.vim/black/bin/activate ]; then
  /usr/bin/virtualenv --python=python3 ~/.vim/black
fi

source ~/.vim/black/bin/activate
pip install black
deactivate

/bin/ln -s -f ~/los-dotfiles/.bash_profile
/bin/ln -s -f ~/los-dotfiles/.bashrc
/bin/ln -s -f ~/los-dotfiles/.tmux.conf
/bin/ln -s -f ~/los-dotfiles/.vimrc
/bin/ln -s -f ~/los-dotfiles/terminator.conf
/bin/ln -s -f ~/los-dotfiles/.editorconfig
/bin/ln -s -f ~/los-dotfiles/.selected_editor
/bin/ln -s -f ~/los-dotfiles/.gitconfig

verify_dir "~/.atom"
/bin/ln -s -f ~/los-dotfiles/.atom/config.cson
/bin/ln -s -f ~/los-dotfiles/.atom/keymap.cson
/bin/ln -s -f ~/los-dotfiles/.atom/styles.less


verify_dir "~/.bash_it"
/bin/ln -s -f ~/los-dotfiles/.bash_it/bash_it.sh


verify_dir "~/.bash_it/custom"
/bin/ln -s -f ~/los-dotfiles/.bash_it/custom/personal_aliases.bash


verify_dir "~/.config/Atom"
/bin/ln -s -f ~/los-dotfiles/.config/Atom/Preferences


verify_dir "~/.config/powerline/config_files"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colors.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/config.json


verify_dir "~/.config/powerline/config_files/colorschemes"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/default.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/solarized.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/colorschemes/ipython/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/ipython/__main__.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/colorschemes/pdb/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/pdb/__main__.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/pdb/default.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/pdb/solarized.json


verify_dir "/los-dotfiles/.config/powerline/config_files/colorschemes/shell/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/shell/__main__.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/shell/default.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/shell/solarized.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/colorschemes/tmux/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/tmux/default.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/tmux/solarized.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/__main__.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/default.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/solarized.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/colorschemes/vim/solarizedlight.json


verify_dir "~/.config/powerline/config_files/themes"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/ascii.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/powerline.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/powerline_unicode7.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/unicode.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/unicode_terminus.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/unicode_terminus_condensed.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/themes/ipython/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/ipython/in.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/ipython/in2.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/ipython/out.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/ipython/rewrite.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/themes/pdb/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/pdb/default.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/themes/shell/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/shell/__main__.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/shell/continuation.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/shell/default.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/shell/default_leftonly.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/shell/select.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/themes/tmux/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/tmux/default.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/themes/vim/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/__main__.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/cmdwin.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/default.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/help.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/plugin_commandt.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/plugin_gundo-preview.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/plugin_gundo.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/plugin_nerdtree.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/quickfix.json
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/vim/tabline.json


verify_dir "~/los-dotfiles/.config/powerline/config_files/themes/wm/"
/bin/ln -s -f ~/los-dotfiles/.config/powerline/config_files/themes/wm/default.json


verify_dir "~/.fonts"
/bin/ln -s -f ~/los-dotfiles/.fonts/AvantGarde_LT_Medium.ttf
/bin/ln -s -f ~/los-dotfiles/.fonts/DroidSans.ttf
/bin/ln -s -f ~/los-dotfiles/.fonts/GE_Inspira.ttf
/bin/ln -s -f ~/los-dotfiles/.fonts/OpenSans-Light.ttf
/bin/ln -s -f ~/los-dotfiles/.fonts/Ubuntu.ttf


verify_dir "~/.ipython/profile_default/"
/bin/ln -s -f ~/los-dotfiles/.ipython/profile_default/ipython_config.py


#verify_dir "~/.ssh"
#/bin/ln -s -f ~/los-dotfiles/.ssh/config

/usr/bin/vim +PluginInstall +qall
