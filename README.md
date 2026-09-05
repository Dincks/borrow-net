# borrow-net

## 一键安装

使用 `wget` 下载并立即执行安装脚本：

```bash
wget -qO- https://raw.githubusercontent.com/Dincks/borrow-net/main/install.sh | bash
```

安装脚本会把最新的 `borrow-net` 安装到 `~/.local/bin/borrow-net`。脚本通过管道执行，不会在当前目录留下安装脚本；安装过程中的临时文件会在退出时自动删除。

安装完成后，如果 `~/.local/bin` 尚未加入 `PATH`，按提示执行对应命令，然后运行：

```bash
borrow-net
```

如需跳过安装后的交互向导：

```bash
wget -qO- https://raw.githubusercontent.com/Dincks/borrow-net/main/install.sh | AUTO_RUN=no bash
```
