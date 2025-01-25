{ pkgs, ... }: {
  enable = true;
  enableZshIntegration = true;
  installVimSyntax = true;

  settings = {
    macos-titlebar-style = "tabs";
    macos-titlebar-proxy-icon = "hidden";
    macos-option-as-alt = "left";

    background-opacity = 0.97;
    background-blur-radius = 40;
    font-size = 14;

    mouse-hide-while-typing = true;
  };
}

