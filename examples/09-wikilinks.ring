load "markdown.ring"

# Create new markdown instance
md = new Markdown()

# Enable wiki-style links support
md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_WIKILINKS)

text = '
This is a wiki-style link: [[Wiki Link]]
'

? "Converting markdown with wiki-style links to HTML:"
? copy("-", 50)
? md.toHTML(text)

? nl + "Parsing markdown with wiki-style links:"
? copy("=", 50)

aStructure = md.parse(text)
printStructure(aStructure)

? nl + "Done!"

func printStructure list
    if !isList(list)
        return 
    ok
    
    for item in list
        if isNumber(item)
            switch item
                case MD_BLOCK_DOC
                    ? "Document Start"
                case MD_BLOCK_P
                    ? "  Paragraph"
                case MD_SPAN_WIKILINK
                    ? "    Wiki Link"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next