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
		"examples/01_basic_usage.ring",
		"examples/02_github_flavored.ring",
		"examples/03_extensions.ring",
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
		"lib/linux/arm64/libring_markdown.so",
		"lib/linux/musl/amd64/libring_markdown.so",
		"lib/linux/musl/arm64/libring_markdown.so"
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