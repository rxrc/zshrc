# Zsh Configuration

[![GitHub releases](https://img.shields.io/github/release/rxrc/zshrc.svg)](https://github.com/rxrc/zshrc/releases)
[![GitHub license](https://img.shields.io/github/license/rxrc/zshrc.svg)](./LICENSE.txt)

> Built from [makenew.github.io](https://makenew.github.io/).

[Zsh] configuration as a [zplug] plugin.

[Zsh]: https://www.zsh.org/
[zplug]: https://github.com/zplug/zplug

## Description

This configuration system works as a meta-plugin:
all desired Zsh plugins are loaded from `packages.zsh` using [zplug].
Overall configuration then follows a normal plugin structure.

Display documentation of this Zsh configuration with

```
$ man zshrc
```

## Installation

Due to the bootstrapping problem,
`ZDOTDIR` must be set on zsh initialization by adding the line

```
export ZDOTDIR=$HOME/.config/zsh
```

to either `/etc/zsh/zshenv` or `~/.zshenv`.

### Automatic Install

You can install this via the command-line with either curl

```
$ curl -L https://git.io/vH987 | sh
```

or wget

```
$ wget https://git.io/vH987 -O - | sh
```

### Manual Install

1. Install [zplug].

2. Create `$ZDOTDIR/.zshrc` with

   ```zsh
   # rxrc/zshrc

   export ZDOTDIR="${ZDOTDIR:-${XDG_CONFIG_HOME:-$HOME/.config}/zsh}"
   export ZPLUG_HOME="${ZPLUG_HOME:-${XDG_CONFIG_HOME:-$HOME/.config}/zplug}"
   export ZPLUG_CACHE_DIR="${ZPLUG_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/zplug}"

   zplug_loadfile="${ZPLUG_HOME}/repos/rxrc/zshrc/packages.zsh"

   if [[ -e $zplug_loadfile ]]; then
     export ZPLUG_LOADFILE=$zplug_loadfile
   fi

   source "${ZPLUG_HOME}/init.zsh"

   if [[ ! -e $zplug_loadfile ]]; then
     zplug 'rxrc/zshrc'
     zplug install
     export ZPLUG_LOADFILE=$zplug_loadfile
     source "${ZPLUG_HOME}/init.zsh"
   fi

   zplug 'rxrc/zshrc', use:env.zsh
   zplug 'rxrc/zshrc', use:plugin

   if ! zplug check; then
     zplug install
     echo '[zplug] Updating cache file: this may take up to a minute'
   fi

   zplug load
   ```

3. Open a new terminal session and wait for the initial install to complete.

### Updating

Updating is handled via the normal [zplug commands].

The provided shell function `zshupg` performs a one-step update.

[zplug commands]: https://github.com/zplug/zplug#2-commands-for-zplug

## Development and Testing

### Source Code

The [zshrc source] is hosted on GitHub.
Clone the project with

```
$ git clone https://github.com/rxrc/zshrc.git
```

[zshrc source]: https://github.com/rxrc/zshrc

### Local Development Mode

You can switch to development mode
which will configure zplug to use the local
directory as the plugin path.

First, follow the normal install steps if you haven't already.
Then, switch to development mode with

```
$ ./install.sh dev
```

Optionally specify an existing branch to develop with

```
$ ./install.sh dev dev-branch
```

Switch out of development mode with

```
$ ./install.sh
```

### Man Page

The man page is generated from `doc/src/man1` using [AsciiDoc] with

```
$ a2x -f manpage -D doc/man/man1 doc/src/man1/*
```

[AsciiDoc]: http://asciidoc.org/

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/rxrc/zshrc/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

## License

This Zsh configuration is licensed under the MIT license.

## Warranty

This software is provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are
disclaimed. In no event shall the copyright holder or contributors be liable for
any direct, indirect, incidental, special, exemplary, or consequential damages
(including, but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of this
software, even if advised of the possibility of such damage.
