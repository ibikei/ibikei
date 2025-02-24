# ibikei
a Bash SSG (sort of)
# IBK-Lang
A "markup language" that ibikei takes and converts into HTML with

# How does it work?
You make an .ibkx file and write IBK-Lang code in it. You then use the following command to build the .ibkx file into an .html:

```
./ibikei.sh < input file > < output file >
```

For example, the official ibikei website has been built using this command:

```
./ibikei.sh index.ibkx index.html
```

It'll source the .ibkx file, and will go through every line progressively as it writes to file.
