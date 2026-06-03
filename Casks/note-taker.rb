cask "note-taker" do
  version "1.0.1"
  sha256 "cf6381a46d70e515ee5c11e33efeff1ad8e37ef19f7b3eca9b7103bcef0917ea"

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
