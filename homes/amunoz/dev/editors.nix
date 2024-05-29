{ pkgs, config, inputs, ...}:
{
  home.packages = with pkgs; [

  gawk
  gnused
  gnutar
  wget
  ps
  atuin
  bc
  fzf
  jq
  mermaid-cli
  parallel
  direnv
  luajitPackages.fennel
  bc
  rsync
  monolith
  tldr
    xclip
    ripgrep
    cargo
    rustc
    cmake
    clang
    clang-tools
    unzip
    nvitop
    btop
    fd
    imagemagick
    poetry
    python310
    gnuplot
    podman
    ffmpeg
    mpv
    graphicsmagick
    difftastic
    (emacs29.override { withImageMagick = true; })
    aspell
    texliveFull
    nix-index
    nix-search-cli

];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
