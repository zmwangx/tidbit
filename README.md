# tidbit, no bullshit note taker

`tidbit` is a simple shell script for note taking. Selling points:

* Full power of your text editor — `tidbit` uses `$VISUAL`;
* Automatic git versioning — never lose anything;
* Write in Markdown (with full HTML access) — no more domain-specific crippled
  markup langauge;
* Generates a single HTML file with all your tidbits.

## Dependencies

`zsh` and [`cmark`](https://github.com/jgm/cmark). I chose `cmark` as the
Markdown processor because I like it; you're of course free to pick your own
Markdown processor, and let it masquerade as `cmark` through a wrapper named
such. Just make sure it can swallow Markdown on stdin and spit HTML on stdout.

## Installation

Clone the repo, then `make install`.

## Documentation

Taken from command line help:

```
Usage: tidbit [ACTION]

Available actions are listed below. If no action is given, assume `new'. When a
text editor is involved, it is determined in the following order:

    * $VISUAL if set and non-empty;
    * $EDITOR if set and non-empty;
    * emacs if available;
    * vi.

Actions
    new
        Create a new tidbit. If stdin is a tty, the text editor is launched for
        editing. Once you have finished editing, save and quit the editor; the
        tidbit is automatically discarded if the saved content is
        empty. Alternatively, if stdin is not a tty, then all input is consumed
        and treated as the content.

        The tidbits directory is automatically initialized as a git repo, and a
        new commit is made for the new tidbit.

    view
        View all tidbits in a single HTML file. The HTML file is opened in the
        default application if `open' or `xdg-open' is available, or its path
        is printed to stdout.

    compile
        (Re-)Compile all tidbits to generate a single HTML for viewing. Tidbits
        are automatically compiled as they are added, but in case the HTML file
        is out-of-date for some reason, use this action to recompile.

    edit
        Open the tidbits directory in the text editor. After editing `git
        commit --all' is called interactively from the tidbits directory to let
        you commit in changes, and please recompile with the `compile' action
        if necessary.

    push
        Run `git push --verbose --set-upstream origin master' from the tidbits
        directory. Requires the remote `origin' to be set manually beforehand.
```

## Directory structure

```
tidbit/
├── COPYING
├── Makefile
├── README.md
├── cache/
│   ├── cache.html
│   └── cache.html.bak
├── styles.css
├── styles.css.sample
├── tidbit*
├── tidbits/
│   ├── 1450408594.md
│   └── 1450408780.md
│   └── ...
└── tidbits.html
```

## Customizations

The stylesheet `styles.css` can be customized. The repository includes a basic
`styles.css.sample`, which is installed to `style.css` by `make install` if the
latter is not already present.

## License

```
Copyright © 2015 Zhiming Wang <zmwangx@gmail.com>
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the COPYING file for more details.
```
