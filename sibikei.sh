#!/bin/bash

 #####################################################
##                                 IBK-Lang compiler #
#  Licensed under the MIT license, made by Icycoide  #
#  https://github.com/ibikei/ibikei                 ##
#####################################################

export IBK_IN=$1
export IBK_OUT=$2
export VERSION=0.3
export SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

safety_check() {
    # Set PATH to nothing to prevent the .ibkx file calling non-IBK-Lang commands
    PATH=""
    alias rm='echo "Prevented arbitrary code execution by blocking a delete command"'
    alias dd='echo "Prevented arbitrary code execution by blocking a write command"'
}

main() {
    limsg s 0 i "Safe version - Preventing arbitrary code execution"
    limsg s 3 i "Copying myself temporarily to /tmp"
    cp -v $SCRIPT_DIR/ibikei.sh /tmp/ibikei.sh || limsg.quit s 3 e "Failed to copy!"
    limsg s 3 i "Copying ibkx temporarily to /tmp"
    cp -v $IBK_IN /tmp/input.ibkx || limsg.quit s 3 e "Failed to copy!"
    limsg s 3 i "Entering directory"
    pushd /tmp || limsg.quit s 3 e "Failed to enter /tmp!"
        limsg s 4 i "Loading safety checks"
        safety_check
        limsg s 4 i "Sourcing file using restricted Bash"
        sibikei
        limsg s 5 i "Returning to original directory"
    popd
    limsg s 5 i "We're done here."
    exit
}

#!/bin/rbash

# Defining keywords in ibk-lang

sibikei() {
	/bin/rbash ./ibikei.sh input.ibkx output.html || limsg.quit s 4 e "Failed to source file with rbash/write to file"
}

init() {
    echo -e "<!DOCTYPE html>" > "$IBK_OUT"
}

meta() {
    printf "<head>\n" >> "$IBK_OUT"
}

meta.link() {
	printf "<link %s>\n" "$@" >> "$IBK_OUT"
}

meta.m() {
	printf "<meta %s>\n" "$@" >> "$IBK_OUT"
}

page.title() {
    meta.title "$*"
}

meta.title() {
    printf "<title>%s</title>\n" "$*" >> "$IBK_OUT"
}

css() {
	meta.link "rel=stylesheet href=\"${1}\""
}

html() {
    printf "<html %s>\n" "$1" >> "$IBK_OUT"
}

html.end() {
	printf "</html>\n" >> "$IBK_OUT"
}

meta.end() {
    printf "</head>\n" >> "$IBK_OUT"
}

content() {
    printf "<body>\n" >> "$IBK_OUT"
}

heading1() {
    printf "<h1>%s</h1>\n" "$@" >> "$IBK_OUT"
}

heading2() {
    printf "<h2>%s</h2>\n" "$@" >> "$IBK_OUT"
}

heading3() {
    printf "<h3>%s</h3>\n" "$@" >> "$IBK_OUT"
}

heading4() {
    printf "<h4>%s</h4>\n" "$@" >> "$IBK_OUT"
}

heading5() {
    printf "<h5>%s</h5>\n" "$@" >> "$IBK_OUT"
}

heading6() {
    printf "<h6>%s</h6>\n" "$@" >> "$IBK_OUT"
}

paragraph() {
    printf "<p>%s</p>\n" "$@" >> "$IBK_OUT"
}

container() {
    printf "<div %s>\n" "$@" >> "$IBK_OUT"
}

con() {
    container "$@"
}

con.end() {
    container.end
}

container.end() {
	printf "</div>\n" >> "$IBK_OUT"
}

center() {
	printf "<center>\n" >> "$IBK_OUT"
}

center.end() {
	printf "</center>\n" >> "$IBK_OUT"
}

hlink() {
    hyperlink "$1" "$2"
}

hyperlink() {
	printf "<a %s>%s</a>\n" "$1" "$2" >> "$IBK_OUT"
}

content.end() {
    printf "</body>\n" >> "$IBK_OUT"
}

code() {
    printf "<code>%s</code>\n" "$@" >> "$IBK_OUT"
}

textbox() {
	printf "<input %s>\n" "$@"
}

t() {
	printf "%s\n" "$@" >> "$IBK_OUT"
}

# Logging
#!/bin/bash

