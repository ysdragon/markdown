load "markdown.ring"

/*
    Markdown Extensions
    ===================
    Demonstrates additional md4c extensions:
    - Wiki-style links
    - Underline
    - LaTeX math spans
    - Hard/soft breaks
    - HTML rendering flags
*/

md = new Markdown()

# ============================================
# Wiki Links
# ============================================

? "=== Wiki Links ==="
? copy("-", 40)

md.setFlags(MD_FLAG_WIKILINKS)

wikiText = '
Wiki-style links: [[Wiki Page]] and [[Target|Display Text]]
'

? md.toHTML(wikiText)

# ============================================
# Underline
# ============================================

? nl + "=== Underline ==="
? copy("-", 40)

md.setFlags(MD_FLAG_UNDERLINE)

underlineText = '
This is _underlined_ text (not italic when underline flag is enabled).
'

? md.toHTML(underlineText)

# ============================================
# LaTeX Math Spans
# ============================================

? nl + "=== LaTeX Math Spans ==="
? copy("-", 40)

md.setFlags(MD_FLAG_LATEXMATHSPANS)

mathText = '
Inline math: $E=mc^2$

Display math: $$\int_{a}^{b} f(x) dx$$
'

? md.toHTML(mathText)

# ============================================
# Hard/Soft Breaks
# ============================================

? nl + "=== Hard/Soft Breaks ==="
? copy("-", 40)

md.setFlags(MD_FLAG_HARD_SOFT_BREAKS)

breakText = '
Line one
Line two (soft break becomes hard break)
Line three  
Line four (explicit hard break with two spaces)
'

? md.toHTML(breakText)

# ============================================
# Combined Extensions
# ============================================

? nl + "=== All Extensions Combined ==="
? copy("-", 40)

md.setFlags(MD_DIALECT_GITHUB | MD_FLAG_WIKILINKS | MD_FLAG_UNDERLINE | MD_FLAG_LATEXMATHSPANS)

combinedText = '
# Combined Example

This has _underlined_ text, ~~strikethrough~~, and **bold**.

Math equation: $a^2 + b^2 = c^2$

Check the [[Documentation]] for more info.

| Feature    | Status |
|------------|--------|
| Underline  | On     |
| Wikilinks  | On     |
| LaTeX      | On     |
'

? md.toHTML(combinedText)

# ============================================
# HTML Rendering Flags
# ============================================

? nl + "=== HTML Rendering Flags ==="
? copy("-", 40)

md.setFlags(MD_DIALECT_GITHUB | MD_HTML_FLAG_XHTML)
? "XHTML output:"
? md.toHTML("Line with break  " + nl + "Next line")

? nl + "=== Parsing Structure ==="
? copy("-", 40)

md.setFlags(MD_FLAG_WIKILINKS | MD_FLAG_UNDERLINE | MD_FLAG_LATEXMATHSPANS)
aStructure = md.parse(combinedText)
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
                case MD_SPAN_WIKILINK
                    ? "    Wiki Link"
                case MD_SPAN_U
                    ? "    Underline"
                case MD_SPAN_LATEXMATH
                    ? "    LaTeX Math"
                case MD_SPAN_LATEXMATH_DISPLAY
                    ? "    LaTeX Math (Display)"
                case MD_SPAN_DEL
                    ? "    Strikethrough"
                case MD_SPAN_STRONG
                    ? "    Strong"
                case MD_TEXT_BR
                    ? "    Hard Break"
                case MD_TEXT_SOFTBR
                    ? "    Soft Break"
            end
        else
            if item != "" and len(item) < 50
                ? "      " + item 
            ok
        ok
    next
