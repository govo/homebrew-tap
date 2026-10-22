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

## acapella

驱动 macOS 上的 Acapella App：建工程、写音符、编和声、调混音、设练习循环、导出并质检。
App 是唯一写入者，CLI 只走本机 127.0.0.1 的 JSON 命令总线。

```bash
brew install govo/tap/acapella
acapella doctor     # App 在不在、token 对不对
acapella state      # 当前工程快照
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

## drumai

`Formula/drumai.rb` 由 `drumai` 仓库的 `mcp/scripts/render-formula.sh` 生成，同样不要手改。
