wallpaper=HEALTH.jpg

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="norm"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
)
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

alias vim="$HOME/Softwares/nvim-v0-11-2/bin/nvim"

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:$HOME/bin"
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export CC=clang-15
export CXX=clang++-15

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias tclear="tmux clear-history && clear"

# export PATH="/home/huan/miniconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/huan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/huan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/huan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/huan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# autoload -U add-zsh-hook
# add-zsh-hook -Uz chpwd (){ ls ; }

xset r rate 200 120
export LD_LIBRARY_PATH=/usr/local/lib64:$LD_LIBRARY_PATH
export DRJIT_LIBLLVM_PATH=/usr/lib/x86_64-linux-gnu/libLLVM-13.so

export PATH="/home/huan/.local/bin:$PATH"
export PATH=/usr/local/cuda-12.2/bin${PATH:+:${PATH}}
export PATH=/home/huan/opt/REAPER/${PATH:+:${PATH}}
export PATH=/usr/local/go/bin/${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export TERM_TOOLS=/home/huan/git/term-tools

# disable screen saving
xset s off
xset -dpms

# look at file .fehbg created after the initial feh invokation
# feh --bg-scale /home/huan/Pictures/wallpapers/$wallpaper

bindkey -v
cd() { builtin cd "$@";ls;}
exr2jpg() {
	filename=$(basename -- "$1")
	extension="${filename##*.}"
	filename="${filename%.*}"

	convert $filename.exr -colorspace RGB -colorspace sRGB $filename.jpg
	echo "["$1".jpg] saved" 
}

exrcrop() {
	filename=$(basename -- "$1")
	extension="${filename##*.}"
	filename="${filename%.*}"

	convert $filename.exr -crop $4x$5+$2+$3 "$filename"+"_[crop].exr"
	echo "["$1".jpg] saved" 
}

exr2pdf() {
	filename=$(basename -- "$1")
	extension="${filename##*.}"
	filename="${filename%.*}"

	convert $filename.exr -colorspace RGB -colorspace sRGB $filename.jpg
	convert $filename.jpg -colorspace RGB -colorspace sRGB $filename.pdf
	rm $filename.jpg
	echo "["$1".pdf] saved" 
}
exr2jpg_all(){
	total=$(ls *.exr | wc -l)
	echo "processing " $total " files:"
	c=0
	for f in $(ls *.exr) 
	do
	 exr2jpg $f
	 c=$(($c+1))
	 echo -ne "$c/$total \r"
	done
	echo "$c/$total"
	echo "DONE"
}

exr2pdf_all(){
	total=$(ls *.exr | wc -l)
	echo "processing " $total " files:"
	c=0
	for f in $(ls *.exr) 
	do
	 exr2pdf $f
	 c=$(($c+1))
	 echo -ne "$c/$total \r"
	done
	echo "$c/$total"
	echo "DONE"
}

exrcrop_all(){
	total=$(ls *.exr | wc -l)
	echo "cropping " $total " files:"
	c=0
	for f in $(ls *.exr) 
	do
	 exrcrop $f $1 $2 $3 $4
	 c=$(($c+1))
	 echo -ne "$c/$total \r"
	done
	echo "$c/$total"
	echo "DONE"
}

[ -f "/home/huan/.ghcup/env" ] && . "/home/huan/.ghcup/env" # ghcup-env
export BUNDLE_PATH=~/.gems



