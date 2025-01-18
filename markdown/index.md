---
layout: page
title: Markdown Style Guide
icon: /assets/images/icons/markdown.svg
---

## Table of Contents

- [Markdown Style Rules](#markdown-style-rules)
- [Markdown Formatting Rules](#markdown-formatting-rules)

### Markdown Style Rules

#### Heading
Header text must use the `atx-style` with no closing `#` character.
```
# Heading 1

## Heading 2
```

Headings with `=` or `-` underlines can be annoying to maintain and don’t fit with the rest of the heading syntax.

```swift
# Wrong
Heading
---------

# Right
# Heading
## Heading
```

To distinguish between paragraphs and headers, it is recommended to wrap up and down with at least one blank line.
```
# Wrong
Paragraph

# Heading

Paragraph

# Right
Paragraph
# Heading
Paragraph
```

#### Horizontal Rules
The rule for horizontal rules in this style guide is to use hyphens (instead of asterisks or underscores).

```
--------------------------------------------------------------------------
```

#### Paragraph
Recommended not to use spaces or tabs before paragraphs because they can cause unexpected formatting problems.
```swift
# Wrong
This is the Pelagornis Company.

   We offer steady products.

# Right
This is the Pelagornis Company.

We offer steady products.
```

Using a line break (`<br>`) that does not change paragraphs will represent two spaces.

#### Emphasis
When using `Bold`, some markdown applications do not support the use of `_`(underscores) in the middle of words.
For compatibility, we recommend wrapping it in two `*` (asterisks).
```
# Wrong
Hello __World__

# Right
Hello **World**
```

When using `Italic`, For compatibility, we recommend wrapping it in one `*` (asterisks).
```
# Wrong
Hello _World_

# Right
Hello *World*
```

Link emphasis is recommended to wrap around the entire link grammar.
```
Pelagornis Design: **[pelagornis design](https://design.pelagornis.com)**
```

#### List
Unordered list Items should use `-` instead of `*`.
```
- list item 1
- list item 2
    - sub-list item
```

All lists must be followed by newlines.
```
- list item 1
- list item 2
    1. sub-list item 1
    2. sub-list item 2

    - sub list item 3
    - sub list item 4
```

#### Code
Inline code must use single backticks and must not have spaces between the backtick characters and the code.
```
# Wrong
` code `

# Right
`code`
```

#### BlockQuote
Separate using one space between `>` and content
```
# Wrong
>Content
>  Content

# Right
> Content
```

#### Table
For readability, pipe characters must have spaces before and after, and the column width of the table must be determined by the longest cell in the column.
Always formalize the table so that it can be read from preprocessing.

```
# Wrong
table header | other table header
--- | ---
table data | other table data

# Right
table header | other table header
------------ | ------------------
table data   | other table data
```

Do not use pipes before and after when creating tables.
```
| table header | other table header |
| ------------ | ------------------ |
| table data   | table data         |
```

### Markdown Formatting Rules

#### Maximum line length
Each line should have a maximum column width of 80 characters.

#### List Format
`List items` must be indented 4 spaces further than their parent.

The first level of list items must not be preceded by a newline.

#### Table Format
Tables must always be preceded and followed by newlines.
