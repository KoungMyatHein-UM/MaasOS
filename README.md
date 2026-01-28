# MaasOS
A declarative, Flake-based NixOS configuration for the MaasSec. This setup generates a custom ISO with Plasma 6, pre-configured user environments, and automated configuration cloning.

## Getting Started

### 0. Prerequisites
Ensure you have Nix installed with Flakes enabled.

### 1. Clone the Repository
Clone the MaasOS configuration to your local machine:
```bash
    git clone https://github.com/KoungMyatHein-UM/MaasOS.git
    cd MaasOS
```

### 2. Verify configurations:
If you don't know what you are looking at, go grab someone who does.
```bash
    nix flake show
```

### 2.1 (Optional) Check settings before building:
Only if you're curious. :^)
```bash
    nix repl
    # Inside repl:
    # :lf .
    # nixosConfigurations.MaasOS.options.installer.cloneConfig.value
```

### 3. IMPORTANT!!! Refresh Dependencies:
```bash
    nix flake update
````

### 4. To build:
Artifacts will be in `result/iso/`
```bash
    nix build .#nixosConfigurations.MaasOS.config.system.build.isoImage
```