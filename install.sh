#!/bin/bash

choice () {
    local choice=$1
    if [[ ${opts[choice]} ]] # toggle
    then
        opts[choice]=
    else
        opts[choice]=+
    fi
}

read -p 'WARNING: This will make you lost all your current configuration for the selected options. Press [Enter] to continue...'
PS3='Please enter your choice: '
while :
do
    clear
    options=("nvim ${opts[1]}" "vim ${opts[2]}" "karabiner ${opts[3]}" "vscode ${opts[4]}" "Done")
    select opt in "${options[@]}"
    do
        case $opt in
            "nvim ${opts[1]}")
                choice 1
                break
                ;;
            "vim ${opts[2]}")
                choice 2
                break
                ;;
            "karabiner ${opts[3]}")
                choice 3
                break
                ;;
            "vscode ${opts[4]}")
                choice 4
                break
                ;;
            "Done")
                break 2
                ;;
            *) printf '%s\n' 'invalid option';;
        esac
    done
done

for opt in "${!opts[@]}"
do
    if [[ ${opts[opt]} ]]
    then
      case $opt in
        1)
          printf '%s\n' 'Symlinking nvim'
          rm -rf ~/.config/nvim
          ln -s $PWD/vim/.vim ~/.config/nvim
          ln -s $PWD/vim/.vimrc ~/.config/nvim/init.vim
          ln -s $PWD/vim/ultisnips ~/.config/coc/ultisnips
          ;;
        2)
          printf '%s\n' 'Symlinking vim'
          rm -rf ~/.vim ~/.vimrc ~/.gvimrc
          ln -s $PWD/vim/.vim ~/.vim
          ln -s $PWD/vim/.vimrc ~/.vimrc
          ln -s $PWD/vim/.gvimrc ~/.gvimrc
          ln -s $PWD/vim/ultisnips ~/.config/coc/ultisnips
          ;;
        3)
          printf '%s\n' 'Symlinking karabiner'
          rm -f ~/.config/karabiner/karabiner.json
          ln -s $PWD/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
          ;;
        4)
          printf '%s\n' 'Symlinking vscode'
          rm -f ~/Library/Application\ Support/Code/User/settings.json
          ln -s $PWD/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
          ;;
      esac
    fi
done
