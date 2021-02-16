# export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"
# export N_PREFIX="$HOME/.n"
# export PREFIX="$N_PREFIX"
export GLOBAL_NODE_VERSION="15.8.0"
export GLOBAL_PYTHON_VERSION="3.9.0"
export GLOBAL_RUBY_VERSION="2.4.4"

function exists() {
  # `command -v` is similar to `which`
  # https://stackoverflow.com/a/677212/1341838
  command -v $1 >/dev/null 2>&1

  # More explicitly written:
  # command -v $1 1>/dev/null 2>/dev/null
}
