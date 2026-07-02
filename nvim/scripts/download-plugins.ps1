# =============================================================================
# download-plugins.ps1 — download plugin/colorscheme repos into pack/local/opt/
# (no git required)
#
# Trimmed-down counterpart to install.ps1: only the repo downloads, none of
# the Sigasi launcher or LSP-binary setup steps.
#
# Run from your ~/.config/nvim (or repo nvim/) directory:
#   pwsh -File scripts/download-plugins.ps1
# =============================================================================

$ErrorActionPreference = "Stop"

$Base = Join-Path (Split-Path -Parent $PSScriptRoot) "pack\local\opt"
New-Item -ItemType Directory -Force -Path $Base | Out-Null

function Get-Plugin {
    param(
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][string]$RepoSlug   # "owner/repo"
    )

    $dest = Join-Path $Base $Name
    if (Test-Path $dest) {
        Write-Host "  * $Name already exists, skipping"
        return
    }

    Write-Host "  -> downloading $Name..."

    $tmpZip = Join-Path ([System.IO.Path]::GetTempPath()) "$Name.zip"
    $tmpDir = Join-Path ([System.IO.Path]::GetTempPath()) "$Name-extract"
    if (Test-Path $tmpDir) { Remove-Item $tmpDir -Recurse -Force }

    # GitHub resolves "HEAD" to the repo's actual default branch (main/master/etc.)
    # and redirects to the matching codeload zip — no need to know the branch name.
    Invoke-WebRequest -Uri "https://github.com/$RepoSlug/archive/HEAD.zip" -OutFile $tmpZip -UseBasicParsing

    Expand-Archive -Path $tmpZip -DestinationPath $tmpDir -Force

    # The zip contains a single top-level "<repo>-<sha>" directory — move its
    # contents into place under the plugin's plain name.
    $extracted = Get-ChildItem -Path $tmpDir -Directory | Select-Object -First 1
    Move-Item -Path $extracted.FullName -Destination $dest

    Remove-Item $tmpZip -Force
    Remove-Item $tmpDir -Recurse -Force
}

Write-Host "-- Plugins ------------------------------------------------------------------"
Get-Plugin "which-key.nvim"       "folke/which-key.nvim"
Get-Plugin "snacks.nvim"          "folke/snacks.nvim"
Get-Plugin "nvim-web-devicons"    "nvim-tree/nvim-web-devicons"
Get-Plugin "plenary.nvim"         "nvim-lua/plenary.nvim"
Get-Plugin "claude-code.nvim"     "greggh/claude-code.nvim"
Get-Plugin "claude-preview.nvim"  "Cannon07/claude-preview.nvim"
Get-Plugin "git-dashboard-nvim"   "juansalvatore/git-dashboard-nvim"
Get-Plugin "obsidian.nvim"        "obsidian-nvim/obsidian.nvim"
Get-Plugin "nvim-surround"        "kylechui/nvim-surround"
Get-Plugin "todo-comments.nvim"   "folke/todo-comments.nvim"
Get-Plugin "conform.nvim"         "stevearc/conform.nvim"
Get-Plugin "flash.nvim"           "folke/flash.nvim"
Get-Plugin "vim-repeat"           "tpope/vim-repeat"
Get-Plugin "mini.nvim"            "echasnovski/mini.nvim"
Get-Plugin "diffview.nvim"        "sindrets/diffview.nvim"
Get-Plugin "blink.cmp"            "saghen/blink.cmp"
Get-Plugin "minuet-ai.nvim"       "milanglacier/minuet-ai.nvim"
Get-Plugin "nvim-treesitter"      "nvim-treesitter/nvim-treesitter"
Get-Plugin "render-markdown.nvim" "MeanderingProgrammer/render-markdown.nvim"
Get-Plugin "md-agenda.nvim"       "zenarvus/md-agenda.nvim"
Get-Plugin "neogit.nvim"          "NeogitOrg/neogit"

Write-Host ""
Write-Host "-- Colorschemes ---------------------------------------------------------------"
Get-Plugin "catppuccin"      "catppuccin/nvim"
Get-Plugin "tokyonight.nvim" "folke/tokyonight.nvim"
Get-Plugin "rose-pine"       "rose-pine/neovim"
Get-Plugin "kanagawa.nvim"   "rebelot/kanagawa.nvim"
Get-Plugin "nightfox.nvim"   "EdenEast/nightfox.nvim"
Get-Plugin "gruvbox.nvim"    "ellisonleao/gruvbox.nvim"
Get-Plugin "onedark.nvim"    "navarasu/onedark.nvim"
Get-Plugin "everforest"      "sainnhe/everforest"
Get-Plugin "dracula.nvim"    "Mofiqul/dracula.nvim"
Get-Plugin "oxocarbon.nvim"  "nyoom-engineering/oxocarbon.nvim"

Write-Host ""
Write-Host "Done! Plugin repos downloaded into $Base"
