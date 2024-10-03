if vim.g.vscode then
    -- VSCode extension
-- TODO add VSCode handler here 
-- --local ensure_packer = function()
    --    local fn = vim.fn
    --    --local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    --    local install_path = fn.stdpath("data") .. "/users/apaweuc1svm02/james.fleeting/.local/share/nvim/site/pack/packer/start/packer.nvim"
    --    if fn.empty(fn.glob(install_path)) > 0 then
    --        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    --        vim.cmd([[packadd packer.nvim]])
    --        return true
    --    end
    --    return false
    --end
--
    --local packer_bootstrap = ensure_packer()
--
else
    ---- ordinary Neovim
    vim.cmd([[
        augroup packer_user_config
          autocmd!
          autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
        augroup end
      ]])
    -- autocommand that reloads neovim and installs/updates/removes plugins when file is saved

    vim.g.mapleader = " " -- Set map leader
    vim.g.loaded_netrw = 1                  -- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrwPlugin = 1
    
    require("plugin")
    require("core.options")
    require("core.keymaps")
    require("core.colorscheme")
    -- vim.notify = require("plugin.notify") -- use notify plugin for notofocations
    -------------------------------------------------------
end
