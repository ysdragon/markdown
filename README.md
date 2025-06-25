# Ring Markdown

A native markdown processing extension for the [Ring](http://ring-lang.net) programming language, built on top of the high-performance [MD4C](https://github.com/mity/md4c) parser.

## Features

- Cross-platform (Windows, Linux, FreeBSD)
- Easy-to-use Ring API

## Prerequisites

- [Ring](http://ring-lang.net) programming language (1.22 or later)
- CMake (3.5 or later)
- C compiler (GCC, Clang, or MSVC)

## Installation

### Using RingPM

```shell
ringpm install markdown from ysdragon
```

### Manual Build

1. Clone the repository:
```bash
git clone --recursive https://github.com/ysdragon/markdown.git
cd markdown
```

2. Set RING environment variable to your Ring installation directory:

On Windows (cmd):
```cmd
set RING=X:\path\to\ring
```

On Windows (PowerShell):
```powershell
$env:RING = "X:\path\to\ring"
```

On Unix-like systems:
```bash
export RING=/path/to/ring
```

3. Build using CMake:
```bash
cmake -Bbuild -DCMAKE_BUILD_TYPE=Release
cmake --build build
```

## Usage

```ring
load "markdown.ring"

md = new Markdown()

# Use custom flags
md.setFlags(MD_FLAG_TABLES | MD_FLAG_STRIKETHROUGH)

# Convert markdown to HTML
text = "# Hello World\nThis is **bold** and *italic*."
html = md.toHTML(text)
? html

# Parse markdown structure
struct = md.parse(text)
? struct
```

## Examples

Check the [`examples`](examples) directory for more usage examples:
- [`01-basic.ring`](examples/01-basic.ring): Basic markdown to HTML conversion
- [`02-github.ring`](examples/02-github.ring): GitHub-flavored markdown features
- [`03-custom-flags.ring`](examples/03-custom-flags.ring): Custom parsing options
- [`04-html-advanced.ring`](examples/04-html-advanced.ring): Advanced Markdown to HTML conversion with multiple styles

## Contributing

### Bug Reports
Open an issue with bug description, steps to reproduce, and environment details.

### Pull Requests
1. Fork repo
2. Create feature branch
3. Make changes
4. Push changes
5. Open PR

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.