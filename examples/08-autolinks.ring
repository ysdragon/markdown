load "markdown.ring"

# Create new markdown instance
md = new Markdown()

# Enable autolinking
md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_PERMISSIVEURLAUTOLINKS | MD_FLAG_PERMISSIVEWWWAUTOLINKS)

text = '
Visit Ring website: https://ring-lang.net or www.google.com
'

? "Converting markdown with autolinks to HTML:"
? copy("-", 45)
? md.toHTML(text)

? nl + "Parsing markdown with autolinks:"
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
                case MD_BLOCK_P
                    ? "  Paragraph"
                case MD_SPAN_A
                    ? "    Link"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next