sudo pacman -S base-devel
sudo pacman -S git

cd /opt
sudo git clone https://aur.archlinux.org/yay.git

sudo chown -R m4r0s1:users ./yay

cd yay
makepkg -si


yay -S nerd-fonts-ubuntu-mono

cd ~/.config
git clone https://github.com/antoniosarosi/dwm.git
mkdir -p ~/.local/share/dwm
ln -s ~/.config/dwm/autostart.sh ~/.local/share/dwm

mkdir -p ~/.local/bin
cd ~/.local/bin
curl -sL "https://raw.githubusercontent.com/antoniosarosi/dotfiles/master/.local/bin/battery" -o battery
curl -sL "https://raw.githubusercontent.com/antoniosarosi/dotfiles/master/.local/bin/volume" -o volume
curl -sL "https://raw.githubusercontent.com/antoniosarosi/dotfiles/master/.local/bin/percentage" -o percentage
curl -sL "https://raw.githubusercontent.com/antoniosarosi/dotfiles/master/.local/bin/brightness" -o brightness
chmod 755 battery volume percentage brightness

sudo pacman -S pacman-contrib brightnessctl pamixer upower

export PATH=$HOME/.local/bin:$PATH

cd ~/.config/dwm
sudo make clean install
cd ~/.config/dwm/dwmblocks
sudo make clean install
sudo cp ~/.config/dwm/dwm.desktop /usr/share/xsessions

Xephyr -br -ac -noreset -screen 1366x768 :1 &
DISPLAY=:1 dwm

cd ~/.config/dwm/dwmblocks
sudo make clean install