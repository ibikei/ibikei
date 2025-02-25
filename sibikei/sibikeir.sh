#!/bin/rbash
# shellcheck shell=bash

export IBK_IN=$1
export IBK_OUT=$2
export VERSION="0.3sr"

main() {
    source "$IBK_IN"
}

init() {
    /bin/echo -e "<!DOCTYPE html>" | tee "$IBK_OUT"
}

meta() {
    /bin/printf "<head>\n" | tee -a "$IBK_OUT"
}

meta.link() {
	/bin/printf "<link %s>\n" "$@" | tee -a "$IBK_OUT"
}

meta.m() {
	/bin/printf "<meta %s>\n" "$@" | tee -a "$IBK_OUT"
}

page.title() {
    meta.title "$*"
}

meta.title() {
    /bin/printf "<title>%s</title>\n" "$*" | tee -a "$IBK_OUT"
}

css() {
	/meta.link "rel=stylesheet href=\"${1}\""
}

html() {
    /bin/printf "<html %s>\n" "$1" | tee -a "$IBK_OUT"
}

html.end() {
	/bin/printf "</html>\n" | tee -a "$IBK_OUT"
}

meta.end() {
    /bin/printf "</head>\n" | tee -a "$IBK_OUT"
}

content() {
    /bin/printf "<body>\n" | tee -a "$IBK_OUT"
}

heading1() {
    /bin/printf "<h1>%s</h1>\n" "$@" | tee -a "$IBK_OUT"
}

heading2() {
    /bin/printf "<h2>%s</h2>\n" "$@" | tee -a "$IBK_OUT"
}

heading3() {
    /bin/printf "<h3>%s</h3>\n" "$@" | tee -a "$IBK_OUT"
}

heading4() {
    /bin/printf "<h4>%s</h4>\n" "$@" | tee -a "$IBK_OUT"
}

heading5() {
    /bin/printf "<h5>%s</h5>\n" "$@" | tee -a "$IBK_OUT"
}

heading6() {
    /bin/printf "<h6>%s</h6>\n" "$@" | tee -a "$IBK_OUT"
}

paragraph() {
    /bin/printf "<p>%s</p>\n" "$@" | tee -a "$IBK_OUT"
}

container() {
    /bin/printf "<div %s>\n" "$@" | tee -a "$IBK_OUT"
}

con() {
    container "$@"
}

con.end() {
    container.end
}

container.end() {
	/bin/printf "</div>\n" | tee -a "$IBK_OUT"
}

center() {
	/bin/printf "<center>\n" | tee -a "$IBK_OUT"
}

center.end() {
	/bin/printf "</center>\n" | tee -a "$IBK_OUT"
}

hlink() {
    hyperlink "$1" "$2"
}

hyperlink() {
	/bin/printf "<a %s>%s</a>\n" "$1" "$2" | tee -a "$IBK_OUT"
}

content.end() {
    /bin/printf "</body>\n" | tee -a "$IBK_OUT"
}

code() {
    /bin/printf "<code>%s</code>\n" "$@" | tee -a "$IBK_OUT"
}

textbox() {
	/bin/printf "<input %s>\n" "$@"
}

t() {
	/bin/printf "%s\n" "$@" | tee -a "$IBK_OUT"
}

main