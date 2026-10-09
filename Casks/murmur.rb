cask "murmur" do
  # version and sha256 are rewritten by costajohnt/murmur's release workflow.
  version "1.3.0"
  sha256 "1017056e6b0402faa81fc241cd98e2c06df7febbf4c3e95daeb8eee7f7fe2321"

  url "https://github.com/costajohnt/murmur/releases/download/v#{version}/Murmur-v#{version}.zip"
  name "Murmur"
  desc "Local, offline voice dictation"
  homepage "https://github.com/costajohnt/murmur"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Murmur.app"

  # Self-signed, not notarized (no Apple Developer Program membership), so
  # Gatekeeper refuses a quarantined copy. Same step as Murmur's install.sh.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Murmur.app"]
  end

  zap trash: [
    "~/Library/Application Support/Murmur",
    "~/Library/Preferences/com.costajohnt.murmur.plist",
  ]
end
