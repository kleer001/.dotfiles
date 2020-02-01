#wacom settings 
xsetwacom set "Wacom Intuos3 9x12 Pad pad" Button 1 0
xsetwacom set "Wacom Intuos3 9x12 Pad pad" Button 2 0
xsetwacom set "Wacom Intuos3 9x12 Pad pad" Button 3 0
xsetwacom set "Wacom Intuos3 9x12 Pad pad" Button 8 0

xsetwacom set "Wacom Intuos3 9x12 Pad pad" StripLeftUp 0
xsetwacom set "Wacom Intuos3 9x12 Pad pad" StripRightUp 0
xsetwacom set "Wacom Intuos3 9x12 Pad pad" StripLeftDown 0
xsetwacom set "Wacom Intuos3 9x12 Pad pad" StripRightDown 0


#pretty prompty promt
PS1="\[\033[0;30m\]\\t \[\033[0;33m\]\\u@\h \[\033[1;34m\]\\w \[\033[0;31m\]\\!:\[\033[1;30m\] "

#app aliases
alias xclip='xclip -selection c'
#alias mineETH="cd /opt/claymore118/Claymore\'s\ Dual\ Ethereum+Decred_Siacoin_Lbry_Pascal_Blake2s_Keccak\ AMD+NVIDIA\ GPU\ Miner\ v11.8\ -\ LINUX/ ; ./ethdcrminer64"

alias mineETH="/opt/claymore15/Claymore\'s\ Dual\ Ethereum\ AMD+NVIDIA\ GPU\ Miner\ v15.0\ -\ LINUX/ethdcrminer64"


#homey aliases
alias cdai='cd ~/Dropbox/ai'
#old broke ass alias before I knew the power of functions
#alias cn="scrot '%Y-%m-%d_%H:%M.jpg' -e 'mv \$f ~/Dropbox/ai/images/diary/'; echo `date '+%Y-%m-%d_%H:%M'` | xclip"

function cn { 
    export DATESTAMP=$(date '+%Y-%m-%d_%H:%M')
    scrot $DATESTAMP.jpg
    mv  $DATESTAMP.jpg ~/Dropbox/ai/images/diary/
    echo $DATESTAMP | xclip
    echo $DATESTAMP
    }


alias diary='emacs ~/Dropbox/ai/diary.txt --eval "(goto-char (point-max))"'
#quick and dirty way to edit if you want it 
alias e="emacsclient --no-wait"

alias updateSystem="sudo apt-get upgrade"

# aliases and functions for counting words in current novel XX
alias countXX="wc -w /home/menser/Dropbox/ai/emacs/org/XX\,\ a\ novel.org"

function getCurrentDate { export DATETODAY=(\"$(date '+%Y-%m-%d')\");}

#count current words, open emacs, display word count change on emacs close
function wxx { 
    export CC=($(countXX))
    emacs ~/Dropbox/ai/emacs/org/XX\,\ a\ novel.org
    DD=($(countXX))
    let "LASTCOUNT=${DD[0]}-${CC[0]}"
    echo YOU WROTE 
    expr ${DD[0]} - ${CC[0]}
    echo WORDS. YAY!
    dbxx;
    }

function dbxx { 
    getCurrentDate
    mysql --defaults-extra-file=~/wxxconfig.cnf -e "USE words; INSERT INTO writingXX(workday,countWords,totalWords) VALUES($DATETODAY,$LASTCOUNT,${DD[0]});";
    }

# Hooo, it's pretty nice! Goes well with Tiled windows
alias R='ranger'





