load "markdown.ring"

# Create new markdown instance
md = new Markdown()

text = '
---
This is a horizontal rule.
***
'

? "Converting markdown with horizontal rules to HTML:"
? copy("-", 50)
? md.toHTML(text)

? nl + "Parsing markdown with horizontal rules:"
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
                case MD_BLOCK_HR
                    ? "  Horizontal Rule"
                case MD_BLOCK_P
                    ? "    Paragraph"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next