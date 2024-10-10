---
layout: page
title: HTML Style Guide
icon: /assets/images/icons/html.svg
---

## Table of Contents

- [HTML](#html)

  - [HTML Style Rules](#html-style-rules)
  - [HTML Formatting Rules](#html-formatting-rules)

## HTML

### HTML Style Rules

#### Document Type

Use HTML5.

Always declare the document type as the first line in your document.

```html
<!DOCTYPE html>
```

#### Protocol

Use HTTPS for embedded resources where possible.

Always use HTTPS for scripts unless each file is available via HTTPS.

```html
// Wrong
<script src="http://api.pelagornis.com/..."></script>

// RIGHT
<script src="https://api.pelagornis.com/..."></script>
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

#### Indentation

Indent by 2 spaces at a time.

Don’t use tabs or mix tabs and spaces for indentation.

```html
<ul>
  <li>Home</li>
  <li>Opensource</li>
</ul>
```


#### Capitalization

Use only lowercase.

```html
// Wrong
<a href="/">Home</a>

// Right
<a href="/">Home</a>
```


#### Trailing Whitespace

Remove trailing white spaces.

```html
// Wrong
<p>Hello, World_</p>

// Right
<p>Hello, World</p>
```

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

