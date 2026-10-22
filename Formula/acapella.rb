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
  version "0.1.0"

  on_arm do
    url "https://github.com/govo/acapella-cli/releases/download/v0.1.0/acapella-0.1.0-darwin-arm64.tar.gz"
    sha256 "9d7f9642fefcb562f41a1cb4e09ef947995520d7a261f0e85e2a652c3db556a4"
  end

  on_intel do
    url "https://github.com/govo/acapella-cli/releases/download/v0.1.0/acapella-0.1.0-darwin-x64.tar.gz"
    sha256 "fc86adb0911846f528eb8d3c5f68b8d90ee078069c49e75a52c3a34f580b8932"
  end

  def install
    bin.install "acapella"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acapella --version")
  end
end
