#
#  drumai.rb —— Homebrew formula 模板
#
#  它是 homebrew tap 仓库（govo/homebrew-tap）里 Formula/drumai.rb 的初始版本。
#  真正的发布文件由 scripts/render-formula.sh 从这份模板生成：填好版本号与两个架构
#  的 url / sha256，输出到 dist/drumai.rb，再由人放进 tap 仓库。
#
#  下面的 url 与 sha256 是占位值。一个 formula 覆盖两个架构：brew 按本机 CPU
#  选 on_arm / on_intel 块。不做 universal binary —— 胖二进制体积翻倍，两个
#  tar.gz 更省，这也是 Homebrew 的常规做法。
#
#  二进制挂在 govo/drumak_skill 的 Release 上（CLI 与 skill 同仓库），tag 用
#  drumai-v<版本> 前缀，和 skill 自己的版本 tag 分开。
#

class Drumai < Formula
  desc "Command line tool for creating Drum AI drum presets"
  homepage "https://github.com/govo/drumak_skill"
  version "0.0.0"

  on_arm do
    url "https://github.com/govo/drumak_skill/releases/download/drumai-v0.0.0/drumai-0.0.0-darwin-arm64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_intel do
    url "https://github.com/govo/drumak_skill/releases/download/drumai-v0.0.0/drumai-0.0.0-darwin-x64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  def install
    bin.install "drumai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/drumai version")
  end
end
