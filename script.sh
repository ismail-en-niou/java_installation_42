#!/bin/zsh
# 🎓 42-school Java 21 installer (no sudo, with animations)
# Works on macOS school machines
# Installs SDKMAN + Temurin Java 21 (JDK 21) locally in $HOME

clear
echo "🚀 Starting Java 21 installation for 42 student..."
sleep 1

spin() {
  sp='|/-\'
  while true; do
    printf "\r[%c] %s" "${sp:i++%${#sp}:1}" "$1"
    sleep 0.1
  done
}

# Step 1: Install SDKMAN
echo "\n🧰 Checking for SDKMAN..."
if [ -d "$HOME/.sdkman" ]; then
  echo "✅ SDKMAN already installed."
else
  echo "📦 Installing SDKMAN..."
  (spin "Downloading SDKMAN..." &) 
  pid=$!
  curl -s "https://get.sdkman.io" | bash >/dev/null 2>&1
  kill $pid >/dev/null 2>&1
  wait $pid 2>/dev/null
  echo "\n✅ SDKMAN installed successfully!"
fi

# Step 2: Initialize SDKMAN
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Step 3: Install Java 21
JAVA_VERSION="21.0.1-tem"

echo "\n🪄 Installing Java ${JAVA_VERSION}..."
(spin "Downloading Java ${JAVA_VERSION}..." &) 
pid=$!
sdk install java $JAVA_VERSION >/dev/null 2>&1
kill $pid >/dev/null 2>&1
wait $pid 2>/dev/null
echo "\n✅ Java ${JAVA_VERSION} installed successfully!"

# Step 4: Set Java 21 as default
echo "\n⚙️  Setting Java ${JAVA_VERSION} as default..."
sdk default java $JAVA_VERSION >/dev/null 2>&1

# Step 5: Verify installation
echo "\n🔍 Verifying Java installation..."
sleep 1
java --version

echo "\n🎉 All done!"
echo "You can now use Java 21 without sudo 🙌"
echo "To check anytime, run: java --version"
echo "Happy coding, 42 student! 💻✨"
