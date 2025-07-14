load "markdown.ring"

# Create new markdown instance
md = new Markdown()

# Enable strikethrough support
md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_STRIKETHROUGH)

text = '
This is ~~strikethrough~~ text.
'

? "Converting markdown with strikethrough to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with strikethrough:"
? copy("=", 45)

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
                case MD_SPAN_DEL
                    ? "    Strikethrough"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next