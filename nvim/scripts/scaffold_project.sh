#!/usr/bin/env bash
# =============================================================================
# scaffold_project.sh — create all LSP root files for a new HDL project.
# Run from your project root:
#   bash ~/.config/nvim/scripts/scaffold_project.sh
# =============================================================================

set -e
PROJECT_NAME=$(basename "$PWD")

echo "Scaffolding LSP root files in: $PWD"
echo ""

# ── vhdl_ls.toml ──────────────────────────────────────────────────────────────
if [[ ! -f "vhdl_ls.toml" ]]; then
  cat > vhdl_ls.toml << 'EOF'
[libraries]
work.files = [
  'src/**/*.vhd',
]
tb.files = [
  'tb/**/*.vhd',
]
EOF
  echo "  ✓ created vhdl_ls.toml"
else
  echo "  · vhdl_ls.toml already exists"
fi

# ── .project (Sigasi) ─────────────────────────────────────────────────────────
if [[ ! -f ".project" ]]; then
  cat > .project << EOF
<?xml version="1.0" encoding="UTF-8"?>
<projectDescription>
  <name>${PROJECT_NAME}</name>
  <buildSpec>
    <buildCommand>
      <name>com.sigasi.hdt.vhdl.ui.vhdlBuilder</name>
    </buildCommand>
  </buildSpec>
  <natures>
    <nature>com.sigasi.hdt.vhdl.ui.vhdlNature</nature>
    <nature>com.sigasi.hdt.systemverilog.ui.svNature</nature>
  </natures>
</projectDescription>
EOF
  echo "  ✓ created .project"
else
  echo "  · .project already exists"
fi

# ── pyrightconfig.json ────────────────────────────────────────────────────────
if [[ ! -f "pyrightconfig.json" ]]; then
  cat > pyrightconfig.json << 'EOF'
{
  "pythonVersion": "3.11",
  "typeCheckingMode": "basic"
}
EOF
  echo "  ✓ created pyrightconfig.json"
else
  echo "  · pyrightconfig.json already exists"
fi

# ── svlangserver.yaml ─────────────────────────────────────────────────────────
if [[ ! -f "svlangserver.yaml" ]]; then
  cat > svlangserver.yaml << 'EOF'
systemverilog:
  launchConfiguration: "verilator -sv --lint-only -Wall"
  includeIndexing:
    - "**/*.{sv,svh,v,vh}"
  excludeIndexing:
    - "sim/**"
    - "build/**"
EOF
  echo "  ✓ created svlangserver.yaml"
else
  echo "  · svlangserver.yaml already exists"
fi

# ── .yamllint (YAML LSP root marker) ──────────────────────────────────────────
if [[ ! -f ".yamllint" && ! -d ".git" ]]; then
  touch .yamllint
  echo "  ✓ created .yamllint (YAML LSP root marker)"
fi

echo ""
echo "Done. Open Neovim from this directory and LSP servers will attach."
