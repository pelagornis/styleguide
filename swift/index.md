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

#### Apple’s API Style Guidelines
Apple’s [official Swift naming and API design guidelines](https://www.swift.org/documentation/api-design-guidelines/) hosted on swift.org are considered part of this style guide and are followed as if they were repeated here in their entirety.

#### Identifiers
Typically, identifiers contain only 7-bit ASCII characters. Unicode identifiers have clear, legitimate meanings in the problem area of the code base (e.g., Greek characters representing mathematical concepts) and are acceptable if the team that owns the code understands them well.

```swift
/// Wrong
let 😎 = "😎"

/// Right
let nice = "😎"
```
#### Initializers


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
```swift
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

#### Comment
Use `///` to leave comments used for documentation.
```swift
/// Banner image exposed at the top of the main screen
final class BannerView: UIView {

  /// Image to float banner image View
    var bannerImageView: ImageView!
}
```

Use `// MARK:` to separate codes by type.
```swift
// MARK: Properties

let nameLabel: UILabel!
let dismissButton: UIButton!

// MARK: Initalizer

override init(frame: CGRect) {
  // ...
}

// MARK: Actions

override func dismissButtonDidTap() {
  // ...
}
```

### Patterns
Prefer to initialize properties at init time, if possible, without using the force unwrapping option.

```swift
/// Wrong
final class Company: NSObject {

    var name: String!

    init() {
        super.init()
        name = "Pelagornis"
    }
}

/// Right
final class Company: NSObject {

    var name: String

    init() {
        name = ""
        super.init()
    }
}
```



