{
  description = "Home Manager configuration of glabyl";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    yaskkserv2 = {
      url = "github:wachikun/yaskkserv2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    conv-unicode-skkserv = {
      url = "github:kakkak444/conv-unicode-skkserv-hs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, yaskkserv2, conv-unicode-skkserv, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      extraFlakes = {
        yaskkserv2 = yaskkserv2 // { packages = builtins.mapAttrs (system: pkgsSet: {
            default = pkgsSet.default.overrideAttrs (oldAttrs: {
                  env.RUSTFLAGS = "${oldAttrs.env.RUSTFLAGS or ""} -C target-cpu=native ";
                  cargoBuildType = "production";
                });
              }) yaskkserv2.packages;
          };
        conv-unicode-skkserv = conv-unicode-skkserv;
      };
    in
    {
      homeConfigurations."glabyl" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home-manager/home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = {
          inherit extraFlakes;
        };
      };
    };
}
