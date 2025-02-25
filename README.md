# ibikei
a Bash SSG (sort of)
# IBK-Lang
A "markup language" that ibikei takes and converts into HTML with

File extension: __.ibkx__~~, .ibkxs~~
# sibikei
A safe and isolated version of Ibikei that makes sure to limit anything that is not IBK-Lang code.

Instead of redirection, it uses tee to write to output file.
Instead of writing directly to file, it writes it to a separate file under /tmp/ then copies it back

Doesn't work properly at the moment...

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
