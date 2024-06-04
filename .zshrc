# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob notify
unsetopt nomatch
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nikolay/.zshrc'

autoload -Uz compinit promptinit
compinit
promptinit
# End of lines added by compinstall

# Manually added aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias la='ls -lA'
alias l='ls'

# Compiling and running JavaFX
alias javafx='java -cp out -p javafx-sdk-21.0.2/lib --add-modules=ALL-MODULE-PATH'
alias javacfx='javac -d out -p javafx-sdk-21.0.2/lib --add-modules=ALL-MODULE-PATH'

# For operating git bare repo for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Syntax highlightning and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# This will set the default prompt to the restore theme
prompt adam2


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
