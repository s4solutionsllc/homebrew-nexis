cask "nexis" do
  version "2.2.11"
  sha256 "f5d0a4194958e41d56882d4728981bb6136a99c8dc1d688c6db116f9c33f0936"

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
