{ config, lib, ... }:
let
  cfg = config.plugins.git-worktree;
in
{
  plugins = {
    git-worktree = {
      enable = true;
      enableTelescope = config.plugins.telescope.enable;

      # TODO: migrate plugin to mkNeovimPlugin
      # lazyLoad.settings.keys = [
      #   "<leader>gw"
      #   "<leader>fg"
      #   "<leader>gWc"
      #   "<leader>gWs"
      # ];
    };

    which-key.settings.spec = lib.optionals (cfg.enableTelescope && cfg.enable) [
      {
        __unkeyed-1 = "<leader>gW";
        group = "Worktree";
        icon = "󰙅 ";
      }
    ];
  };

  keymaps = lib.mkIf cfg.enableTelescope [
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope git_worktree<CR>";
      options = {
        desc = "Git Worktree";
      };
    }
    {
      mode = "n";
      key = "<leader>gWc";
      action.__raw = ''
        function()
          require('telescope').extensions.git_worktree.create_git_worktree()
        end
      '';
      options = {
        desc = "Create worktree";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>gWs";
      action.__raw = ''
        function()
          require('telescope').extensions.git_worktree.git_worktrees()
        end
      '';
      options = {
        desc = "Switch / Delete worktree";
        silent = true;
      };
    }
  ];
}
