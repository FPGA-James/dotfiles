-- =============================================================================
-- lsp/sigasi.lua — Sigasi Visual HDL (VHDL / SystemVerilog / Verilog)
-- Commercial-grade analysis engine. Requires a valid Sigasi license.
--
-- Prerequisites:
--   1. Java 17+              on $PATH
--   2. Sigasi VS Code ext    installed, or JAR extracted manually (see README)
--   3. sigasi-ls script      at ~/.local/bin/sigasi-ls  (chmod +x)
--   4. Valid Sigasi license  set in the launcher script
--   5. .project file         at your project root (REQUIRED)
--
-- Trial: https://www.sigasi.com/trial-request/
--
-- When Sigasi attaches, vhdl_ls is automatically stopped on the same buffer
-- (handled in lua/lsp.lua) to avoid duplicate hover/completion.
-- Verible stays running for formatting.
-- =============================================================================
return {
  cmd = { vim.fn.expand("~/.local/bin/sigasi-ls") },

  filetypes = { "vhdl", "verilog", "systemverilog" },

  root_markers = {
    ".project",   -- Sigasi project descriptor — REQUIRED
    ".sigasi",    -- older Sigasi Studio projects
    ".git",       -- fallback
  },

  -- Give the JVM time to start
  on_new_config = function(config, _root_dir)
    config.init_timeout = 30000
  end,

  init_options = {
    talkBack             = false,
    vhdlVersion          = "2008",   -- "93"|"2002"|"2008"|"2019"
    verilogVersion       = "2005",   -- "95"|"2001"|"2005"
    systemVerilogVersion = "2012",   -- "2005"|"2009"|"2012"|"2017"
  },

  settings = {
    sigasi = {
      ["vhdl.formatting.alignConsecutiveDeclarations"] = false,
      ["vhdl.formatting.capitalizeKeywords"]           = "upper_case",
      ["vhdl.formatting.preserveNewlines"]             = true,
    },
  },
}
