{ pkgs, config, inputs, ...}:
{
  home.packages = with pkgs; [

    # base
    gawk
    gnumake # Necessary for emacs' vterm
    libtool # Necessary for emacs' vterm
    gnused # The one and only sed
    wget # fetch stuff
    ps # processes
    killall
    screen

    # faster/better X
    ripgrep # faster grep in rust
    fd # faster find
    difftastic # better diffs
    dua # better du

    # langs
    cargo # rust packages
    rustc # rust compiler
    cmake # c compiler
    clang # c language
    clang-tools # tools for c language

    # files
    gnutar # The one and only tar
    rsync # sync data
    atuin # shared command history
    unzip # extract zips
    screen

    # terminals
    wezterm
    kitty
    fish
    fishPlugins.async-prompt
    fishPlugins.pure
    fishPlugins.autopair
    # fonts
    nerdfonts # nice fonts, used in doom emacs

    # monitor
    nvitop # top for gpus (prefered)
    nvtopPackages.full # another top for gpus
    btop # nicer btop

    # python
    python310 # the standard python
    poetry # python package management

    # containers
    podman  # for container needs

    # writing
    texliveFull # all the stuff for tex writing  # TODO try to reduce footprint

    # convenience
    gnuplot # no-fuss plotting
    bc # calculator
    fzf # fuzzy finder
    jq # process json
    mermaid-cli # text to diagrams
    parallel # make use of threads on shells
    tldr # quick explanations

    # media
    mpv # video player
    ffmpeg # video processing needs
    imagemagick # image processing
    graphicsmagick # imagemagick (+speed, -features) alternative

    # nix
    nix-index # locate packages that provide a certain file
    nix-search-cli # find nix packages

    # testing
    luajitPackages.fennel # lua in fennel
    monolith # download whole html websites
    xclip # clipboard manipulation tool
    magic-wormhole # easy ftp sharing
];

  programs.git = {
    enable = true;
    userName = "Alan Munoz";
    userEmail = "afer.mg@gmail.com";
    #extraConfig = {
        # Sign all commits using ssh key
    #    commit.gpgsign = true;
    #    gpg.format = "ssh";
    #    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    #    user.signingkey = "~/.ssh/id_ed25519.pub";
    #  };
  };

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
       configFile."pypoetry"= {
     	source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/clouds/homes/amunoz/config/pypoetry";
        recursive = true;
   };
   };
}
