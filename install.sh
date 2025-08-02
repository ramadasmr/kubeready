#!/usr/bin/env bash
set -e

BIN_DIR="/opt/kubeutils/bin"
KUBESORT_URL="https://raw.githubusercontent.com/ramadasmr/kubeready/refs/heads/main/kubeready"

sudo mkdir -p "$BIN_DIR"
curl -L -o kubeready "$KUBESORT_URL"
chmod +x kubeready
sudo mv kubeready "$BIN_DIR"

[ -n "$ZSH_VERSION" ] && SHELL_RC="${HOME}/.zshrc" || SHELL_RC="${HOME}/.bashrc"

if ! grep -q "$BIN_DIR" "$SHELL_RC"; then
  echo "export PATH=\"$BIN_DIR:\$PATH\"" >> "$SHELL_RC"
fi

if ! grep -q "alias kready=" "$SHELL_RC"; then
  echo "alias kready=\"kubeready\"" >> "$SHELL_RC"
fi

export PATH="$BIN_DIR:$PATH"
alias kready="kubeready"
