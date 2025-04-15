{
  description = "Nix flake for Syncthing Folder Event Daemon";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
    rustPlatform = pkgs.rustPlatform;
  in {
    packages.x86_64-linux.sfed = rustPlatform.buildRustPackage {
      name = "sfed";
      version = "1.1.0";

      src = ./.; 
      cargoLock = {
        lockFile = ./Cargo.lock;
      };

      meta = with pkgs.lib; {
        description = "Syncthing Folder Event Daemon";
        license = licenses.gpl3;
        maintainers = [ maintainers.maatteogekko ];
        platforms = platforms.linux;
      };
    };
  };
}