def update-grub [] {
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
}
def show-diskspace [] {
    sudo dua --ignore-dirs="/.snapshots" i /
}
def update [] {
    sudo dnf update --refresh
    flatpak update
    cargo install-update --all
    lectio-diei db refresh
}
# Backup of cd
alias core-cd = cd
alias cd = z


