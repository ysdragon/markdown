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
? copy("-", 30)
? md.parse(text)

? nl + "Done!"