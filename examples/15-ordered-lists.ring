load "markdown.ring"

# Create new markdown instance
md = new Markdown()

text = '
1. First item
2. Second item
3. Third item
'

? "Converting markdown with ordered lists to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with ordered lists:"
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
                case MD_BLOCK_OL
                    ? "  Ordered List"
                case MD_BLOCK_LI
                    ? "    List Item"
                case MD_BLOCK_P
                    ? "      Paragraph"
            end
        else
            if item != "" 
                ? "        " + item 
            ok
        ok
    next