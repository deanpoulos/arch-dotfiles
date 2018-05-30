#=============================================================================#
#      shell configuration - by dean poulos (dean.poulos7@protonmail.com)     #
#=============================================================================#
# services include:                                                           #  
# - message of the day:     prints computer's specs         motd, cl          #
# - prompt design:          dual-line ps1 with time & cwd   prompt            #  
# - config file access:     edit configs with shortcuts     conf <pkg>        #
# - gnome-term sizing:      change size of floating term    tsize <size>      #  
# - cse server access:      mount cse drive to local fs     cse, shell        #  
# - compilation:            compile c for windows and linux compile, xcompile #
# - directory traversal:    traverse lab/assignment dirs    w <#>, ass, g2    #
#=============================================================================#
# prerequisites:                                                              #
# - screenfetch:            used to print hardware/software specs in `motd`   # 
# - x86_64-w64-mingw32-gcc: used for compiling c as a .exe file in `xcompile` #
# - ssh & sshfs:            used for mounting cse account locally in `cse`    #
#                           assumes directory /cse exists for mounting        #    
#=============================================================================#

# Define colour scheme & formatting options (PS1-friendly & echo-friendly)
  BASE="\[\e[00;38;5;163m\]";   EBASE="\e[00;38;5;163m";  
 LBASE="\[\e[00;38;5;169m\]";  ELBASE="\e[00;38;5;169m";
ACCENT="\[\e[00;38;5;247m\]"; EACCENT="\e[00;38;5;247m"; 
  ROOT="\[\e[00;38;5;218m\]";   EROOT="\e[00;38;5;218m";
 CLEAR="\[\e[m\]";             ECLEAR="\e[m";
                               EERROR="\e[91;01m";

# Terminal sizing escape sequences
  BIG="\x1B[8;43;132t";       
SMALL="\x1B[8;24;80t";
 TALL="\x1B[8;43;80t";         
 WIDE="\x1B[8;24;132t";

alias vim="sudo -E vim"    

export PS1="$BASE[ $ROOT\u@\h$BASE ] $LBASE\W\n"    # [ dean@Arch-Dean ] ~ 
export PS1+="$ACCENT\d $BASE$"                      # Mon May 28 $> 
export PS1+="$LBASE>$CLEAR "   

motd    () { clear; screenfetch; }; motd; # motd with screenfetch 

compile () { gcc -ggdb -Wall -Werror -O -std=c99 -o "$1" "$2"; }
xcompile() { x86_64-w64-mingw32-gcc -Wall -Werror -O -std=c99 -o "$1" "$2"; }

w       () { cse; cd $COMP/labs/week$1; }
ass     () { cse; cd $COMP/assignments; }

cl      () { motd; }
lg      () { exit; logout; }

tsize   () {
    if      [ $1 = big ];   then echo -e $BIG;      cl;
    elif    [ $1 = small ]; then echo -e $SMALL;    cl;
    elif    [ $1 = tall ];  then echo -e $TALL;     cl;
    elif    [ $1 = wide ];  then echo -e $WIDE;     cl;
    else    echo -e $EERROR"Please enter a valid terminal size"$ECLEAR
    fi
}

conf    () {
    if      [ $1 = bash ];      then vim ~/.bashrc; source ~/.bashrc;
    elif    [ $1 = vim ];       then vim ~/.vimrc
    elif    [ $1 = i3 ];        then vim ~/.config/i3/config
    elif    [ $1 = i3status ];  then vim /etc/i3status.conf
    elif    [ $1 = compton ];   then vim /etc/xdg/compton.conf
    elif    [ $1 = pacman ];    then vim /etc/pacman.conf
    else    echo -e $EERROR"Please enter the name of a valid service"$ECLEAR
    fi
}

shell   () { ssh -X $CSEADD  && clear; }

#=============================================================================#
# personal commands: feel free to comment this part out unless applicable     #
#=============================================================================#

# $CSEDIR is defined with an argument at the end for use with ssh
COMP="/cse/COMP1521"
CSEDIR="z5122508@cse.unsw.edu.au:/import/kamen/2/z5122508 /cse"
CSEADD="z5122508@login.cse.unsw.edu.au"

cse     () { 
    # probe /cse/* directory for existing instances of a mount 
    # if failed, sshfs not mounted, so mount $CSEDIR drive from server to /cse
    # if failed, recursively unmount incorrectly mounted sshfs & reconnect
    # once finally successful in mounting, change to the mounted directory
    { cd $COMP 2> /dev/null \
        || { sudo sshfs -o allow_other,reconnect $CSEDIR; } \
            || { umount -l /cse; cse; } \
    } && cd /cse;   
}

g2      () { 
    if      [ $1 = gh ];    then cd ~/GitHub/configs; 
    elif    [ $1 = dl ];    then cd ~/Downloads;
    elif    [ $1 = pg ];    then cd ~/Programs;
    fi
}
