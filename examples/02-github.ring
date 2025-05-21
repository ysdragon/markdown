load "markdown.ring"

md = new Markdown()

text = `
# GitHub Flavored Markdown

## Task List
- [x] Completed task
- [ ] Pending task
- [ ] Another task

## Table
| Name | Type | Description |
|------|------|-------------|
| id | number | Unique identifier |
| name | string | User's name |
| active | boolean | Account status |

## Auto-linking
Visit https://ring-lang.github.io
Email: name@example.com
`

? "GitHub Flavored Markdown Features:"
? copy("-", 40)
? md.toHTML(text)

? nl + "Done!"