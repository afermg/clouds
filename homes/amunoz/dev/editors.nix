{ pkgs, config, inputs, ...}:
{
  home.packages = with pkgs; [

    gawk
    gnumake # Necessary for emacs' vterm
    libtool # Necessary for emacs' vterm
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
    nerdfonts
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

    magic-wormhole # easy ftp sharing
];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

   xdg = {

       enable = true;
       configFile."doom"= {
     	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/clouds/homes/amunoz/config/doom";
        recursive = true;
   };

   };
}
