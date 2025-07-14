load "markdown.ring"

# Create new markdown instance
md = new Markdown()

# Enable LaTeX math spans support
md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_LATEXMATHSPANS)

text = '
This is an inline LaTeX math span: $E=mc^2$
'

? "Converting markdown with LaTeX math spans to HTML:"
? copy("-", 50)
? md.toHTML(text)

? nl + "Parsing markdown with LaTeX math spans:"
? copy("=", 50)

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
                case MD_SPAN_LATEXMATH
                    ? "    LaTeX Math Span"
            end
        else
            if item != "" 
                ? "      " + item 
            ok
        ok
    next