---
layout: page
title: CSS Style Guide
icon: /assets/images/icons/css.svg
---

## Table of Contents

- [CSS Style Rules](#css-style-rules)
- [CSS Formatting Rules](#css-formatting-rules)


### CSS Style Rules

#### Protocol

Use HTTPS for embedded resources where possible.

Always use HTTPS for scripts unless each file is available via HTTPS.

```css
// Wrong
body {
    background-image: url("http://api.pelagornis.com/...");
}

// Right
body {
    background-image: url("https://api.pelagornis.com/...");
}
```

#### Class Naming

Use meaningful or generic class names.

Instead of presentational or cryptic names, always use class names that reflect the purpose of the element in question, or that are otherwise generic.

```css
// Wrong - meaningless
.css-102837 {
}

// Right - specific
.video {
}
```

#### Class Name Style

Use a class name that has as short as possible but necessary information.

```css
// Wrong
.navigation {
}

// Right
.nav {
}
```

#### Class Name Delimiters

Separate words in class names by a hyphen.

```css
// Wrong
.example_video {
}

// Right
.example-video {
}
```

#### Type Selectors

Avoid qualifying class names with type selectors.

```css
// Wrong
section.example {
}

// Right
.example {
}
```

#### ID Selectors

Avoid ID selectors.

Unique ID properties are difficult to ensure if they contain many components that multiple engineers have worked on.

```css
// Wrong
#nav {
}

// Right
.nav {
}
```

#### Shorthand Properties

Use shorthand properties where possible.

```css
// Wrong
padding-top: 1em;
padding-left: 2em;
padding-right: 2em;
padding-bottom: 1em;

// Right
padding: 1em 2em;
```

#### 0 and Units

Omit unit specification after “0” values, unless required.

```css
// Wrong
padding: 0px;

// Right
padding: 0;
```

#### Hexadecimal Notation

Use 3 character hexadecimal notation where possible.

```css
// Wrong
color: #aabbcc;

// Right
color: #abc;
```

#### Important Declarations

Avoid using `!important` declarations

```css
// Wrong
h1 {
  font-weight: bold !important;
}

// Right
h1 {
  font-weight: bold;
}
```

### CSS Formatting Rules

#### Indentation

Indent by 2 spaces at a time.

Don’t use tabs or mix tabs and spaces for indentation.

```css
.pelagornis_logo {
  color: white;
}
```

#### Capitalization

Use only lowercase.

```css
// Wrong
color: #F5F5F7;

// Right
color: #f5f5f7;
```

#### Trailing Whitespace

Remove trailing white spaces.

```css
// Wrong
.pelagornis {
  color: black_;
}

// Right
.pelagornis {
  color: black;
}
```

#### Declaration Order

Alphabetize declarations

To achieve consistent code, we recommend placing declarations in alphabetical order.

```css
background: white;
color: red;
text-align: center;
```

#### Declaration Stops

Use a semicolon after every declaration.

```css
// Wrong
.example {
  color: black;
  text-align: center
}

// Right
.example {
  color: black;
  text-align: center;
}
```

#### Property Name Stops

Use a space after a property name’s colon.

```css
// Wrong
h1 {
  font-weight:bold;
}

// Right
h1 {
  font-weight: bold;
}
```

#### Selector and Declaration Separation

Separate selectors and declarations by new lines.

```css
// Wrong
h1, h2, h3 {
  font-weight: bold;
  color: black;
}

// Right
h1,
h2,
h3 {
  font-weight: bold;
  color: black;
}
```

#### Rule Separation

Separate rules by new lines.

```css
html {
  background: #fff;
}

body {
  margin: auto;
  padding: 0;
}
```

#### CSS Quotation Marks

Use single (`''`) rather than double (`""`) quotation marks for attribute selectors and property values.

Do not use quotation marks in URI values (`url()`).

```css
// Wrong
@import url("https://pelagornis.com/...");

html {
  font-family: "open sans", arial, sans-serif;
}

// Right
@import url(https://pelagornis.com/...);

html {
  font-family: "open sans", arial, sans-serif;
}
```
