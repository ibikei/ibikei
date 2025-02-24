#!/bin/bash

 ####################################################
##                                                   #
#  Licensed under the MIT license, made by Icycoide  #
#                                                   ##
 ####################################################

export IBK_IN=$1
export IBK_OUT=$2
export VERSION=0.2

main() {
    source "$IBK_IN"
}

# Defining keywords in ibk-lang

init() {
    echo -e "<!DOCTYPE html>" > "$IBK_OUT"
}

meta() {
    printf "<head>\n" >> "$IBK_OUT"
}

meta.link() {
	printf "<link %s>" "$@" >> "$IBK_OUT"
}

meta.m() {
	printf "<meta %s>" "$@" >> "$IBK_OUT"
}

page.title() {
    meta.title "$*"
}

meta.title() {
    printf "<title>%s</title>" "$*" >> "$IBK_OUT"
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
    hyperlink $1 $2
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
	printf "<input %s>" "$@"
}

t() {
	printf "%s\n" "$@" >> "$IBK_OUT"
}

# Runs the main function

main
