load "markdown.ring"

# Create new markdown instance
md = new Markdown()

text = '
This is `inline code`.
'

? "Converting markdown with inline code to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with inline code:"
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
                case MD_SPAN_CODE
                    ? "    Inline Code"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next