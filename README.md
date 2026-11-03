# govo/homebrew-tap

个人 Homebrew tap。

```bash
brew tap govo/tap
```

## formula

| 名字 | 安装 | 说明 |
| --- | --- | --- |
| `acapella` | `brew install govo/tap/acapella` | Acapella.app 的命令行客户端（`acapella`） |
| `drumai` | `brew install govo/tap/drumai` | Drum AI 鼓机预设的生成工具（`drumai`） |
| `splitjam` | `brew install govo/tap/splitjam` | SplitJam.app 的命令行客户端（`splitjam`） |

## acapella

驱动 macOS 上的 Acapella App：建工程、写音符、编和声、调混音、设练习循环、导出并质检。
App 是唯一写入者，CLI 只走本机 127.0.0.1 的 JSON 命令总线。

```bash
brew install govo/tap/acapella
acapella doctor     # App 在不在、token 对不对
acapella state      # 当前工程快照
```

Homebrew 6 起，第三方 tap 需要先信任，否则会拒绝加载 formula：

```bash
brew trust govo/tap          # 已在装了 drumai 的机器上执行过就可以跳过
```

前置：Acapella.app 运行中，且 设置 → 「AI 控制」已打开。

`Formula/acapella.rb` 由 `acapella-cli/scripts/release.sh` 整份生成，**不要手改**
（url / sha256 / version 都跟着发版脚本走）。发新版：

```bash
cd ../acapella_cli
./scripts/release.sh --version 0.2.0 --formula ../homebrew-tap/Formula/acapella.rb
gh release create v0.2.0 dist/*.tar.gz
git -C ../homebrew-tap commit -am "acapella 0.2.0" && git -C ../homebrew-tap push
```

## splitjam

驱动 macOS 上的 SplitJam（StemsPlayer）：读工程与轨道、调增益/声相/静音/独奏/折叠、重设节拍网格
（模式、BPM、拍号、锚点、拍线、重拍、吸附）、节拍器、练习分段、和弦显示与小节备注、读歌词、
导出波形与 WAV 片段。App 是唯一写入者，CLI 只往 App Group 容器里的文件邮箱投一条请求。

```bash
brew install govo/tap/splitjam
splitjam --version
splitjam doctor     # App 在不在、token 对不对、权益是什么
splitjam project list
```

前置：SplitJam.app 运行中，且 设置 → **Command Line Access** 已打开（默认关闭）。
App 没开时命令立即失败，请求不落盘、不补做。

`Formula/splitjam.rb` 由 `splitjam_cli/scripts/release.sh` 整份生成，**不要手改**
（url / sha256 / version 都跟着发版脚本走）。发新版：

```bash
cd ../splitjam_cli
./scripts/release.sh --version 0.2.0 --formula ../homebrew-tap/Formula/splitjam.rb
gh release create v0.2.0 dist/splitjam-0.2.0-darwin-arm64.tar.gz \
  dist/splitjam-0.2.0-darwin-x64.tar.gz dist/checksums.txt --title v0.2.0
git -C ../homebrew-tap commit -am "splitjam 0.2.0" && git -C ../homebrew-tap push
```

产物带 Developer ID 签名 + 公证；CLI 源码在 App 仓库（`demucs/cli`），`splitjam_cli` 只放发布产物。
Agent 用的操作规程在 [`govo/splitjam_skill`](https://github.com/govo/splitjam_skill)。

## drumai

`Formula/drumai.rb` 由 `drumai` 仓库的 `mcp/scripts/render-formula.sh` 生成，同样不要手改。
