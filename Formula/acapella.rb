#
#  acapella.rb —— Homebrew formula。由 acapella-cli/scripts/release.sh 生成，
#  发新版本时整份覆盖本文件，不要手工改 url 与 sha256。
#
#  与 drumai 一致：一个 formula 覆盖两个架构，brew 按本机 CPU 选块；
#  二进制挂在 govo/acapella-cli 的 Release 上，tag 就是 v<版本>。
#
#  已知审计噪音（drumai 同样有）：brew audit 会说 on_arm/on_intel 里不能放 url/sha256。
#  但块内语句照常求值，fetch/install 都正常；个人 tap 不跑 audit，所以保持这个写法
#  —— 换成 universal binary 才能消掉，代价是体积翻倍，不值得。
#

class Acapella < Formula
  desc "Command-line client for the Acapella app on macOS"
  homepage "https://github.com/govo/acapella-cli"
  version "0.1.1"

  on_arm do
    url "https://github.com/govo/acapella-cli/releases/download/v0.1.1/acapella-0.1.1-darwin-arm64.tar.gz"
    sha256 "57e9a8865e02c339b8c297038afd9d6c2b1c537dbdcd8032d81c3baa44825242"
  end

  on_intel do
    url "https://github.com/govo/acapella-cli/releases/download/v0.1.1/acapella-0.1.1-darwin-x64.tar.gz"
    sha256 "472088f4904b767c9b1d2234fd28c4c2258ad0b858bba36345937cc289868a95"
  end

  def install
    bin.install "acapella"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acapella --version")
  end
end
