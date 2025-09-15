---
layout: page
title: Shell Style Guide
icon: /assets/images/icons/shell-script.svg
---

## Table of Contents

- [Shell Style Rules](#shell-style-rules)
- [Shell Style Formatting](#shell-style-formatting)
- [Security Guidelines](#security-guidelines)
- [Error Handling](#error-handling)
- [Performance Optimization](#performance-optimization)
- [Testing](#testing)
- [Portability](#portability)
- [Modern Shell Features](#modern-shell-features)

### Shell Style Rules

#### Shell Start

Executables must start with `#!/bin/bash` and a minimum number of flags. Use `set -euo pipefail` for better error handling.

```bash
#!/bin/bash
set -euo pipefail
```

#### Shebang Best Practices

Use the most appropriate shebang for your script's requirements.

```bash
# For bash-specific features
#!/bin/bash

# For POSIX-compliant scripts
#!/bin/sh

# For scripts that need to find bash in PATH
#!/usr/bin/env bash
```

#### File Extensions

Executable files must not have an extension or a `.sh` extension; libraries must have a `.sh` extension and no executable files.

When you run a program, you do not need to know what language the program is written in, and you do not need an extension for the shell, so it is not recommended to use the extension for the executable file.

#### SUID/SGID

SUID and SGID are forbidden on shell scripts.

Use `sudo` to provide elevated access if you need it.

#### Error message classification

All error messages should go to `STDERR`. Use structured logging with timestamps and log levels.

```bash
# Enhanced error logging function
log() {
  local level="$1"
  shift
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')] [$level] $*" >&2
}

err() {
  log "ERROR" "$@"
}

warn() {
  log "WARN" "$@"
}

info() {
  log "INFO" "$@"
}

# Usage
if ! do_something; then
  err "Unable to do_something"
  exit 1
fi
```

#### Exit Codes

Use meaningful exit codes for different error conditions.

```bash
# Wrong
if ! command_exists git; then
  echo "Git not found" >&2
  exit 1
fi

# Right
if ! command_exists git; then
  err "Git not found. Please install Git."
  exit 2  # Specific exit code for missing dependency
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

### Security Guidelines

#### Input Validation

Always validate and sanitize user input to prevent injection attacks.

```bash
# Wrong
read -p "Enter filename: " filename
rm "$filename"

# Right
read -p "Enter filename: " filename
if [[ ! "$filename" =~ ^[a-zA-Z0-9._-]+$ ]]; then
  err "Invalid filename: contains illegal characters"
  exit 1
fi
if [[ ! -f "$filename" ]]; then
  err "File does not exist: $filename"
  exit 1
fi
rm "$filename"
```

#### Safe Variable Expansion

Use proper quoting to prevent word splitting and pathname expansion.

```bash
# Wrong
cp $source $destination

# Right
cp "$source" "$destination"
```

#### Temporary Files

Use secure methods for creating temporary files.

```bash
# Wrong
temp_file="/tmp/script_$$"

# Right
temp_file=$(mktemp) || {
  err "Failed to create temporary file"
  exit 1
}
trap 'rm -f "$temp_file"' EXIT
```

#### Command Substitution Security

Be careful with command substitution to avoid code injection.

```bash
# Wrong
eval "echo $user_input"

# Right
printf '%s\n' "$user_input"
```

### Error Handling

#### Trap Handlers

Use trap handlers for cleanup and error handling.

```bash
#!/bin/bash
set -euo pipefail

# Cleanup function
cleanup() {
  local exit_code=$?
  if [[ -n "${temp_dir:-}" && -d "$temp_dir" ]]; then
    rm -rf "$temp_dir"
  fi
  exit $exit_code
}

# Set up trap
trap cleanup EXIT INT TERM

# Create temporary directory
temp_dir=$(mktemp -d)
```

#### Error Recovery

Implement proper error recovery mechanisms.

```bash
# Retry mechanism
retry() {
  local max_attempts="$1"
  shift
  local attempt=1

  while [[ $attempt -le $max_attempts ]]; do
    if "$@"; then
      return 0
    fi
    warn "Attempt $attempt failed, retrying..."
    ((attempt++))
    sleep 1
  done

  err "All $max_attempts attempts failed"
  return 1
}

# Usage
retry 3 curl -f "https://api.example.com/data"
```

### Performance Optimization

#### Efficient Loops

Use efficient loop constructs and avoid unnecessary subshells.

```bash
# Wrong
for file in $(ls *.txt); do
  echo "$file"
done

# Right
for file in *.txt; do
  [[ -f "$file" ]] || continue
  echo "$file"
done
```

#### Process Substitution

Use process substitution instead of pipes when appropriate.

```bash
# Wrong
echo "data" | while read line; do
  process "$line"
done

# Right
while read -r line; do
  process "$line"
done < <(echo "data")
```

#### Parallel Processing

Use parallel processing for CPU-intensive tasks.

```bash
# Process files in parallel
process_file() {
  local file="$1"
  # Process the file
  echo "Processed: $file"
}

export -f process_file
find . -name "*.txt" -print0 | xargs -0 -P 4 -I {} bash -c 'process_file "$@"' _ {}
```

### Testing

#### Unit Testing

Write testable shell scripts with proper function structure.

```bash
#!/bin/bash
# test_script.sh

# Function to test
is_valid_email() {
  local email="$1"
  [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]
}

# Test function
run_tests() {
  local passed=0
  local failed=0

  test_case() {
    local description="$1"
    local expected="$2"
    local actual="$3"

    if [[ "$expected" == "$actual" ]]; then
      echo "✓ $description"
      ((passed++))
    else
      echo "✗ $description (expected: $expected, got: $actual)"
      ((failed++))
    fi
  }

  # Run tests
  test_case "Valid email" "true" "$(is_valid_email "test@example.com" && echo true || echo false)"
  test_case "Invalid email" "false" "$(is_valid_email "invalid-email" && echo true || echo false)"

  echo "Tests: $passed passed, $failed failed"
  return $failed
}

# Run tests if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  run_tests
fi
```

#### Mock Functions

Use mock functions for testing external dependencies.

```bash
# Mock external command for testing
mock_curl() {
  echo '{"status": "success", "data": "test"}'
}

# Test with mock
test_api_call() {
  local result
  result=$(mock_curl)
  if [[ "$result" == *"success"* ]]; then
    echo "API call test passed"
  else
    echo "API call test failed"
  fi
}
```

### Portability

#### POSIX Compliance

Write portable scripts that work across different shells and systems.

```bash
# Wrong (bash-specific)
array=(item1 item2 item3)
echo "${array[@]}"

# Right (POSIX-compliant)
items="item1 item2 item3"
for item in $items; do
  echo "$item"
done
```

#### Path Handling

Use portable path handling techniques.

```bash
# Wrong
script_dir="$(dirname "$0")"
include_file="$script_dir/../lib/utils.sh"

# Right
script_dir="$(dirname "$0")"
include_file="$(cd "$script_dir/.." && pwd)/lib/utils.sh"
```

#### Command Availability

Check for command availability before using.

```bash
# Check if command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Use with fallback
if command_exists jq; then
  json_parser="jq"
elif command_exists python3; then
  json_parser="python3 -m json.tool"
else
  err "No JSON parser available (jq or python3 required)"
  exit 1
fi
```

### Modern Shell Features

#### Associative Arrays

Use associative arrays for key-value data structures.

```bash
# Declare associative array
declare -A config

# Set values
config["database_host"]="localhost"
config["database_port"]="5432"
config["database_name"]="myapp"

# Access values
echo "Database: ${config[database_host]}:${config[database_port]}/${config[database_name]}"
```

#### Process Substitution with Arrays

Use process substitution with arrays for complex data processing.

```bash
# Read file into array
mapfile -t lines < <(grep -v "^#" config.txt)

# Process each line
for line in "${lines[@]}"; do
  echo "Processing: $line"
done
```

#### Here Documents

Use here documents for multi-line strings and templates.

```bash
# Generate configuration file
generate_config() {
  local db_host="$1"
  local db_port="$2"

  cat > config.ini << EOF
[database]
host = $db_host
port = $db_port
timeout = 30

[logging]
level = info
file = /var/log/app.log
EOF
}
```

#### Advanced Parameter Expansion

Use advanced parameter expansion for string manipulation.

```bash
# String manipulation examples
filename="/path/to/file.txt"

# Get basename
basename="${filename##*/}"

# Get directory
dirname="${filename%/*}"

# Get extension
extension="${filename##*.}"

# Remove extension
name_without_ext="${filename%.*}"

# Default values
output_dir="${OUTPUT_DIR:-/tmp}"
debug_mode="${DEBUG:-false}"
```
