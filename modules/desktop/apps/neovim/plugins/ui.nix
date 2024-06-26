{ pkgs, config, lib, user, ... }:
let
  inherit (lib) mkIf;
  cfg = config.modules.desktop.apps.neovim;
in {
  home-manager.users.${user}.programs.nixvim = mkIf cfg.enable {
    plugins = {
      # TODO: mini
      lualine.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      nui-nvim
    ];
  };
}
