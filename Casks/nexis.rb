cask "nexis" do
  version "2.8.0"
  sha256 "231cec35dda8f4468e358f44b8b5b56579b1c52b7ee7805abf3ff7ea3c846ee6"

  url "https://github.com/s4solutionsllc/Nexis/releases/download/v#{version}/Nexis-#{version}-macOS-arm64.dmg"
  name "Nexis"
  desc "System Optimizer and Monitoring"
  homepage "https://github.com/s4solutionsllc/Nexis"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Nexis.app"

  # One-time identity reset (Nexis PR #134, SSO-3487): the macOS
  # CFBundleIdentifier moved from the unowned `com.nexis.app` to the
  # s4solutionsllc-owned `io.github.s4solutionsllc.Nexis`. After upgrading,
  # the previously installed `.app` becomes an orphaned shell — preferences
  # keyed under `com.nexis.app` will not auto-migrate, and Login Items /
  # default-app handlers must be re-registered.
  #
  # Recommended upgrade path for existing cask users:
  #   brew uninstall --zap nexis && brew install --cask nexis
  #
  # The zap stanza below intentionally lists both the legacy
  # `com.nexis.app` plist and the new `io.github.s4solutionsllc.Nexis`
  # plist so the cutover is atomic and no orphaned preferences are left
  # behind. The legacy entry can be removed in a future cask revision
  # once existing users have upgraded.
  zap trash: [
    "~/Library/Application Support/Nexis",
    "~/Library/Preferences/com.nexis.app.plist",
    "~/Library/Preferences/io.github.s4solutionsllc.Nexis.plist",
  ]
end
