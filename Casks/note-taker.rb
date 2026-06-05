cask "note-taker" do
  version "1.1.0"
  sha256 "fc96379d5071b19bf1f8246466e9a25443ca12f8488c863aea6e6d77ef9231c7"

  url "https://github.com/Nivin24/Note-Taker-Landing/releases/download/v#{version}/NoteTaker.dmg"
  name "NoteTaker"
  desc "Pop-up menu bar note-taking application for macOS"
  homepage "https://Nivin24.github.io/Note-Taker-Landing/"

  app "NoteTaker.app"

  # Automatically remove Apple quarantine flag upon install
  postflight do
    system_command "sh",
                   args: ["-c", "xattr -r -d com.apple.quarantine '#{appdir}/NoteTaker.app' 2>/dev/null || true"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.user.NoteTaker",
    "~/Library/Preferences/com.user.NoteTaker.plist",
  ]
end
