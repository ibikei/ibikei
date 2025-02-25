#!/bin/rbash
# shellcheck shell=bash

export IBK_IN=$1
export IBK_OUT=$2
export VERSION="0.3sr"

main() {
    source "$IBK_IN"
}

init() {
    echo -e "<!DOCTYPE html>" | tee "$IBK_OUT"
}

meta() {
    printf "<head>\n" | tee -a "$IBK_OUT"
}

meta.link() {
	printf "<link %s>\n" "$@" | tee -a "$IBK_OUT"
}

meta.m() {
	printf "<meta %s>\n" "$@" | tee -a "$IBK_OUT"
}

page.title() {
    meta.title "$*"
}

meta.title() {
    printf "<title>%s</title>\n" "$*" | tee -a "$IBK_OUT"
}

css() {
	/meta.link "rel=stylesheet href=\"${1}\""
}

html() {
    printf "<html %s>\n" "$1" | tee -a "$IBK_OUT"
}

html.end() {
	printf "</html>\n" | tee -a "$IBK_OUT"
}

meta.end() {
    printf "</head>\n" | tee -a "$IBK_OUT"
}

content() {
    printf "<body>\n" | tee -a "$IBK_OUT"
}

heading1() {
    printf "<h1>%s</h1>\n" "$@" | tee -a "$IBK_OUT"
}

heading2() {
    printf "<h2>%s</h2>\n" "$@" | tee -a "$IBK_OUT"
}

heading3() {
    printf "<h3>%s</h3>\n" "$@" | tee -a "$IBK_OUT"
}

heading4() {
    printf "<h4>%s</h4>\n" "$@" | tee -a "$IBK_OUT"
}

heading5() {
    printf "<h5>%s</h5>\n" "$@" | tee -a "$IBK_OUT"
}

heading6() {
    printf "<h6>%s</h6>\n" "$@" | tee -a "$IBK_OUT"
}

paragraph() {
    printf "<p>%s</p>\n" "$@" | tee -a "$IBK_OUT"
}

container() {
    printf "<div %s>\n" "$@" | tee -a "$IBK_OUT"
}

con() {
    container "$@"
}

con.end() {
    container.end
}

container.end() {
	printf "</div>\n" | tee -a "$IBK_OUT"
}

center() {
	printf "<center>\n" | tee -a "$IBK_OUT"
}

center.end() {
	printf "</center>\n" | tee -a "$IBK_OUT"
}

hlink() {
    hyperlink "$1" "$2"
}

hyperlink() {
	printf "<a %s>%s</a>\n" "$1" "$2" | tee -a "$IBK_OUT"
}

content.end() {
    printf "</body>\n" | tee -a "$IBK_OUT"
}

code() {
    printf "<code>%s</code>\n" "$@" | tee -a "$IBK_OUT"
}

textbox() {
	printf "<input %s>\n" "$@"
}

t() {
	printf "%s\n" "$@" | tee -a "$IBK_OUT"
}

main