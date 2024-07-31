# What is this?

Oh hi, welcome to my VS Code config files.

## Instalation

### ATTENTION
This will remove your old configs. Backup it before running any of these scripts.

### VSCode

### VSCodium

```bash
rm -f ~/.config/VSCodium/User/keybindings.json && \
rm -f ~/.config/VSCodium/User/settings.json && \
git clone https://github.com/PolyCatDev/config-files.git && \
cd config-files/vscode/ && \
cp *.json ~/.config/VSCodium/User/ && \
cd ../../ && \
rm -rf polycat-config-files
```

```bash
rm -f ~/.config/Code/User/keybindings.json && \
rm -f ~/.config/Code/User/settings.json && \
git clone https://github.com/PolyCatDev/config-files.git && \
cd config-files/vscode/ && \
cp *.json ~/.config/Code/User/ && \
cd ../../ && \
rm -rf polycat-config-files
```