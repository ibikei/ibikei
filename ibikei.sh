#!/bin/bash

 ####################################################
##                                                   #
#  Licensed under the MIT license, made by Icycoide  #
#                                                   ##
 ####################################################

export IBK_IN=$1
export IBK_OUT=$2
export VERSION=0.4

main() {
    case "$IBK_EXT" in
        "")
            echo "ibikei: asked for no extensions, skip."
        ;;
        *)            
            source "$IBK_EXT" || exit 1
            echo "ibikei: extensions loaded!"
        ;;
    esac
    echo "ibikei: time to build!"
    time source "$IBK_IN" || exit 1
    echo "ibikei: done!"
}

# Defining keywords in ibk-lang

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

script() {
	printf "<script %s>\n" "$1" >> "$IBK_OUT"
}

script.end() {
	printf "</script>\n" >> "$IBK_OUT"
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

table() {
	printf "<table %s>\n" "$@" >> "$IBK_OUT"
}

table.row() {
	printf "<tr>\n" >> "$IBK_OUT"
}

table.row.end() {
	printf "</tr>\n" >> "$IBK_OUT"
}

table.cell.header() {
	printf "<th>%s</th>\n" "$@" >> "$IBK_OUT"
}

table.cell() {
	printf "<td>%s</td>\n" "$@" >> "$IBK_OUT"
}

table.end() {
	printf "</table>" >> "$IBK_OUT"
}

list.unordered() {
	printf "<ul>" >> "$IBK_OUT"
}

list.unordered.end() {
	printf "</ul>" >> "$IBK_OUT"
}

list.ordered() {
	printf "<ol>" >> "$IBK_OUT"
}

list.ordered.end() {
	printf "</ol>" >> "$IBK_OUT"
}

list.desc() {
	printf "<dl>" >> "$IBK_OUT"
}

list.desc.end() {
	printf "</dl>" >> "$IBK_OUT"
}

list.item() {
    printf "<li>%s</li>\n" "$@" >> "$IBK_OUT"
}

list.desc.t() {
    printf "<dt>%s</dt>\n" "$@" >> "$IBK_OUT"
}

list.desc.d() {
    printf "<dd>%s</dd>\n" "$@" >> "$IBK_OUT"
}

style() {
	printf "<style>" >> "$IBK_OUT"
}

style.end() {
	printf "</style>" >> "$IBK_OUT"
}

# Runs the main function

main
