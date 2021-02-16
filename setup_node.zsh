#!/usr/bin/env zsh

echo "\n<<< Starting Node Setup >>>\n"

# Node versions are managed with `nodenv`, which is in the Brewfile.
# See `zshenv` for the setting of the `GLOBAL_NODE_VERSION` variable,
# thus making it available below during the first install.

nodenv install -s $GLOBAL_NODE_VERSION
nodenv global $GLOBAL_NODE_VERSION

# Install Global NPM Packages
npm install --global http-server
npm install --global trash-cli

echo "Global NPM Packages Installed:"
npm list --global --depth=0

echo "\n<<< Node setup complete >>>\n"