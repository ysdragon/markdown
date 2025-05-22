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
                case 0 
                    ? "Document Start"
                case 2 
                    ? "  List Start"
                case 4 
                    ?  "  - List Item"
                case 6 
                    ? "# Heading"
                case 7 
                    ? "``` Code Block"
                case 9 ?
                    "  Paragraph"
            end
        else
            if item != "" 
                ? "    " + item 
            ok
        ok
    next