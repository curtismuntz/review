{ pkgs ? import ./nix/nixpkgs.nix { } }:

with pkgs;
mkShell {
  packages = [ bazel_6 buildifier buildozer nix ];
}
