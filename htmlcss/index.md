---
layout: page
title: HTML/CSS Style Guide
---

## Table of Contents

- [Basic](#basic)

  - [Basic Style Rules](#basic-style-rules)
  - [Basic Formatting Rules](#basic-formatting-rules)

- [HTML](#html)

  - [HTML Style Rules](#html-style-rules)
  - [HTML Formatting Rules](#html-formatting-rules)

- [CSS](#css)
  - [CSS Style Rules](#css-style-rules)
  - [CSS Formatting Rules](#css-formatting-rules)

## Basic

### Basic Style Rules

#### Protocol

Use HTTPS for embedded resources where possible.

Always use HTTPS for scripts unless each file is available via HTTPS.

```html
// Wrong
<script src="http://api.pelagornis.com/..."></script>

// RIGHT
<script src="https://api.pelagornis.com/..."></script>
```

### Basic Formatting Rules

#### Indentation

Indent by 2 spaces at a time.

Don’t use tabs or mix tabs and spaces for indentation.

```html
<ul>
  <li>Home</li>
  <li>Opensource</li>
</ul>
```

```css
.pelagornis_logo {
  color: white;
}
```

#### Capitalization

Use only lowercase.

```html
// Wrong
<a href="/">Home</a>

// Right
<a href="/">Home</a>
```

```css
// Wrong
color: #f5f5f7;

// Right
color: #f5f5f7;
```

#### Trailing Whitespace

Remove trailing white spaces.

```html
// Wrong
<p>Hello, World_ /// Right</p>

<p>Hello, World</p>
```

## HTML

### HTML Style Rules

#### Document Type

Use HTML5.

Always declare the document type as the first line in your document.

```html
<!DOCTYPE html>
```

#### Close All HTML Elements

In HTML, you do not have to close all elements.

we strongly recommend closing all HTML elements.

```html
// Wrong
<section>
  <p>Hello, Pelagornis.</p>
  <p>Pelagornis StyleGuide.</p>
</section>

// Right
<section>
  <p>Hello, Pelagornis.</p>
  <p>Pelagornis StyleGuide.</p>
</section>
```

#### Spaces and Equal Signs

Do not prefer spaces around HTML equals.

Without spaces, it's easier to read, and you can better group an entity.

```html
// Wrong
<a href="/signin">Sign In</a>

// Right
<a href="/signin">Sign In</a>
```

#### Semantics

Use the appropriate HTML.

The purposeful use of HTML can have a good impact on accessibility, reusability, and code efficiency.

```html
// Wrong
<div onclick="navigateToSemantics();">Semantics</div>

// Right
<a href="/semantics">Semantics</a>
```

#### Entity References

Do not use entity references.

In HTML, entity references are unnecessary except for characters with special meanings (e.g., `<` and `&`) and control characters or "invisible" characters (e.g., indistinguishable spaces).

```html
// Wrong The symbol for classification is &ldquo;&sect;&rdquo;. // Right The
symbol for classification is "§".
```

#### `type` Attributes

Omit `type` attributes for style sheets and scripts.

Do not use type attributes for style sheets (unless not using CSS) and scripts (unless not using JavaScript).

```html
// Wrong
<link rel="stylesheet" href="/styles.css" type="text/css" />

// Right
<link rel="stylesheet" href="/styles.css" />
```

### HTML Formatting Rules

#### General Formatting

Use a new line for every block, list, or table element, and indent every such child element.

```html
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
</ul>
```

#### HTML Quotation Marks

we recommend quoting attribute values.

```html
// Wrong
<a class="sign-in-button">Sign In</a>

// Right
<a class="sign-in-button">Sign In</a>
```

## CSS

### CSS Style Rules

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
  text-align: center;
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
  font-weight: bold;
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
h1,
h2,
h3 {
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
