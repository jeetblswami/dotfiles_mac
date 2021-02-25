#!/usr/bin/env zsh

echo "\n<<< Starting Python Setup >>>\n"

# Node versions are managed with `pyenv`, which is in the Brewfile.
# See `zshenv` for the setting of the `GLOBAL_PYTHON_VERSION` variable,
# thus making it available below during the first install.

pyenv install -s $GLOBAL_PYTHON_VERSION
pyenv global $GLOBAL_PYTHON_VERSION

echo "\n<<< Python setup complete >>>\n"