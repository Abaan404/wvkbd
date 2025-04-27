{
  description = "wvkbd flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        nativeBuildInputs = [
          pkgs.pkg-config
          pkgs.wayland-scanner
        ];

        buildInputs = [
          pkgs.cairo
          pkgs.glib
          pkgs.harfbuzz
          pkgs.libxkbcommon
          pkgs.pango
          pkgs.wayland
        ];
      };
    };
}
