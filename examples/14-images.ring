load "markdown.ring"

# Create new markdown instance
md = new Markdown()

text = '
![Ring Logo](https://www.ring-lang.org/ring-logo.png)
'

? "Converting markdown with images to HTML:"
? copy("-", 40)
? md.toHTML(text)

? nl + "Parsing markdown with images:"
? copy("=", 40)

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
                case MD_SPAN_IMG
                    ? "    Image"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next