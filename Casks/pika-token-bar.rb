cask "pika-token-bar" do
  version "1.4.0"
  sha256 "c84866fb3bc90c44fa8f8a34cfa3eaca588a31e260bc4c2b0a190f582811f6fa"

  url "https://github.com/LuceteYang/PikaTokenBar/releases/download/v#{version}/PikaTokenBar.zip"
  name "PikaTokenBar"
  desc "Menu bar companion that hatches Generation 1 Pokemon from your AI coding tokens"
  homepage "https://github.com/LuceteYang/PikaTokenBar"

  depends_on macos: :sonoma

  app "PikaTokenBar.app"

  # 자체 서명(공증 없음) 앱이라 Gatekeeper 격리 속성을 제거해야 실행된다.
  # Cask 설치 경로에서는 brew 가 이 단계를 대신해 준다.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PikaTokenBar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/PikaTokenBar",
    "~/Library/Logs/PikaTokenBar.log",
    "~/Library/Preferences/sh.otis.pikatokenbar.plist",
  ]
end
