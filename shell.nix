{ pkgs ? import ./nix/nixpkgs.nix { } }:

with pkgs;
mkShell {
  packages = [ bazel_5 buildifier buildozer nix ];
}
