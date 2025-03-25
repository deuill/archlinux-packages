# ArchLinux Package Repository

This repository contains an assortment of package builds for ArchLinux, mainly in support of setting
up a complete, consistent system.

![Screenshot of a Sway-based desktop environment, with Rofi, btop, and NCMPCpp open in the foreground.](screenshots/desktop.png)

Check individual package folders for more specific information on their use and contents.

## Repository Configuration

All packages defined here are available to install via a custom repository; to configure this on an
existing ArchLinux system, first download and add the repository key to `pacman`:

```sh
$ curl --silent --fail -o - https://git.deuill.org/api/packages/deuill/arch/repository.key | pacman-key --add -
```

Ensure that the key was added correctly, and sign the key:

```sh
$ pacman-key --list-keys 'Arch Registry'
$ pacman-key --lsign-key <key-id> # Insert key ID returned by previous command.
```

Then, add the repository to the bottom of `pacman.conf`:

```ini
[deuill.git.deuill.org]
SigLevel = Required
Server = https://git.deuill.org/api/packages/deuill/arch/core/$arch
```

Running `pacman -Sy` should pull repository files correctly.

## License

All code in this repository is covered by the terms of the MIT License, the full text of which can be found in the LICENSE file.
