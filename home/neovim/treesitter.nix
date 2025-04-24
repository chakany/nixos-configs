{ pkgs, ... }: {
  plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      lua
      rust
      javascript
      typescript
      go
      html
      css
      json
      jsdoc
      make
      markdown
      markdown_inline
      svelte
      yaml
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };
}
