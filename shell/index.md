---
layout: page
title: Shell Style Guide
icon: /assets/images/icons/shell-script.svg
---

## Table of Contents

- [Shell](#shell)
  - [Shell Style Rules](#shell-style-rules)
  - [Shell Style Formatting](#shell-style-formatting)

## Shell

### Shell Style Rules

#### Shell Start

Executables must start with `#!/bin/bash` and a minimum number of flags

```bash
#!/bin/bash
```

#### File Extensions

Executable files must not have an extension or a `.sh` extension; libraries must have a `.sh` extension and no executable files.

When you run a program, you do not need to know what language the program is written in, and you do not need an extension for the shell, so it is not recommended to use the extension for the executable file.

#### SUID/SGID

SUID and SGID are forbidden on shell scripts.

Use `sudo` to provide elevated access if you need it.

#### Error message classification

All error messages should go to `STDERR`.

```bash
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

if ! do_something; then
  err "Unable to do_something"
  exit 1
fi
```

#### File Header Comment

Start each file with a description of its contents.

```bash
#!/bin/bash
#
# Starting for Pelagornis Test Script.
```

#### Function Comments

Any features that are neither clear nor short should be annotated.

All function annotations should describe the intended API behavior using the following.


```bash
#######################################
# Create File for pelagornis Project.
# Globals:
#   SOMEDIR
# Arguments:
#   File Name
# Outputs:
#   Indicates whether the file creation was successful.
#######################################
function create_file() {
  …
}
```

### Shell Style Formatting 

#### Indentation

Indent 2 spaces. No tabs.

```bash
while read -r f; do
  echo "file=${f}"
done < <(find /tmp)
```

#### Line Length and Long Strings

Maximum line length is 80 characters.


#### Meaningful Variable Names

Use uppercase letters for variable names and prefer underscores `_` for readability.

```bash
OUTPUT_DIR="/path/to/output"
FILE_NAME="example.txt"
```

#### Pipelines

If the pipeline doesn't fit all one line, you'll need to split one line per line.

If the pipelines all fit in one line, they should be in one line.

```bash
# All fits on one line
command1 | command2

# Long commands
command1 \
  | command2 \
  | command3 \
  | command4
```

#### Loop

Put `; do` and `; then` on the same line as the while, for or if.

```bash
for dir in "${create_file[@]}"; do
  if [[ -d "${dir}/${FileName}" ]]; then
    ...
  fi
done
```

#### Case statement

Indent alternatives by 2 spaces. 

A one-line alternative needs a space after the close parenthesis of the pattern and before the ;;.

Long or multi-command alternatives should be split over multiple lines with the pattern, actions, and ;; on separate lines.


```bash
case "${expression}" in
  a)
    variable="…"
    some_command "${variable}" "${other_expr}" …
    ;;
  absolute)
    actions="relative"
    another_command "${actions}" "${other_expr}" …
    ;;
  *)
    error "Unexpected expression '${expression}'"
    ;;
esac
```
