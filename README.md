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
