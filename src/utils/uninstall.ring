load "stdlibcore.ring"

cPathSep = "/"

if isWindows()
	cPathSep = "\\"
ok

# Remove the markdown.ring file from the load directory
remove(exefolder() + "load" + cPathSep + "markdown.ring")

# Remove the markdown.ring file from the Ring2EXE libs directory
remove(exefolder() + ".." + cPathSep + "tools" + cPathSep + "ring2exe" + cPathSep + "libs" + cPathSep + "markdown.ring")

# Change current directory to the samples directory
chdir(exefolder() + ".." + cPathSep + "samples")

# Remove the UsingMarkdown directory if it exists
if direxists("UsingMarkdown")
	OSDeleteFolder("UsingMarkdown")
ok