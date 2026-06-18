# jayret-parley-vscode

> **Notice.** This is an independent derivative of
> [pyret-parley-vscode](https://github.com/jpolitz/pyret-parley-vscode), originally by
> Joe Politz (with grammar/language-configuration by Seth Poulsen), used under the Apache License 2.0.
> It is **not affiliated with, endorsed by, or sponsored by**
> the Pyret project, Brown PLT, or the original authors.
> See [`NOTICE`](./NOTICE) for full attribution.

An interactive Visual Studio Code editor for [Jayret](https://github.com/jayret-lang/jayret-lang),
modeled on [jpolitz/pyret-parley-vscode](https://github.com/jpolitz/pyret-parley-vscode)
and powered by a Jayret-flavored
[code.pyret.org](https://github.com/jayret-lang/code.jayret.org) build
embedded into a VSCode webview.

Opens `.jrt` files in a custom editor that runs the full Jayret
compiler + runtime inside a webview pane, with an interactive REPL on
the side.

## Architecture

`jayret-parley-vscode` is a fork of
[jpolitz/pyret-parley-vscode](https://github.com/jpolitz/pyret-parley-vscode).
The substantive differences:

- Source extension is `.jrt` (Jayret), not `.arr` (Pyret).
- The embedded compiler bundle comes from
  [`jayret-lang/code.jayret.org`](https://github.com/jayret-lang/code.jayret.org)
  — a fork of `code.pyret.org` whose `pyret-lang` dependency is pinned
  to our [`jayret-lang/jayret-lang`](https://github.com/jayret-lang/jayret-lang)
  fork. That bundle includes the Jayret translator, so loading a `.jrt`
  source in the webview routes through `parse-java` rather than
  `parse-pyret`.
- VSCode command IDs and configuration keys are namespaced
  `jayret-parley.*`.

## Building

You need a built copy of `code.jayret.org` on disk. The expected
sibling layout:

```
~/Dev/pyret/
    code.jayret.org/        # cloned + `make web-local`
    jayret-parley-vscode/   # this repo, with build/ symlinked to ../code.jayret.org/build
```

Set up the symlink and compile:

```
ln -s ../code.jayret.org/build build
npm install
npm run compile
```

Webpack copies `build/web` into `dist/web/build/web` and bundles the
TypeScript extension code. Output appears in `dist/web/extension.js`.

To package a `.vsix`:

```
npx @vscode/vsce package
```

To test in a browser-based VSCode:

```
npx vscode-test-web --browserType=chromium --extensionDevelopmentPath . ./sampleFiles/
```

## Settings

- `jayret-parley.defaultContext` — starter context (e.g. `starter2024`).
- `jayret-parley.urlFileMode` — how to resolve `url-file()` imports.

## Issues

Jayret-language issues belong in
[jayret-lang/jayret-lang](https://github.com/jayret-lang/jayret-lang/issues).
Extension-specific issues go to
[jayret-lang/jayret-parley-vscode](https://github.com/jayret-lang/jayret-parley-vscode/issues).

## License

Apache-2.0. Upstream attribution: pyret-parley-vscode is by Joe Politz,
with grammar/language-configuration originally by Seth Poulsen.
