local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
    'verible',
  })
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '❌',
        warn = '⚠️',
        hint = '🔍',
        info = 'ℹ️' 
    }
})

lsp.setup()