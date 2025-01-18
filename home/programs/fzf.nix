{ pkgs, ... }: {
  enable = true;
  enableZshIntegration = true;
  tmux.enableShellIntegration = true;
  defaultOptions = [
    "--bind=ctrl-j:down,ctrl-k:up"
  ];
}
