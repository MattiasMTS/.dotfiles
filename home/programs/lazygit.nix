{ pkgs, ... }: {
  enable = true;

  settings = {
    notARepository = "quit";
    gui = {
      showBottomLine = false;
      border = "rounded";
      nerdFontsVersion = 3;
      showIcons = true;
      showFileTree = true;
    };
    os = {
      edit = "nvim-remote";
      editPreset = "nvim-remote";
      editAtLine = "{{editor}} {{filename}}";
    };
  };

}

