if isWindows()
    loadlib("ring_markdown.dll")
elseif isLinux() or isFreeBSD()
    loadlib("libring_markdown.so")
else
	raise("Unsupported OS! You need to build the library for your OS.")
ok

load "src/ring_markdown.rh"

Class Markdown
	flags

    # Initialize the class with default values
    func init
        # Default flags for Markdown parsing
        flags = MD_DIALECT_GITHUB

    # Set custom markdown parsing flags
    func setFlags nFlags
        if !isNumber(nFlags)
            raise("Expected number parameter for flags")
        ok
        flags = nFlags

    # Convert markdown to HTML using configured flags
    func toHTML cMarkdown
        if !isString(cMarkdown)
            raise("Expected string parameter")
        ok
        return md_html(cMarkdown, flags)

    # Parse markdown and get detailed structure
    func parse cMarkdown
        if !isString(cMarkdown)
            raise("Expected string parameter")
        ok
        aResult = []
        md_parse(cMarkdown, aResult)
        return aResult