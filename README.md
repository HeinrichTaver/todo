# Todo - keep track of all your project's todos

`todo` is a Ruby script inspired by [try](https://github.com/tobi/try).

Your code directory: full of projects.
Each project: infested with `TODO:` in several files.
What needs to be done?
What needs to be prioritized?
What day is it today?

`todo` generates an interactive report, in a simple TUI, of all your TODOs, grouping them by project, ranking by urgency, and highlighting deadlines.


## Tech Stack

- [Ruby](https://www.ruby-lang.org)


## Quick Start

### Clone & setup

```sh
git clone https://github.com/HeinrichTaver/todo.git
cd todo
```

This utility is based on Ruby 4 and uses [mise](https://mise.jdx.dev) for tools management.
In case you don't have Ruby installed in your system, run the following command:

```sh
mise install
```

### Using `todo`

```sh
TODO_PATH=<your-code-directory> ./todo.rb
```


## Licensing

[MIT License](https://spdx.org/licenses/MIT.html), see `LICENSE`
