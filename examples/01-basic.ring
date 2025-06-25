load "markdown.ring"

# Create new markdown instance
md = new Markdown()

text = '
# Hello World

This is a **bold** text and *italic* text.

## Lists
- Item 1
- Item 2
  - Nested item
  - Another nested item
- Item 3

## Code
```ring
? "Hello World"
```
'

? "Converting markdown to HTML:"
? copy("-", 30)
? md.toHTML(text)

? "Parsing markdown structure:"
? copy("=", 30)

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
                case MD_BLOCK_UL
                    ? "  List Start"
                case MD_BLOCK_LI
                    ?  "  - List Item"
                case MD_BLOCK_H
                    ? "# Heading"
                case MD_BLOCK_CODE
                    ? "``` Code Block"
                case MD_BLOCK_P
                    ? "  Paragraph"
            end
        else
            if item != "" 
                ? "    " + item 
            ok
        ok
    next