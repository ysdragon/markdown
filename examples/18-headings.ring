load "markdown.ring"

# Create new markdown instance
md = new Markdown()

text = '
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
'

? "Converting markdown with headings to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with headings:"
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
                case MD_BLOCK_H
                    ? "  Heading"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next