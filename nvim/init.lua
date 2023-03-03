--augroup packer_user_config
--  autocmd!
--  autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
--augroup end
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_bootstrap = ensure_packer()	
-- disable netrw at the very start of your init.lua (strongly advised)
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.notify = require("notify")
    require("james.plugins.peek")
    require("james.plugins-setup")
    require("james.core.options")
    require("james.core.keymaps")
    require("james.core.colorscheme")
    -- Enable up Plug ins
    require('james.plugins.notify')
    require('james.plugins.treesitter')
    require('james.plugins.telescope')
    require("james.plugins.nvim-tree")
    require('james.plugins.gitsigns')
    require('james.plugins.trouble')
    require('james.plugins.lsp')  -- lsp engine
    require('james.plugins.lspconfig')
    require('james.plugins.friendly-snippets')
    require('james.plugins.cmp')
    require('james.plugins.lualine')
    require('james.plugins.indent-blankline')
    --require('james.plugins.mason')
    --require('james.plugins.mason-lspconfig')
    require('james.plugins.nvim-web-devicons')
    require('james.plugins.Comment')
    --require('james.plugins.diffview')
    require('james.plugins.luatab')
    require('james.plugins.todo')
    require('james.plugins.wilder')
    require('james.plugins.autopairs')
    require('james.plugins.fine-cmdline')
    require('james.plugins.bufferline')
    require('james.plugins.alpha')
    --require("james.plugins.alpha").setup()
    --require('james.plugins.auto-session')
    --require('james.plugins.session-lens')
    --require('james.plugins.dashboard')
    --require('james.plugins.undotree')
    --require('james.plugins.neoclip')
