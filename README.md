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

# I want it, how do I get it?

Go to [Releases](https://github.com/ibikei/ibikei/releases) and download ibikei.sh. Put it either in /bin or in any folder, however you see it fit.

If you want Sibikei to stay safe (which doesn't support extensions), download both sibikei.sh and sibikeir.sh **AND MAKE SURE THEY'RE BOTH IN THE SAME DIRECTORY!!**

sibikei.sh is the file that's meant to run. sibikeir.sh should **not run by itself**, but should be invoked by sibikei.sh. 
sibikei.sh is ran in the same way ibikei.sh is
