# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

# bindkey commands
bindkey "\E[1~" beginning-of-line
bindkey "\E[4~" end-of-line
bindkey "\E[3~" delete-char

# ComfyUI alias
comfy() {
    cd ~/Sources/ComfyUI
    python main.py
}

# update-grub alias
update-grub() { 
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
}

show-diskspace() {
    sudo dua --ignore-dirs="/.snapshots" --ignore-dirs="/home/.snapshots" i /
}

update() {
    sudo dnf update --refresh
    flatpak update
    cargo install-update --list --all | grep Yes$ && { printf 'Proceed with update? '; read -r resp && [ "${resp#[yY]}" != "$resp" ] && cargo install-update --all; } 
}

adb-run() {
    x devices | grep adb | awk '{print $1}' | xargs -I % zsh -c 'x run --device %'
}


# Add the custom zsh completions directory
fpath=(~/.zsh-completions $fpath)

# Add .local/bin to path
PATH+=':/home/hayden/.local/bin'

# Add android command line tools to path
PATH+=":/home/hayden/Android/cmdline-tools/latest/bin"

# Set Android Home
export ANDROID_HOME="/home/hayden/Android"
export ANDROID_NDK_ROOT="$ANDROID_HOME/ndk"
export NDK_VERSION="27.0.12077973"
export SDK_VERSION="35.0.0-rc4"

PATH+=":$ANDROID_NDK_ROOT/$NDK_VERSION/toolchains/llvm/prebuilt/linux-x86_64/bin"

# Run starship (shell prompt)
eval "$(starship init zsh)"

# Display readings
lectio-diei display --readings alleluia

# The following lines were added by compinstall
zstyle :compinstall filename '/home/hayden/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

