{ pkgs, ... }: {
  enable = true;

  # if you want to use a specific version of jdk
  package = pkgs.jdk17;
}

