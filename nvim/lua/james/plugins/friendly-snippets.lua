--require("luasnip.loaders.from_vscode").lazy_load({include = {"verilog"}})

--require'luasnip'.filetype_extend("verilog")                           --pull in verilog snippets
---- Load snippets from snippets folder 

--function config.luasnip()
--    vim.o.runtimepath = vim.o.runtimepath .. "," .. os.getenv("HOME") .. "/.config/nvim/lua/core/snippets/,"
--    require("luasnip").config.set_config {
--            history = true,
--            updateevents = "TextChanged, TextChangedI"
--    }
--    require("luasnip/loaders/from_vscode").load()
--end