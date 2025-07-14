load "markdown.ring"

# Create new markdown instance
md = new Markdown()

# Enable task list support
md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_TASKLISTS)

text = '
- [x] Completed task
- [ ] Incomplete task
'

? "Converting markdown with task lists to HTML:"
? copy("-", 40)
? md.toHTML(text)

? nl + "Parsing markdown with task lists:"
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
                case MD_BLOCK_UL
                    ? "  List Start"
                case MD_BLOCK_LI
                    ?  "  - List Item"
                case MD_BLOCK_P
                    ? "  Paragraph"
            end
        else
            if item != "" 
                ? "    " + item 
            ok
        ok
    next