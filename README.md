# MaasOS

### Check before building:
```
nix repl
```

### To build:
```
sudo nix build .#nixosConfigurations.live.config.system.build.isoImage
```