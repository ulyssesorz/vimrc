# Install for linux

```shell
# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/lasorda/vimrc.git

mkdir -p ~/.config/nvim && cp -r vimrc/neovim/* ~/.config/nvim

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

rm -rf vimrc
```
