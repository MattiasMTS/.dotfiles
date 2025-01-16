{ pkgs, lib, config,... }:
# NOTE: docs for nix-darwin found
# https://daiderd.com/nix-darwin/manual/index.html
let
  username = "mattiassjodin";
in 
{
  system = {
    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;

    # Customize the system configuration
    defaults = {
      # customize dock
      dock = {
        autohide = true;
        show-recents = false;

        # # customize Hot Corners
        # wvous-tl-corner = 2;  # top-left - Mission Control
        # wvous-tr-corner = 13;  # top-right - Lock Screen
        # wvous-bl-corner = 3;  # bottom-left - Application Windows
        # wvous-br-corner = 4;  # bottom-right - Desktop
      };
    };
  };
}
