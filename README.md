# NixOS Configuration

Modular NixOS configuration for personal setup with Hyprland.

## Structure

```
.
├── configuration.nix          # Main configuration file
├── hardware-configuration.nix # Hardware-specific (generated, not in repo)
└── modules/
    ├── boot.nix
    ├── networking.nix
    ├── locale.nix
    ├── hardware.nix
    ├── display.nix
    ├── audio.nix
    ├── users.nix
    ├── fonts.nix
    ├── packages.nix
    ├── environment.nix
    ├── security.nix
    ├── services.nix
    ├── nixpkgs.nix
    ├── virtualisation.nix
    └── home-manager/
        ├── default.nix
        ├── hyprland-bindings.nix
        └── packages.nix
```

## Transfer to Host

### Option 1: Git (Recommended)

1. Push to remote repository:
```bash
git remote add origin <your-repo-url>
git push -u origin main
```

2. On host, clone the repository:
```bash
cd /etc/nixos
git clone <your-repo-url> .
# Or if /etc/nixos already exists:
git clone <your-repo-url> /tmp/nixos-config
sudo cp -r /tmp/nixos-config/* /etc/nixos/
```

### Option 2: rsync/scp

```bash
# From this machine
rsync -avz --exclude='.git' --exclude='hardware-configuration.nix' \
  /Users/maksyastrebov/Projects/Personal/DevOps/nixos/ \
  user@host:/etc/nixos/
```

### Option 3: Archive

```bash
# Create archive
tar -czf nixos-config.tar.gz --exclude='.git' --exclude='hardware-configuration.nix' .

# Transfer and extract on host
scp nixos-config.tar.gz user@host:/tmp/
ssh user@host "cd /etc/nixos && sudo tar -xzf /tmp/nixos-config.tar.gz"
```

## After Transfer

1. **Generate hardware-configuration.nix** (if not exists):
```bash
sudo nixos-generate-config
```

2. **Test configuration**:
```bash
sudo nixos-rebuild dry-run
```

3. **Apply configuration**:
```bash
sudo nixos-rebuild switch
```

## Notes

- `hardware-configuration.nix` is machine-specific and should be generated on each host
- Make sure to review and adjust configuration for your specific hardware
- User name is set to "maks" - change if needed in `modules/users.nix`

