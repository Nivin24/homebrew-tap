cask "note-taker" do
  version "1.1.0"
  sha256 "b96185a67b208a8e2f51a0a3e8baf54ca7373452c713d7f80e3304269ccc816a"

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
