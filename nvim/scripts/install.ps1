# =============================================================================
# install.ps1 — download all local plugins into pack/local/opt/ (no git required)
#
# Same plugin set as install.sh, but pulls each repo's default-branch zipball
# instead of `git clone`. Useful on machines without git, or where you'd
# rather not carry .git history for vendored plugins.
#
# Run from your ~/.config/nvim (or repo nvim/) directory:
#   pwsh -File scripts/install.ps1
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
Write-Host "-- Sigasi launcher script -----------------------------------------------------"
$LauncherDir = Join-Path $HOME ".local\bin"
$Launcher = Join-Path $LauncherDir "sigasi-ls.ps1"
New-Item -ItemType Directory -Force -Path $LauncherDir | Out-Null
if (Test-Path $Launcher) {
    Write-Host "  * $Launcher already exists, skipping"
} else {
    @'
# Sigasi language server launcher — edit paths below to match your setup.

$SigasiExt = Join-Path $HOME ".local\share\sigasi-ls\extension"
$env:SIGASI_LM_LICENSE_FILE = Join-Path $HOME ".config\sigasi\sigasi.lic"
# $env:LM_LICENSE_FILE = "27000@your-license-server"
$JavaBin = "java"

$LsJar = Get-ChildItem -Path $SigasiExt -Filter *.jar -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
if (-not $LsJar) {
    # Fallback: check VS Code extensions directory
    $LsJar = Get-ChildItem -Path (Join-Path $HOME ".vscode\extensions\sigasi.sigasi-visual-hdl-*") -Filter *.jar -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
}
if (-not $LsJar) {
    Write-Error "sigasi-ls: JAR not found. See README for setup instructions."
    exit 1
}
& $JavaBin -Xmx4g -Xms512m -XX:+UseG1GC -jar $LsJar.FullName --stdio @args
'@ | Set-Content -Path $Launcher
    Write-Host "  + created $Launcher"
}

Write-Host ""
Write-Host "-- LSP server binaries (install separately) ------------------------------------"
Write-Host "  npm install -g pyright"
Write-Host "  npm install -g @imc-trading/svlangserver"
Write-Host "  npm install -g yaml-language-server"
Write-Host "  cargo install vhdl_ls"
Write-Host "  cargo install taplo-cli --features lsp"
Write-Host "  # Verible: https://github.com/chipsalliance/verible/releases"
Write-Host "  # Sigasi:  https://www.sigasi.com/manual/getting-started/installation/"
Write-Host "  winget install JernejSimoncic.Marksman   # markdown LSP (or: cargo install marksman)"
Write-Host "  winget install JohnnyMorganz.StyLua       # Lua formatter (conform.nvim)"
Write-Host "  pip install black                         # Python formatter (conform.nvim)"
Write-Host ""
Write-Host "Done! Open Neovim and run :checkhealth to verify."
