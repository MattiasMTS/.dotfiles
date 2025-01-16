{ pkgs, ... }:
{
  enable = true;
  enableZshIntegration = true;

  settings = {
    add_newline = false;
    format = "$all";
    directory.truncation_length = 5;
    env_var.NVCDK_TARGETS = {
      symbol = "🔧 ";
      style = "bold green";
      format = "on [$symbol$env_value]($style) ";
    };
    battery.display = [
      { threshold = 50; }
    ];
  };

}
