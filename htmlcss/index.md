---
layout: page
title: Html/Css Style Guide
---

## Table of Contents

- Basic
  - Basic Style Rules
  - Basic Formatting Rules

- HTML
  - HTML Style Rules
  - HTML Formatting Rules

- CSS
  - CSS Style Rules
  - CSS Formatting Rules

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

#### Basic Formatting Rules

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
<A HREF="/">Home</A>

// Right
<a href="/">Home</a>
```

```css
// Wrong
color: #F5F5F7;

// Right
color: #f5f5f7;
```

#### Trailing Whitespace

Remove trailing white spaces.

```html
// Wrong
<p>Hello, World_

/// Right
<p>Hello, World
```

