load "markdown.ring"

/*
    GitHub Flavored Markdown
    ========================
    Demonstrates GFM-specific features:
    - Tables
    - Task lists
    - Strikethrough
    - URL autolinks
    - Email autolinks
    - WWW autolinks
*/

md = new Markdown()

text = '
# GitHub Flavored Markdown

## Tables

| Name   | Type    | Description        |
|--------|---------|-------------------|
| id     | number  | Unique identifier |
| name   | string  | User name         |
| active | boolean | Account status    |

## Task Lists

- [x] Completed task
- [x] Another completed task
- [ ] Pending task
- [ ] Another pending task

## Strikethrough

This is ~~deleted~~ text with ~~strikethrough~~.

## Auto-linking

### URL Autolinks
Visit https://ring-lang.github.io for documentation.

### WWW Autolinks
Check out www.google.com for search.

### Email Autolinks
Contact us at: test@example.com
'

? "=== Default GitHub Dialect ==="
? copy("-", 40)
? md.toHTML(text)

? nl + "=== CommonMark (no GFM features) ==="
? copy("-", 40)
md.setFlags(MD_DIALECT_COMMONMARK)
? md.toHTML(text)

? nl + "=== Custom: Tables Only ==="
? copy("-", 40)
md.setFlags(MD_FLAG_TABLES)
? md.toHTML(text)

? nl + "=== Custom: Tables + Strikethrough ==="
? copy("-", 40)
md.setFlags(MD_FLAG_TABLES | MD_FLAG_STRIKETHROUGH)
? md.toHTML(text)

? nl + "=== Parsing Structure ==="
? copy("-", 40)

md.setFlags(MD_DIALECT_GITHUB)
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
                case MD_BLOCK_TABLE
                    ? "  Table"
                case MD_BLOCK_THEAD
                    ? "    Table Head"
                case MD_BLOCK_TBODY
                    ? "    Table Body"
                case MD_BLOCK_TR
                    ? "      Table Row"
                case MD_BLOCK_TH
                    ? "        Table Header Cell"
                case MD_BLOCK_TD
                    ? "        Table Data Cell"
                case MD_BLOCK_UL
                    ? "  Unordered List"
                case MD_BLOCK_LI
                    ? "    List Item"
                case MD_SPAN_DEL
                    ? "    Strikethrough"
                case MD_SPAN_A
                    ? "    Link"
            end
        else
            if item != "" and len(item) < 50
                ? "          " + item 
            ok
        ok
    next
