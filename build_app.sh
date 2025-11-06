#!/bin/bash

# Build script for PasswordGen macOS app

set -e  # Exit on error

echo "🔨 Building PasswordGen..."
echo ""

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf Build
rm -rf .build

# Build the app in release mode
echo "⚙️  Building in release mode..."
swift build -c release

# Create app bundle structure
echo "📦 Creating app bundle..."
mkdir -p Build/PasswordGen.app/Contents/MacOS
mkdir -p Build/PasswordGen.app/Contents/Resources

# Copy the executable
echo "📋 Copying executable..."
cp .build/release/PasswordGen Build/PasswordGen.app/Contents/MacOS/

# Create Info.plist
echo "📝 Creating Info.plist..."
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
    <key>CFBundleDisplayName</key>
    <string>PasswordGen</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>LSMinimumSystemVersion</key>
    <string>13.0</string>
    <key>NSHighResolutionCapable</key>
    <true/>
    <key>LSApplicationCategoryType</key>
    <string>public.app-category.utilities</string>
</dict>
</plist>
EOF

# Make executable
chmod +x Build/PasswordGen.app/Contents/MacOS/PasswordGen

echo ""
echo "✅ Build complete!"
echo ""
echo "📍 Your app is located at: Build/PasswordGen.app"
echo ""
echo "To install to Applications folder, run:"
echo "   cp -r Build/PasswordGen.app /Applications/"
echo ""
echo "Or simply double-click Build/PasswordGen.app to launch it!"
echo ""
