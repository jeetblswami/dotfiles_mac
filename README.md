# dotfiles

## Restore Instructions

1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
2. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh),and add to GitHub.

    ```zsh
    # Generate SSH key in default location (~/.ssh/config)
    ssh-keygen -t rsa -b 4096 -C "66495007+eieioxyz@users.noreply.github.com"

    # Start the ssh-agent
    eval "$(ssh-agent -s)"

    # Create config file with necessary settings
    << EOF > ~/.ssh/config
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa
    EOF

    # Add private key to ssh-agent 
    ssh-add -K ~/.ssh/id_rsa

    # Copy public key and add to github.com > Settings > SSH and GPG keys
    pbcopy < ~/.ssh/id_rsa.pub

    # Test SSH connection, then verify fingerprint and username
    # https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
    ssh -T git@github.com
    ```

3. `git clone git@github.com:jeetblswami/dotfiles_mac.git ~/.dotfiles`.
4. `cd ~/.dotfiles`
5. Do one last Software Audit by editing [Brewfile](Brewfile) directly.
6. [`./install`](install)
7. Restart computer.
8. Setup up Dropbox (use multifactor authentication!) and allow files to sync before setting up dependent applications. Alfred settings are stored here. Mackup depends on this as well (and thus so do Terminal and VS Code).
9. Run `mackup restore`. Consider doing a `mackup restore --dry-run --verbose` first.


### Manual Steps

#### Snappy App

1. `System Preferences > Keyboard > Shortcuts > Screenshots > Save picture of selected area as a file (cmd+shift+4)` uncheck.
2. `Snappy Preferences > General > Take snap` change from `cmd+shift+2` (which conflicts with ScreenFlow) to `cmd+shift+4`.

#### Alfred

1. `System Preferences > Keyboard > Shortcuts > Spotlight > Show Spotlight search (cmd+space)` uncheck.
2. `Alfred Preferences > Powerpack` add License.
3. `Alfred Preferences > General > Request Permissions`.
4. `Alfred Preferences > General > Alfred Hotkey` change to `cmd+space`.
5. `Alfred Preferences > Advanced > Set preferences folder` and set to `~/Dropbox/dotfiles/Alfred`.

## TODO

1. Automate vscode extension Installation
2. Setup shell completion for brew

