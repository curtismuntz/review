{ system ? builtins.currentSystem, ... }:

import (builtins.fetchTarball {
  name = "nixos-22.11-2022-11-30";
  # URL obtained from https://status.nixos.org/
  url = "https://github.com/NixOS/nixpkgs/archive/4d2b37a84fad1091b9de401eb450aae66f1a741e.tar.gz";
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "11w3wn2yjhaa5pv20gbfbirvjq6i3m7pqrq2msf0g7cv44vijwgw";
}) {
  inherit system;
  overlays = [];
  config = {};
}
