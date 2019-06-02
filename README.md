# @vintharas' Neovim Config For Greater Justice

If you want to use this configuration yourself then follow these steps:

1. clone the repo in your vimrc folder (`~/.config/nvim/`)
2. Update your terminal config to have a `$MYVIMCONFIG` variable that points to the vimrc folder: (f.i. `export MYVIMCONFIG=~/.config/nvim/`)
    - this is used to load configuration files that I've separated in their own files with meaningful names
3. Make sure that all plugins are installed
  - I use minpac as plugin manager
  - Open Vim and type `:PackUpdate`
  - If there's any errors follow the installation instructions from the specific plugin that is causing the error (you can find them on GitHub)
      - The `:checkhealth` command in Neovim can be useful to troubleshoot things and may point you at a culprit
  - The coc plugin (used for completion and many other things) uses its own way to manage extensions. You can install the using the `:CocInstall {extension}` command. See the coc section of the vimrc for the plugins that I normally have installed
4. Victory
