load "markdown.ring"

md = new Markdown()

text = '
# Advanced HTML Output

This example shows different HTML rendering options and customizations.

## Rich Content
Visit our git repository at https://github.com/ysdragon/markdown for more information.

## Task Progress
- [x] Setup development environment
- [x] Write basic markdown parser
- [x] Add advanced features
- [x] Write documentation
- [ ] Release version 1.0.0

## Code Highlighting
```ring
# Ring Language Example

p = new Person("Alice", 30)
p.display()

class Person
    name
    age
    
    func init n, a
        name = n
        age = a
    
    func display
        ? "Name: " + name + ", Age: " + age
```

## Data Table
| Feature | Status | Priority |
|---------|--------|----------|
| Tables | ✅ Complete | High |
| Lists | ✅ Complete | High |
| Links | ✅ Complete | Medium |
| Images | 🔄 In Progress | Medium |
| Math | ❌ Planned | Low |

> **Note**: This is a blockquote example with **bold** and *italic* text.
'

# Generate different HTML outputs
standardHTML = md.toHTML(text)
htmlWithStyle = addCustomStyling(standardHTML)

md.setFlags(MD_DIALECT_COMMONMARK)
compactHTML = md.toHTML(text)

md.setFlags(MD_DIALECT_GITHUB | MD_HTML_FLAG_DEBUG)
debugHTML = md.toHTML(text)

# Write outputs to files
? "Writing HTML files..."

# Check if output directory exists, create if not
if !direxists("output")
	if isWindows()
		system("mkdir output")
	else
		system("mkdir -p output")
	ok
ok

write("output/standard.html", standardHTML)
? "✓ Standard HTML saved to: output/standard.html"

write("output/styled.html", htmlWithStyle)
? "✓ Styled HTML saved to: output/styled.html"

write("output/compact.html", compactHTML)
? "✓ Compact HTML saved to: output/compact.html"

write("output/debug.html", debugHTML)
? "✓ Debug HTML saved to: output/debug.html"

? nl + "All HTML files generated successfully!"
? "Open the files in your browser to view the results."

func addCustomStyling htmlContent
    styledHTML = `
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ring Markdown Example</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body { 
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; 
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);

            min-height: 100vh;
            padding: 20px;
            color: #2d3748;
        }
        
        .content {
            max-width: 900px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 40px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }
        
        h1, h2, h3 { 
            color: #1a202c;
            font-weight: 700;
            margin: 30px 0 20px 0;
            line-height: 1.2;
        }
        
        h1 { 
            font-size: 2.5rem; 
            color: #ffffff;
            text-shadow: 0 2px 4px rgba(0,0,0,0.3);
        }
        
        h2 { 
            font-size: 2rem; 
            color: #f7fafc;
            text-shadow: 0 1px 3px rgba(0,0,0,0.2);
        }
        
        h3 { 
            font-size: 1.5rem; 
            color: #edf2f7;
        }
        
        p {
            margin: 15px 0;
            line-height: 1.7;
            color: #2d3748;
        }
        
        table { 
            width: 100%; 
            margin: 25px 0;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            overflow: hidden;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        th, td { 
            padding: 15px 20px; 
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        th { 
            background: rgba(255, 255, 255, 0.2);
            color: #1a202c; 
            font-weight: 600;
        }
        
        tr:last-child td {
            border-bottom: none;
        }
        
        tr:hover td {
            background: rgba(255, 255, 255, 0.1);
        }
        
        code { 
            background: rgba(0, 0, 0, 0.2);
            color: #e2e8f0;
            padding: 4px 8px; 
            border-radius: 6px;
            font-family: 'Monaco', 'Menlo', 'Ubuntu Mono', monospace;
            font-size: 0.9em;
        }
        
        pre { 
            background: rgba(0, 0, 0, 0.3);
            color: #e2e8f0;
            padding: 25px; 
            border-radius: 12px; 
            overflow-x: auto;
            margin: 20px 0;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        pre code {
            background: transparent;
            color: inherit;
            padding: 0;
        }
        
        /* Ring syntax highlighting */
        .ring-keyword { color: #ff7eb6; font-weight: bold; }      /* Keywords like class, func, new */
        .ring-string { color: #a5d6ff; }                          /* String literals */
        .ring-comment { color: #8b949e; font-style: italic; }     /* Comments */
        .ring-number { color: #ffa657; }                          /* Numbers */
        .ring-function { color: #7ee787; }                        /* Function names */
        .ring-variable { color: #ffa657; }                        /* Variable names */
        .ring-operator { color: #ff7eb6; }                        /* Operators like + = */
        .ring-builtin { color: #79c0ff; }                         /* Built-in functions like ? */
        
        blockquote { 
            border-left: 4px solid rgba(255, 255, 255, 0.5);
            margin: 25px 0;
            padding: 20px 25px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 0 12px 12px 0;
            font-style: italic;
        }
        
        ul, ol { 
            margin: 15px 0;
            padding-left: 25px;
        }
        
        li { 
            margin: 8px 0;
            line-height: 1.6;
        }
        
        ul {
            list-style: none;
            padding-left: 0;
        }
        
        ul li {
            padding-left: 25px;
            position: relative;
        }
        
        ul li:before { 
            content: "•"; 
            color: rgba(255, 255, 255, 0.7);
            position: absolute; 
            left: 8px;
            font-size: 1.2em;
        }
        
        a { 
            color: #90cdf4;
            text-decoration: none; 
            font-weight: 500;
        }
        
        a:hover { 
            color: #bee3f8;
            text-decoration: underline;
        }
        
        /* Task list styling */
        .task-list-item {
            list-style: none;
            padding-left: 0;
        }
        
        .task-list-item:before {
            content: none;
        }
        
        .task-list-item input[type="checkbox"] {
            margin-right: 10px;
            transform: scale(1.2);
        }
        
        /* Responsive design */
        @media (max-width: 768px) {
            body {
                padding: 10px;
            }
            
            .content {
                padding: 20px;
            }
            
            h1 { font-size: 2rem; }
            h2 { font-size: 1.5rem; }
            h3 { font-size: 1.25rem; }
            
            table {
                font-size: 0.9rem;
            }
            
            th, td {
                padding: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="content">
` + htmlContent + `
    </div>
</body>
</html>`
    
    return styledHTML