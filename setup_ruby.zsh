#!/usr/bin/env zsh

echo "\n<<< Starting Ruby Setup >>>\n"

# Node versions are managed with `rbenv`, which is in the Brewfile.
# See `zshenv` for the setting of the `GLOBAL_RUBY_VERSION` variable,
# thus making it available below during the first install.

rbenv install -s $GLOBAL_RUBY_VERSION
rbenv global $GLOBAL_RUBY_VERSION

echo "\n<<< Ruby setup complete >>>\n"