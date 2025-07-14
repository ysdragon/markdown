load "markdown.ring"

# Create new markdown instance
md = new Markdown()

# Enable underline support
md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_UNDERLINE)

text = '
This is _underlined_ text.
'

? "Converting markdown with underline to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with underline:"
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
                case MD_SPAN_U
                    ? "    Underline"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next