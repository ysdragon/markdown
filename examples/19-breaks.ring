load "markdown.ring"

# Create new markdown instance
md = new Markdown()
md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_HARD_SOFT_BREAKS)

text = '
This is a soft break.
This is a hard break.  
'

? "Converting markdown with breaks to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with breaks:"
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
                case MD_TEXT_BR
                    ? "    Hard Break"
                case MD_TEXT_SOFTBR
                    ? "    Soft Break"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next