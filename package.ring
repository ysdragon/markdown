aPackageInfo = [
	:name = "Ring Markdown",
	:description = "A Markdown parser and HTML converter package for Ring.",
	:folder = "markdown",
	:developer = "",
	:email = "",
	:license = "MIT License",
	:version = "1.1.1",
	:ringversion = "1.22",
	:versions = 	[
		[
			:version = "1.1.1",
			:branch = "master"
		]
	],
	:libs = 	[
		
	],
	:files = 	[
		"lib.ring",
		"main.ring",
		"src/md4c.cf",
		"src/ring_markdown.c",
		"src/ring_markdown.rh",
		"CMakeLists.txt",
		".clang-format",
		"examples/01-basic.ring",
		"examples/02-github.ring",
		"examples/03-custom-flags.ring",
		"examples/04-html-advanced.ring",
		"examples/05-tables.ring",
		"examples/06-tasklists.ring",
		"examples/07-strikethrough.ring",
		"examples/08-autolinks.ring",
		"examples/09-wikilinks.ring",
		"examples/10-underline.ring",
		"examples/11-latex-math.ring",
		"examples/12-blockquotes.ring",
		"examples/13-horizontal-rules.ring",
		"examples/14-images.ring",
		"examples/15-ordered-lists.ring",
		"examples/16-inline-code.ring",
		"examples/17-html-blocks.ring",
		"examples/18-headings.ring",
		"examples/19-breaks.ring",
		"examples/20-email-autolinks.ring",
		"README.md",
		"LICENSE",
		"src/utils/color.ring",
		"src/utils/install.ring",
		"src/utils/uninstall.ring"
	],
	:ringfolderfiles = 	[

	],
	:windowsfiles = 	[
		"lib/windows/i386/ring_markdown.dll",
		"lib/windows/amd64/ring_markdown.dll",
		"lib/windows/arm64/ring_markdown.dll"
	],
	:linuxfiles = 	[
		"lib/linux/amd64/libring_markdown.so",
		"lib/linux/arm64/libring_markdown.so"
	],
	:ubuntufiles = 	[

	],
	:fedorafiles = 	[

	],
	:freebsdfiles	= [
		"lib/freebsd/amd64/libring_markdown.so",
		"lib/freebsd/arm64/libring_markdown.so"
	],
	:macosfiles = 	[
		"lib/macos/amd64/libring_markdown.dylib",
		"lib/macos/arm64/libring_markdown.dylib"
	],
	:windowsringfolderfiles = 	[

	],
	:linuxringfolderfiles = 	[

	],
	:ubunturingfolderfiles = 	[

	],
	:fedoraringfolderfiles = 	[

	],
	:freebsdringfolderfiles	= [
		
	],
	:macosringfolderfiles = 	[

	],
	:run = "ring main.ring",
	:windowsrun = "",
	:linuxrun = "",
	:macosrun = "",
	:ubunturun = "",
	:fedorarun = "",
	:setup = "ring src/utils/install.ring",
	:windowssetup = "",
	:linuxsetup = "",
	:macossetup = "",
	:ubuntusetup = "",
	:fedorasetup = "",
	:remove = "ring src/utils/uninstall.ring",
	:windowsremove = "",
	:linuxremove = "",
	:macosremove = "",
	:ubunturemove = "",
	:fedoraremove = ""
]