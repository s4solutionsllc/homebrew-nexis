cask "nexis" do
  version "2.2.12"
  sha256 "4adb756a0472b2b8ab534e30aec59a975b3845d15b42eeeb540b251d5d3fbd32"

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
