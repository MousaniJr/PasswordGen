# PasswordGen

A beautiful macOS password generator app that creates secure, memorable passwords using a color + word combination format.

## Password Format

The default password generation creates passwords with the format: `colorWord`

Examples:
- `greenHat`
- `blueMoon`
- `redEagle`
- `purpleForest`

Each password consists of:
1. **First word**: A random color (lowercase)
2. **Second word**: A random word starting with a capital letter

## Features

- 🎨 **Color-Word Combinations**: Generates memorable passwords using color and word pairs
- 📋 **One-Click Copy**: Easily copy generated passwords to clipboard
- 📜 **Password History**: View your last 5 generated passwords
- 🎯 **Clean UI**: Beautiful, intuitive macOS interface
- 🔄 **Quick Generation**: Generate new passwords instantly

## Requirements

- macOS 13.0 (Ventura) or later
- Xcode 15.0 or later (for building from source)

## Building and Running

### Option 1: Using Xcode

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd PasswordGen
   ```

2. Open the package in Xcode:
   ```bash
   open Package.swift
   ```

3. Select your Mac as the run destination

4. Press `Cmd + R` to build and run the app

### Option 2: Using Swift Package Manager (Command Line)

1. Clone this repository:
   ```bash
   git clone <repository-url>
   cd PasswordGen
   ```

2. Build the project:
   ```bash
   swift build
   ```

3. Run the app:
   ```bash
   swift run
   ```

## Exporting the App

To create a standalone `.app` bundle that you can run from your Applications folder:

### Method 1: Using Xcode (Recommended)

1. Open the project in Xcode:
   ```bash
   open Package.swift
   ```

2. Select **Product** → **Archive** from the menu

3. When the archive finishes, the Organizer window will open

4. Click **Distribute App**

5. Select **Copy App** and click **Next**

6. Choose a destination folder to save the app

7. The `PasswordGen.app` will be exported to your chosen location

8. Move it to your `/Applications` folder or anywhere you like!

### Method 2: Using the Build Script

Run the provided build script to automatically create a `.app` bundle:

```bash
chmod +x build_app.sh
./build_app.sh
```

This will:
- Build the app in release mode
- Create a proper `.app` bundle
- Place it in the `Build` directory
- The app will be ready to use at `Build/PasswordGen.app`

You can then copy `PasswordGen.app` to your Applications folder:
```bash
cp -r Build/PasswordGen.app /Applications/
```

### Method 3: Manual Build with swiftc

For advanced users who want to manually build:

```bash
# Create build directory
mkdir -p Build/PasswordGen.app/Contents/MacOS
mkdir -p Build/PasswordGen.app/Contents/Resources

# Build the executable
swiftc -o Build/PasswordGen.app/Contents/MacOS/PasswordGen \
  Sources/*.swift \
  -framework SwiftUI \
  -framework AppKit \
  -target arm64-apple-macos13.0

# Create Info.plist
cat > Build/PasswordGen.app/Contents/Info.plist << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>PasswordGen</string>
    <key>CFBundleIdentifier</key>
    <string>com.passwordgen.app</string>
    <key>CFBundleName</key>
    <string>PasswordGen</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0</string>
    <key>LSMinimumSystemVersion</key>
    <string>13.0</string>
</dict>
</plist>
EOF
```

### Running the Exported App

Once exported, simply double-click `PasswordGen.app` to launch it!

## Project Structure

```
PasswordGen/
├── Package.swift              # Swift package manifest
├── Sources/
│   ├── PasswordGenApp.swift   # Main app entry point
│   ├── ContentView.swift      # Main UI view
│   └── PasswordGenerator.swift # Password generation logic
└── README.md
```

## How It Works

1. **Password Generator**: The `PasswordGenerator` class contains:
   - 40 color words (red, blue, green, etc.)
   - 100 common words (Hat, Moon, Tiger, etc.)
   - Logic to randomly combine them

2. **UI**: Built with SwiftUI for a modern macOS experience
   - Displays generated password in a prominent format
   - Copy button for quick clipboard access
   - History view for recent passwords
   - Smooth animations and transitions

## Customization

You can customize the word lists by editing `Sources/PasswordGenerator.swift`:

- Add more colors to the `colors` array
- Add more words to the `words` array
- Modify the `generatePassword()` method to change the format

## License

MIT License - feel free to use and modify as needed.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
