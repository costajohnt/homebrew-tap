cask "murmur" do
  # version and sha256 are rewritten by costajohnt/murmur's release workflow.
  version "1.4.0"
  sha256 "2c8f55586d7eb7e706b19ec9afd62370f42c9ac0ba6917bcf08a3cbed0a4c0c8"

  url "https://github.com/costajohnt/murmur/releases/download/v#{version}/Murmur-v#{version}.zip"
  name "Murmur"
  desc "Local, offline voice dictation"
  homepage "https://github.com/costajohnt/murmur"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # Self-signed, not notarized (no Apple Developer Program membership), so
  # Gatekeeper refuses a quarantined copy. Same step as Murmur's install.sh.
  # Clears the staged copy before `app` moves it: install steps can't name
  # appdir, and the move keeps the cleared attributes.
  preflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "Murmur.app"], chdir: "."
  end

  app "Murmur.app"

  zap trash: [
    "~/Library/Application Support/Murmur",
    "~/Library/Preferences/com.costajohnt.murmur.plist",
  ]
end
