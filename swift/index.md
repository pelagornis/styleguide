---
layout: page
title: Swift Style Guide
icon: /assets/images/icons/swift.svg
---

## Table of Contents

- [Naming](#naming)
- [Swift Style Rules](#swift-style-rules)
- [Swift Formatting Rules](#swift-formatting-rules)
- [Patterns](#patterns)

### Naming

### Swift Style Rules

### Swift Formatting Rules

#### Indentation
Indent by 2 spaces at a time.

When writing a colon (`:`), leave spaces only on the right side of the colon.
```swift
/// Wrong
let item:[Int:String]?

/// Right
let item: [Int: String]?
```

#### Maximum line length
Each line should have a maximum column width of 100 characters.
- Xcode's `Prefeneces` -> `Text Editing` -> `Display`  and set it to 100 characters.

#### Empty line
Make sure there are no spaces in the blank line, and all files must end in blank lines.
The MARK syntax requires spaces below.

```swift
/// Wrong
// MARK: Property
let name: String = ""

/// Right
// MARK: Property

let name: String = ""

```

#### Semicolons
Semicolons (;) are not used, either to terminate or separate statements.
```
/// Wrong
func run() {
  let company = "Pelagornis";
  print("Hello \(company)");
}

/// Right
func run() {
  let company = "Pelagornis";
  print("Hello \(company)")
}
```

#### Import
The module import is sorted alphabetically, import the built-in framework first, separated by blank lines, and import the third-party framework.

```swift
import UIKit

import Builder
import Snapkit
```

### Patterns
