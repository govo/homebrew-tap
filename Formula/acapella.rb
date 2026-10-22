#
#  acapella.rb —— Homebrew formula。由 acapella-cli/scripts/release.sh 生成，
#  发新版本时整份覆盖本文件，不要手工改 url 与 sha256。
#
#  与 drumai 一致：一个 formula 覆盖两个架构，brew 按本机 CPU 选块；
#  二进制挂在 govo/acapella-cli 的 Release 上，tag 就是 v<版本>。
#

class Acapella < Formula
  desc "Command line client for the Acapella app on macOS"
  homepage "https://github.com/govo/acapella-cli"
  version "0.1.0"

  on_arm do
    url "https://github.com/govo/acapella-cli/releases/download/v0.1.0/acapella-0.1.0-darwin-arm64.tar.gz"
    sha256 "5ff5076623d8c213b605d7c3af7c38884ddb9eb830e60c8afd634e87c2d9d8e9"
  end

  on_intel do
    url "https://github.com/govo/acapella-cli/releases/download/v0.1.0/acapella-0.1.0-darwin-x64.tar.gz"
    sha256 "e03c345e2025ba0d2dbee1d505d38660012646047c10a156302d304a1dca2720"
  end

  def install
    bin.install "acapella"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/acapella --version")
  end
end
