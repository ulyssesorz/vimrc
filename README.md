# Install for linux

```shell
#remove all
rm -rf  ~/.local/share/nvim/site/pack/packer/start/

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/lasorda/vimrc.git

if [ -d ~/.config/nvim ]; then
  timestamp=$(date +%Y-%m-%d_%H-%M-%S)
  mv ~/.config/nvim ~/.config/nvim_$timestamp
fi

mkdir -p ~/.config/nvim && cp -r vimrc/* ~/.config/nvim

vim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

rm -rf vimrc
```
