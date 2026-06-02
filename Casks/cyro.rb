cask "cyro" do
  version "1.0.0"
  sha256 "2593dd1e10035152ae4de3fe514be9a02d2ad642fe86b61b1c49e2555e008069"

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
