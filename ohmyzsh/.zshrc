# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx history history-substring-search terminalapp brew npm bower extract tmux)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# personal alias
alias home="cd ~"
alias d="cd ~/Downloads"
alias dc="cd ~/Documents"
alias ds="cd ~/Desktop"
alias gc="git checkout"
alias gnb="git checkout -b"
alias gcm="git commit -m"
alias gcma="git commit --amend -m"
alias gf="git fetch"
alias gb="git branch -a"
alias gpl="git pull origin"
alias gp="git pull origin"
alias gps="git push origin"
alias gcb="echo $(current_branch)"
alias gm="git merge"
alias gs="git status"
alias gr="git reset"
alias ga="git add ."
alias gsh="git stash "
alias gl="git log"
alias gsup="zshreload && git branch --set-upstream-to origin/$(current_branch)"
alias ll="ls -alrt"
alias la="ls -a"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias chrome="/usr/bin/open -a \"/Applications/Google Chrome.app\""
alias firefox="/usr/bin/open -a \"/Applications/Firefox.app\""
alias gemail="git config user.email"
alias gname="git config user.name"
alias ports="lsof -i -P | grep -i 'listen'"
alias ni="npm install"
alias nig="npm install -g"
alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias nu="npm uninstall"
alias nug="npm uninstall -g"
alias nus="npm uninstall --save"
alias nusd="npm uninstall --save-dev"
alias rmds="sudo find . -name ".DS_Store" -depth -exec rm {} \;"

alias sshconfig="subl ~/.ssh/config"
alias python="python3"
alias py="python3"
alias pip="pip3"
alias pipupgrade="python3 -m pip install --upgrade pip"

alias zshconfig="subl ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias npmconfig="subl ~/.npmrc"
alias gitconfig="subl ~/.gitconfig"
alias npmlist="npm list --depth=0"

alias alertme="afplay /System/Library/PrivateFrameworks/ScreenReader.framework/Versions/A/Resources/Sounds/AnimationFlyToDownloads.aiff"

# Launches Python SimpleHTTPServer at defined port else
# defaults to 8081
function pyserver() {
	if [ -z "$1" ]; then
		python -m http.server 8081 & chrome "http://localhost:8081"
	else
		python -m http.server $1 & chrome "http://localhost:$1"
	fi
}

function gcmt() {
	if [ -z "$2" ]; then
		git commit -m "$1"
	else 
		echo "Commiting with message and description"
		git commit -m "$1" -m "$2"
	fi
}
function gdb() {
	git push origin --delete $1 && git branch -D $1
}

function ij() {
	open -a /Applications/IntelliJ\ IDEA.app $1
}

function ws() {
	open -a /Applications/WebStorm.app $1
}

function pycharm() {
	open -a /Applications/PyCharm.app $1
}

# Launches Node http-server at defined port else
# defaults to 8080
function hserver() {
	if [ -z "$1" ]; then
		http-server -p 8080 & chrome "http://localhost:8080"
	else
		http-server -p $1 & chrome "http://localhost:$1"
	fi
}

# returns system private ip
function myip() {
    ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
	ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

# create git repo from terminal
function startgit() {
	private=false
	while test $# -gt 0; do
		case "$1" in
			-p)
				private=true
				shift
				;;
			-n)
				shift
				repo=$1
				shift
				;;
			*)
				break
				;;
		esac
	done
	if [ -z "${repo}" ]; then
		repo=${PWD##*/}
		echo "Repo name: ${repo}"
	fi

	echo '\n{"name": "'${repo}'", "private": '${private}'}\n'

	curl -u 'sgsvenkatesh' https://api.github.com/user/repos -d '{"name": "'${repo}'", "private": '${private}'}'
	echo '# '${repo}'' >> README.md
	git init
	gemail venki.iitbbs@gmail.com
	ga
	gcm "First Commit"
	git remote add origin git@github.com:sgsvenkatesh/${repo}.git
	git push --set-upstream origin master
	repo=""
	private=false
}

function gcn() {
	ssh_url=$1
	git clone $ssh_url
	cd ${${ssh_url#*/*}%%.git*}
}

# git add && git commit -m "Message" && git push origin
# assuming upstream is set
function gacp() {
	ga 
	gcmt "$1" "$2"
	gps
}

function port() {
	lsof -n -i4TCP:$1 | grep LISTEN
}

function killport() {
	lsof -n -i:$1 | grep LISTEN | awk '{ print $2 }' | uniq | xargs kill -9
}

function newdir () {
	mkdir $1 && cd $1
}

function gpls() {
	gpl $1 && gps
}

function linelog() {
	git log --pretty=short -u -L $1,$2:$3
}

function gpr() {
	git pull-request -m $1 | pbcopy	
}

function gprb() {
	git pull-request -b $1 -m $2 | pbcopy
}

function gpb() {
	git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`; do git branch -D $branch; done
}

function v() {
	$1 --version;
}

function remove_all_node_modules() {
	find . -name "node_modules" -exec rm -rf '{}' +
}

# Compatible in all bash versions
# Automatically switches between work and personal git profiles
# You have to setup your SSH keys for each profile
# Compatible in all bash versions
# Developed using http://mherman.org/blog/2013/09/16/managing-multiple-github-accounts/
# function gcn() {
# 	hosts=( "url1:workBitBucket"
#         "url2:workGitHub"
#         "url3:workVisualStudio"
#         "github.com:personalGithub")
# 	ssh_url=$1
# 	for host in "${hosts[@]}" ; do
# 		KEY=${host%%:*}
#    		VALUE=${host#*:}
#    		if (test "${ssh_url#*$KEY}" != "$ssh_url")
#    		then
#    			echo "Cloning with $VALUE profile..."
#    			git clone "${ssh_url/$KEY/$VALUE}"
#    			cd ${${ssh_url#*/*}%%.git*}
#    			break
# 		fi
# 	done
# }
