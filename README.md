# MaasOS

### Verify configurations:
```bash
nix flake show
```

### Check before building:
```bash
nix repl
# Inside repl:
# :lf .
# nixosConfigurations.MaasOS.options.installer.cloneConfig.value
```

### To build:
```bash
nix build .#nixosConfigurations.MaasOS.config.system.build.isoImage
```