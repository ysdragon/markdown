load "markdown.ring"

# Create new markdown instance
md = new Markdown()
md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_PERMISSIVEEMAILAUTOLINKS)

text = '
Contact us at: test@example.com
'

? "Converting markdown with email autolinks to HTML:"
? copy("-", 50)
? md.toHTML(text)

? nl + "Parsing markdown with email autolinks:"
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
                case MD_SPAN_A
                    ? "    Link"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next