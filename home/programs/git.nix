{ username, ... }: {
  enable = true;
  userName = "MattiasMTS";
  userEmail = "mattias.sjodin.6764@hotmail.com";

  extraConfig = {
    user.signingkey = "/Users/${username}/.ssh/id_ed25519.pub";
    commit.gpgsign = true;
    gpg.format = "ssh";
    core = {
      editor = "nvim";
      pager = "delta";
    };
    interactive.diffFilter = "delta --color-only";
    delta.navigate = true;
    merge.conflictstyle = "diff3";
    diff.colorMoved = "default";
  };

  extraConfig = {
    "includeIf \"gitdir:~/northvolt/\"" = {
      email = "mattias.sjodin@northvolt.com";
    };
  };
}

