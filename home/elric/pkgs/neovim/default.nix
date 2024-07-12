{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lua-language-server
    vscode-langservers-extracted
    rust-analyzer
  ];

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraLuaConfig = "
      ${builtins.readFile lua/options.lua}
      ${builtins.readFile lua/keymaps.lua}
      ${builtins.readFile lua/globals.lua}
      ${builtins.readFile lua/highlights.lua}
      ${builtins.readFile lua/paradise.lua}
      ${builtins.readFile lua/configs/alpha.lua}
      ${builtins.readFile lua/configs/autopairs.lua}
      ${builtins.readFile lua/configs/bufferline.lua}
      ${builtins.readFile lua/configs/cmp.lua}
      ${builtins.readFile lua/configs/colorizer.lua}
      ${builtins.readFile lua/configs/comments.lua}
      ${builtins.readFile lua/configs/diagnostics.lua}
      ${builtins.readFile lua/configs/gitsigns.lua}
      ${builtins.readFile lua/configs/goto.lua}
      ${builtins.readFile lua/configs/indents.lua}
      ${builtins.readFile lua/configs/lsp.lua}
      ${builtins.readFile lua/configs/lualine.lua}
      ${builtins.readFile lua/configs/neotree.lua}
      ${builtins.readFile lua/configs/notify.lua}
      ${builtins.readFile lua/configs/rainbowbrackets.lua}
      ${builtins.readFile lua/configs/telescope.lua}
      ${builtins.readFile lua/configs/toggleterm.lua}
      ${builtins.readFile lua/configs/treesitter.lua}
      ${builtins.readFile lua/configs/trouble.lua}
      ${builtins.readFile lua/configs/whichkey.lua}
      ${builtins.readFile lua/lualinetheme.lua}
    ";

    plugins = with pkgs.vimPlugins; [
      nvim-web-devicons
      alpha-nvim
      which-key-nvim
      neo-tree-nvim
      nui-nvim
      bufferline-nvim
      lualine-nvim
      toggleterm-nvim
      telescope-nvim
      trouble-nvim
      nvim-notify
      goto-preview
      nvim-autopairs
      lspkind-nvim
      nvim-lspconfig
      nerdcommenter
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      cmp-vsnip
      vim-vsnip
      nvim-colorizer-lua
      indent-blankline-nvim
      base16-nvim
      plenary-nvim
      gitsigns-nvim
      vim-nix
      rust-vim

      (nvim-treesitter.withPlugins (p: [
        p.tree-sitter-nix
        p.tree-sitter-lua
        p.tree-sitter-bash
        p.tree-sitter-json
        p.tree-sitter-css
        p.tree-sitter-rust
        p.tree-sitter-c
        p.tree-sitter-cpp
        p.tree-sitter-yuck
        p.tree-sitter-html
      ]))
    ];
  };
}
