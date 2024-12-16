def comfy [] {
    cd ~/Sources/ComfyUI
    python3.12 main.py
}
def update-grub [] {
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
}
def show-diskspace [] {
    sudo dua --ignore-dirs="/.snapshots" i /
}
def update [] {
    print ""
    print "DNF UPDATE"
    print "----------"
    sudo dnf update --refresh

    print ""
    print "FLATPAK UPDATE"
    print "--------------"
    flatpak update

    print ""
    print "RUSTUP"
    print "------"
    rustup update

    print ""
    print "CARGO UPDATE"
    print "------------"
    cargo install-update --all

    print ""
    print "LECTIO DIEI REFRESH"
    print "-------------------"
    lectio-diei db refresh

    print ""
    print "NPM UPDATE"
    print "----------"
    sudo npm update -g
}
def restart-plasma [] {
    systemctl --user restart plasma-plasmashell.service
}
def --env yazi [...args] {
    # Random file name to store new cwd
    let tmp = (mktemp -t "yazi-cmd.XXXXX")
    ^yazi ...$args --cwd-file $tmp
    let cwd = (open $tmp)
    if $cwd != "" and $cwd != $env.PWD {
        cd $cwd
    }
    rm -fp $tmp
}
    
# Backup of cd
alias core-cd = cd
alias cd = z
alias vim = nvim
