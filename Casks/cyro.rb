cask "cyro" do
  version "1.0.0"
  sha256 "5033d0b15ff3169b901c5828f7b4b602a09d5bf2727d3b579e4c7bf970c8faeb"

  url "https://github.com/Nivin24/cyro-releases/releases/download/v#{version}/Cyro.dmg"
  name "Cyro"
  desc "Ambient Multi-Modal macOS Agent"
  homepage "https://github.com/Nivin24/cyro-macos-agent"

  app "Cyro.app"
  binary "#{appdir}/Cyro.app/Contents/MacOS/Cyro", target: "cyro"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Cyro.app"],
                   sudo: false
  end
end
