{ pkgs, ... }: {
  enable = true;
  matchBlocks."*" = {
    extraOptions = { UseKeychain = "yes"; };
    identityFile = "~/.ssh/id_ed25519";
  };
  addKeysToAgent = "yes";
}
