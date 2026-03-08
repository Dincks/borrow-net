#!/usr/bin/env bash
set -euo pipefail

BASE_URL="${BASE_URL:-https://raw.githubusercontent.com/Dincks/borrow-net/main}"
BIN_NAME="borrow-net"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/bin}"
TARGET="${INSTALL_DIR}/${BIN_NAME}"

download() {
  local url="$1"
  local out="$2"

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$out"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$out" "$url"
  else
    echo "[ERR] 需要 curl 或 wget" >&2
    exit 1
  fi
}

echo "[INFO] 安装 ${BIN_NAME} 到 ${TARGET}"
mkdir -p "$INSTALL_DIR"

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

download "${BASE_URL}/${BIN_NAME}" "$tmp"
chmod +x "$tmp"
mv "$tmp" "$TARGET"

case ":$PATH:" in
  *":$INSTALL_DIR:"*) ;;
  *)
    echo
    echo "[WARN] 你的 PATH 里还没有 ${INSTALL_DIR}"
    echo "请执行："
    echo "  echo 'export PATH=\"${INSTALL_DIR}:\$PATH\"' >> ~/.bashrc && source ~/.bashrc"
    ;;
esac

echo
echo "[OK] 安装完成"
echo "可用命令："
echo "  ${BIN_NAME}"
echo "  ${BIN_NAME} enable 192.168.1.1 -u nbt"
echo "  ${BIN_NAME} clear 192.168.1.1 -u nbt"
