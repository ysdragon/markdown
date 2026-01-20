load "markdown.ring"

/*
    Basic Markdown Usage
    ====================
    Demonstrates core markdown features:
    - Headings
    - Paragraphs
    - Lists (ordered & unordered)
    - Code blocks & inline code
    - Blockquotes
    - Images
    - Horizontal rules
    - HTML blocks
*/

md = new Markdown()

text = '
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

This is a paragraph with **bold** and *italic* text.

## Unordered Lists
- Item 1
- Item 2
  - Nested item
  - Another nested item
- Item 3

## Ordered Lists
1. First item
2. Second item
3. Third item

## Code

Inline `code` example.

```ring
? "Hello World"
```

## Blockquotes

> This is a blockquote.
>
> > This is a nested blockquote.

## Images

![Ring Logo](https://ring-lang.net/theringlogo.jpg)

## Horizontal Rules

---

Some text between rules.

***

## HTML Blocks

<div>
  This is an HTML block.
</div>
'

? "=== Converting Markdown to HTML ==="
? copy("-", 40)
? md.toHTML(text)

? nl + "=== Parsing Markdown Structure ==="
? copy("-", 40)

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
                case MD_BLOCK_P
                    ? "  Paragraph"
                case MD_BLOCK_UL
                    ? "  Unordered List"
                case MD_BLOCK_OL
                    ? "  Ordered List"
                case MD_BLOCK_LI
                    ? "    List Item"
                case MD_BLOCK_CODE
                    ? "  Code Block"
                case MD_BLOCK_QUOTE
                    ? "  Blockquote"
                case MD_BLOCK_HR
                    ? "  Horizontal Rule"
                case MD_BLOCK_HTML
                    ? "  HTML Block"
                case MD_SPAN_CODE
                    ? "    Inline Code"
                case MD_SPAN_IMG
                    ? "    Image"
                case MD_SPAN_STRONG
                    ? "    Strong"
                case MD_SPAN_EM
                    ? "    Emphasis"
            end
        else
            if item != "" and len(item) < 50
                ? "      " + item 
            ok
        ok
    next
