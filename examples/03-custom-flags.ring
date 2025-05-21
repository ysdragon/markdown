load "markdown.ring"

md = new Markdown()

# Try different flag combinations
text = `
# Tables Example

| Col1 | Col2 |
|------|------|
| A    | B    |

Visit https://ring-lang.github.io
`

? "Default (GitHub) mode:"
? "-----------------"
? md.toHTML(text)

? nl + "CommonMark mode (no tables or autolinks):"
? copy("-", 40)
md.setFlags(MD_DIALECT_COMMONMARK)
? md.toHTML(text)

? nl + "Custom mode (only tables):"
? copy("-", 40)
md.setFlags(MD_FLAG_TABLES)
? md.toHTML(text)

? nl + "Done!"