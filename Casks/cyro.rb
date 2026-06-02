cask "cyro" do
  version "1.0.0"
  sha256 "33568950f08e0fd763d2797ffe4df9241a758e0b465e7a570e7f58d830d8034c"

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
