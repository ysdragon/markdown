load "markdown.ring"

# Create new markdown instance
md = new Markdown()

text = '
<div>
  This is an HTML block.
</div>
'

? "Converting markdown with HTML blocks to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with HTML blocks:"
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
                case MD_BLOCK_HTML
                    ? "  HTML Block"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next