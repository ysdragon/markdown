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

2. Set the `RING` environment variable to your Ring installation directory:
 
    - Windows
        - Command Prompt
            ```cmd
            set RING=X:\path\to\ring
            ```
        - PowerShell
            ```powershell
            $env:RING = "X:\path\to\ring"
            ```

    - Unix
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
load "stdlibcore.ring"
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
? list2code(struct)
```

## Examples

Check the [`examples`](examples) directory for more usage examples.

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