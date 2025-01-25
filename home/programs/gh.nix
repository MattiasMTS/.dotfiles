{ pkgs, ... }: {
  enable = true;
  settings.aliases = {
    co = "pr checkout";
    pv = "pr view";
  };
  settings.editor = "nvim";
  settings.git_protocol = "https";
}

