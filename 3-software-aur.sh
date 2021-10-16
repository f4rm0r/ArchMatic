#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~
touch "$HOME/.cache/zshhistory"
git clone "https://github.com/ChrisTitusTech/zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
ln -s "$HOME/zsh/.zshrc" $HOME/.zshrc


PKGS=(
'brave-bin' # Brave Browser
'dxvk-bin' # DXVK DirectX to Vulcan
'lightly-git'
'lightlyshaders-git'
'github-desktop-bin' # Github Desktop sync
'mangohud' # Gaming FPS Counter
'mangohud-common'
'timeshift-bin'
'ttf-meslo' # Nerdfont package
'ocs-url' # install packages from websites
'zoom' # video conferences
'snapd' # snap store
'autojump'
)


for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

snap install openra

echo -e "\nDone!\n"
echo -e "Restart and run sudo /root/ArchMatic/9-post-setup.sh"