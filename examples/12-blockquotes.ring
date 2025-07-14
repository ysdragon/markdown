load "markdown.ring"

# Create new markdown instance
md = new Markdown()

text = '
> This is a blockquote.
>
> > This is a nested blockquote.
'

? "Converting markdown with blockquotes to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with blockquotes:"
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
                case MD_BLOCK_QUOTE
                    ? "  Blockquote"
                case MD_BLOCK_P
                    ? "    Paragraph"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next