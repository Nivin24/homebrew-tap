cask "cyro" do
  version "1.0.0"
  sha256 "e46b7e22a0336245444ffcdf9959bbf111c5ce81a4c3457d0dca0d9eaf392ed2"

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
