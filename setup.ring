/*
    Ring Markdown Extension Setup Script
    ----------------------------------
    This script installs the Ring Markdown extension library for the current platform.
    It detects the OS and architecture, then copies or symlinks the library to the 
    appropriate system location.
*/

load "stdlibcore.ring"

# Default library settings
cLibPrefix = "lib"
cPathSep = "/"

# Platform detection and configuration
switch true
    case isWindows()
        cLibPrefix = ""
        cPathSep = "\\"
        cLibExt = ".dll"
        cOSName = "windows"
    case isLinux()
        cLibExt = ".so"
        cOSName = "linux"
    case isFreeBSD()
        cLibExt = ".so"
        cOSName = "freebsd"
    case isMacOSX()
        cLibExt = ".dylib"
        cOSName = "macos"
    else
        raise("Error: Unsupported operating system detected!")
end


# Get system architecture
cArchName = getarch()
switch cArchName
    case "x86"
        cArchName = "i386"
    case "x64"
        cArchName = "amd64"
    case "arm64"
        cArchName = "arm64"
    else
        raise("Error: Unsupported architecture: " + cArchName)
end

# Construct the library path
cLibPath = exefolder() + ".." + cPathSep + "tools" + cPathSep + "ringpm" + cPathSep + 
        "packages" + cPathSep + "markdown" + cPathSep + "lib" + cPathSep + 
        cOSName + cPathSep + cArchName + cPathSep + cLibPrefix + "ring_markdown" + cLibExt

# Verify library exists
if !fexists(cLibPath)
    ? "Error: Markdown library not found!"
    ? "Expected location: " + cLibPath
    ? "Please ensure the library is built for your platform (" + cOSName + "/" + cArchName + ")"
    ? "You can refer to the README.md for build instructions: " + exefolder() + ".." + cPathSep + "tools" + cPathSep + "ringpm" + cPathSep + 
        "packages" + cPathSep + "markdown" + cPathSep + "README.md"
    return
ok

# Install library based on platform
try
    if isWindows()
        systemSilent("copy /y " + '"' + cLibPath + '" "' + exefolder() + '"')
    else
        if isFreeBSD() or isMacOSX()
            cDestDir = "/usr/local/lib"
        elseif isLinux()
            cDestDir = "/usr/lib"
        ok
        cCommand = 'which sudo >/dev/null 2>&1 && sudo ln -sf "' + cLibPath + '" "' + cDestDir + 
                '" || (which doas >/dev/null 2>&1 && doas ln -sf "' + cLibPath + '" "' + cDestDir + 
                '" || ln -sf "' + cLibPath + '" "' + cDestDir + '")'
        system(cCommand)
    ok
    ? "Successfully installed Ring Markdown!"
catch
    ? "Error: Failed to install Ring Markdown!"
    ? "Details: " + cCatchError
done
