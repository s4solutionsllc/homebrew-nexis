cask "nexis" do
  version "2.2.13"
  sha256 "00a6ca06a6186d0aaf9a34e460ada13f3f1f6de4cf7d40ae237a7bb2fd471828"

  url "https://github.com/s4solutionsllc/Nexis/releases/download/v#{version}/Nexis-#{version}-macOS-arm64.dmg"
  name "Nexis"
  desc "System Optimizer and Monitoring"
  homepage "https://github.com/s4solutionsllc/Nexis"

  depends_on arch: :arm64
  depends_on macos: ">= :big_sur"

  app "Nexis.app"

  zap trash: [
    "~/Library/Application Support/Nexis",
    "~/Library/Preferences/com.nexis.app.plist",
  ]
end
