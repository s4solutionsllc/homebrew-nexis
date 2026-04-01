cask "nexis" do
  version "2.2.10"
  sha256 "e666ad949c6267f455dc9635d65cc66dc61c93a36b5f6036c1a7e95ecb2c7dab"

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
