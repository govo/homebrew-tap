#
#  drumai.rb —— Homebrew formula。由 mcp/scripts/render-formula.sh 生成，
#  发新版本时整份覆盖本文件，不要手工改 url 与 sha256。
#
#  一个 formula 覆盖两个架构：brew 按本机 CPU 选 on_arm / on_intel 块。
#  不做 universal binary —— 胖二进制体积翻倍，两个 tar.gz 更省，这是 Homebrew 的常规做法。
#  二进制挂在 govo/drumai-cli 的 Release 上，tag 就是 v<版本>。
#

class Drumai < Formula
  desc "Command line tool for creating Drum AI drum presets"
  homepage "https://github.com/govo/drumai-cli"
  version "0.2.0"

  on_arm do
    url "https://github.com/govo/drumai-cli/releases/download/v0.2.0/drumai-0.2.0-darwin-arm64.tar.gz"
    sha256 "a8ca16d0d83a6fd30ca9f99d85dab768f5465b8ef2c36a42062f25cd9ea16616"
  end

  on_intel do
    url "https://github.com/govo/drumai-cli/releases/download/v0.2.0/drumai-0.2.0-darwin-x64.tar.gz"
    sha256 "b2af9f9980bdf3f512aa1a712c747652960732a2101c4f89217476f51fbfd6b1"
  end

  def install
    bin.install "drumai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drumai version")
  end
end
