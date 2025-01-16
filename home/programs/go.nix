{ pkgs, ... }:
{
  enable = true;

  package = pkgs.go; # if you want to use a specific version of go
  goPath = "go";
  goBin = ".local/bin.go";
  goPrivate = [
    "github.com/northvolt"
  ];
  packages = {};
}

