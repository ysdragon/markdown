load "markdown.ring"

# Create new markdown instance
md = new Markdown()

# Enable table support, which is part of the GitHub dialect.
md.setFlags(MD_DIALECT_GITHUB)

text = '
| Header 1 | Header 2 |
|----------|----------|
| Cell 1   | Cell 2   |
| Cell 3   | Cell 4   |
'

? "Converting markdown with tables to HTML:"
? copy("-", 40)
? md.toHTML(text)

? nl + "Parsing markdown with tables:"
? copy("=", 40)
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
                case MD_BLOCK_TABLE
                    ? "Table"
                case MD_BLOCK_THEAD
                    ? "  Table Head"
                case MD_BLOCK_TBODY
                    ? "  Table Body"
                case MD_BLOCK_TR
                    ? "    Table Row"
                case MD_BLOCK_TH
                    ? "      Table Header Cell"
                case MD_BLOCK_TD
                    ? "      Table Data Cell"
                case MD_BLOCK_P
                    ? "  Paragraph"
            end
        else
            if item != "" 
                ? "        " + item 
            ok
        ok
    next