# costajohnt/homebrew-tap

Homebrew 7 loads formulae and casks from a third-party tap only once you trust it. Run this once first (skip it on an older Homebrew without `brew trust`):

```sh
brew trust costajohnt/tap
```

```sh
brew install --cask costajohnt/tap/murmur
```

| Cask | What |
|------|------|
| `murmur` | [Murmur](https://github.com/costajohnt/murmur), local offline voice dictation for macOS (Apple Silicon) |

Casks here are bumped automatically by each project's release workflow.

```sh
brew install costajohnt/tap/groovyfmt
```

| Formula | What |
|------|------|
| `groovyfmt` | [groovyfmt](https://github.com/costajohnt/groovyfmt), a fast formatter and linter for Groovy, Gradle build scripts and Jenkinsfiles |