limsg() {
    export CHECKUSERINPUT
    case $1 in
        s)
            lmsg_one="STAGE"
        ;;
        *)
		;;
    esac
    lmsg_two=$2
    case $3 in
        i)
            lmsg_three="${BBlue}INFO"
        ;;
        w)
            lmsg_three="${BYellow}WARN"
        ;;
        e)            
            lmsg_three="${BRed}ERRR"
        ;;
        *)
            lmsg_three=$3
        ;;
    esac
    echo -e "[sibikei.sh/${BCyan}${lmsg_one} ${lmsg_two}${Color_Off}/${lmsg_three}${Color_Off}]: $4"
    export ADD
}

limsg.quit() {
    case $1 in
        s)
            lmsg_one="STAGE"
        ;;
        *)
        ;;
    esac
    lmsg_two=$2
    case $3 in
        e)            
            lmsg_three="${BRed}ERRR"
        ;;
        *)
            lmsg_three=$3
        ;;
    esac
    echo -e "[sibikei.sh/${BCyan}${lmsg_one} ${lmsg_two}${Color_Off}/${lmsg_three}${Color_Off}]: $4 | QUIT!"
    exit 1
}

colours() {
    # Reset
    export Color_Off='\033[0m'       # Text Reset

    # Regular Colors
    export Black='\033[0;30m'        # Black
    export Red='\033[0;31m'          # Red
    export Green='\033[0;32m'        # Green
    export Yellow='\033[0;33m'       # Yellow
    export Blue='\033[0;34m'         # Blue
    export Purple='\033[0;35m'       # Purple
    export Cyan='\033[0;36m'         # Cyan
    export White='\033[0;37m'        # White
 
    # Bold
    export BBlack='\033[1;30m'       # Black
    export BRed='\033[1;31m'         # Red
    export BGreen='\033[1;32m'       # Green
    export BYellow='\033[1;33m'      # Yellow
    export BBlue='\033[1;34m'        # Blue
    export BPurple='\033[1;35m'      # Purple
    export BCyan='\033[1;36m'        # Cyan
    export BWhite='\033[1;37m'       # White
 
    # Underline
    export UBlack='\033[4;30m'       # Black
    export URed='\033[4;31m'         # Red
    export UGreen='\033[4;32m'       # Green
    export UYellow='\033[4;33m'      # Yellow
    export UBlue='\033[4;34m'        # Blue
    export UPurple='\033[4;35m'      # Purple
    export UCyan='\033[4;36m'        # Cyan
    export UWhite='\033[4;37m'       # White
 
    # Background
    export On_Black='\033[40m'       # Black
    export On_Red='\033[41m'         # Red
    export On_Green='\033[42m'       # Green
    export On_Yellow='\033[43m'      # Yellow
    export On_Blue='\033[44m'        # Blue
    export On_Purple='\033[45m'      # Purple
    export On_Cyan='\033[46m'        # Cyan
    export On_White='\033[47m'       # White

    # High Intensity
    export IBlack='\033[0;90m'       # Black
    export IRed='\033[0;91m'         # Red
    export IGreen='\033[0;92m'       # Green
    export IYellow='\033[0;93m'      # Yellow
    export IBlue='\033[0;94m'        # Blue
    export IPurple='\033[0;95m'      # Purple
    export ICyan='\033[0;96m'        # Cyan
    export IWhite='\033[0;97m'       # White

    # Bold High Intensity
    export BIBlack='\033[1;90m'      # Black
    export BIRed='\033[1;91m'        # Red
    export BIGreen='\033[1;92m'      # Green
    export BIYellow='\033[1;93m'     # Yellow
    export BIBlue='\033[1;94m'       # Blue
    export BIPurple='\033[1;95m'     # Purple
    export BICyan='\033[1;96m'       # Cyan
    export BIWhite='\033[1;97m'      # White

    # High Intensity backgrounds
    export On_IBlack='\033[0;100m'   # Black
    export On_IRed='\033[0;101m'     # Red
    export On_IGreen='\033[0;102m'   # Green
    export On_IYellow='\033[0;103m'  # Yellow
    export On_IBlue='\033[0;104m'    # Blue
    export On_IPurple='\033[0;105m'  # Purple
    export On_ICyan='\033[0;106m'    # Cyan
    export On_IWhite='\033[0;107m'   # White
}

# Runs the main function

colours
main
