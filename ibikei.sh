#!/bin/bash

####################################################
#                                                  #
#  Licensed under the Unlicense, made by Icycoide  #
#                                                  #
####################################################

export content="<body>"
export heading="<h1 />"
export paragraph="<p />"
export content_end="</body>"

export IBK_IN=$1
export IBK_OUT=$2

main() {
    source "$IBK_IN"
}

# Defining keywords in ibk-lang

init() {
    echo -e "<!DOCTYPE html>" > "$IBK_OUT"    
}

settings() {
    printf "<head>\n" >> "$IBK_OUT"
}

page_title() {
    printf "<title>%s</title>" "$*" >> "$IBK_OUT"    
}

settings_end() {
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

content_end() {
    printf "</body>\n" >> "$IBK_OUT"
}

main