cask "nexis" do
  version "2.7.0"
  sha256 "0f1668efa94ebeb2c8b950f35aafcf5b695e747d712ba6db9b4c0e97ee6760cf"

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
