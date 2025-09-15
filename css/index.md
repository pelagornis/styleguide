---
layout: page
title: CSS Style Guide
icon: /assets/images/icons/css.svg
---

## Table of Contents

- [CSS Style Rules](#css-style-rules)
- [CSS Formatting Rules](#css-formatting-rules)
- [Modern CSS Features](#modern-css-features)
- [Responsive Design](#responsive-design)
- [CSS Architecture](#css-architecture)
- [Performance](#performance)
- [Accessibility](#accessibility)
- [Animations and Transitions](#animations-and-transitions)

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
color: #f5f5f7;

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

### Modern CSS Features

#### CSS Custom Properties (Variables)

Use CSS custom properties for maintainable theming and dynamic values.

```css
:root {
  /* Color palette */
  --color-primary: #007bff;
  --color-secondary: #6c757d;
  --color-success: #28a745;
  --color-danger: #dc3545;
  --color-warning: #ffc107;
  --color-info: #17a2b8;

  /* Typography */
  --font-family-base: "Inter", -apple-system, BlinkMacSystemFont, sans-serif;
  --font-size-base: 1rem;
  --line-height-base: 1.5;

  /* Spacing */
  --spacing-xs: 0.25rem;
  --spacing-sm: 0.5rem;
  --spacing-md: 1rem;
  --spacing-lg: 1.5rem;
  --spacing-xl: 3rem;

  /* Layout */
  --container-max-width: 1200px;
  --border-radius: 0.375rem;
  --box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12);
}

/* Dark theme */
[data-theme="dark"] {
  --color-primary: #0d6efd;
  --color-secondary: #6c757d;
  --color-background: #212529;
  --color-text: #ffffff;
}

/* Usage */
.button {
  background-color: var(--color-primary);
  color: white;
  padding: var(--spacing-sm) var(--spacing-md);
  border-radius: var(--border-radius);
  font-family: var(--font-family-base);
}
```

#### CSS Grid Layout

Use CSS Grid for complex two-dimensional layouts.

```css
/* Grid container */
.grid-container {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  grid-template-rows: auto 1fr auto;
  grid-template-areas:
    "header header header header header header header header header header header header"
    "sidebar main main main main main main main main main main main"
    "footer footer footer footer footer footer footer footer footer footer footer footer";
  gap: var(--spacing-md);
  min-height: 100vh;
}

/* Grid items */
.header {
  grid-area: header;
  background: var(--color-primary);
  color: white;
  padding: var(--spacing-md);
}

.sidebar {
  grid-area: sidebar;
  background: #f8f9fa;
  padding: var(--spacing-md);
}

.main {
  grid-area: main;
  padding: var(--spacing-md);
}

.footer {
  grid-area: footer;
  background: #343a40;
  color: white;
  padding: var(--spacing-md);
}

/* Responsive grid */
@media (max-width: 768px) {
  .grid-container {
    grid-template-columns: 1fr;
    grid-template-areas:
      "header"
      "main"
      "sidebar"
      "footer";
  }
}

/* Card grid */
.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: var(--spacing-lg);
  padding: var(--spacing-md);
}
```

#### Flexbox Layout

Use Flexbox for one-dimensional layouts and component alignment.

```css
/* Flexbox container */
.flex-container {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: center;
  gap: var(--spacing-md);
}

/* Navigation with flexbox */
.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: var(--spacing-md);
}

.nav-links {
  display: flex;
  list-style: none;
  gap: var(--spacing-lg);
  margin: 0;
  padding: 0;
}

/* Card component */
.card {
  display: flex;
  flex-direction: column;
  background: white;
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
  overflow: hidden;
}

.card-header {
  padding: var(--spacing-md);
  border-bottom: 1px solid #e9ecef;
}

.card-body {
  flex: 1;
  padding: var(--spacing-md);
}

.card-footer {
  padding: var(--spacing-md);
  border-top: 1px solid #e9ecef;
  background: #f8f9fa;
}

/* Button group */
.button-group {
  display: flex;
  gap: var(--spacing-sm);
}

.button-group .button {
  flex: 1;
}
```

#### CSS Container Queries

Use container queries for component-based responsive design.

```css
/* Container query context */
.card-container {
  container-type: inline-size;
  container-name: card;
}

/* Container queries */
@container card (min-width: 300px) {
  .card {
    display: flex;
    flex-direction: row;
  }

  .card-image {
    width: 40%;
  }

  .card-content {
    width: 60%;
  }
}

@container card (max-width: 299px) {
  .card {
    display: flex;
    flex-direction: column;
  }

  .card-image {
    width: 100%;
  }

  .card-content {
    width: 100%;
  }
}
```

### Responsive Design

#### Mobile-First Approach

Start with mobile styles and progressively enhance for larger screens.

```css
/* Base styles (mobile) */
.container {
  width: 100%;
  padding: 0 var(--spacing-md);
  margin: 0 auto;
}

.hero {
  padding: var(--spacing-xl) 0;
  text-align: center;
}

.hero h1 {
  font-size: 2rem;
  margin-bottom: var(--spacing-md);
}

/* Tablet styles */
@media (min-width: 768px) {
  .container {
    max-width: 750px;
  }

  .hero h1 {
    font-size: 2.5rem;
  }

  .grid-2 {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: var(--spacing-lg);
  }
}

/* Desktop styles */
@media (min-width: 1024px) {
  .container {
    max-width: 1200px;
  }

  .hero h1 {
    font-size: 3rem;
  }

  .grid-3 {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: var(--spacing-lg);
  }
}

/* Large desktop styles */
@media (min-width: 1440px) {
  .container {
    max-width: 1400px;
  }
}
```

#### Responsive Typography

Create fluid typography that scales with screen size.

```css
/* Fluid typography */
:root {
  --font-size-min: 1rem;
  --font-size-max: 1.25rem;
  --viewport-min: 320px;
  --viewport-max: 1200px;
}

h1 {
  font-size: clamp(2rem, 5vw, 4rem);
  line-height: 1.2;
  margin-bottom: var(--spacing-lg);
}

h2 {
  font-size: clamp(1.5rem, 4vw, 2.5rem);
  line-height: 1.3;
  margin-bottom: var(--spacing-md);
}

p {
  font-size: clamp(var(--font-size-min), 2.5vw, var(--font-size-max));
  line-height: 1.6;
  margin-bottom: var(--spacing-md);
}

/* Responsive spacing */
.section {
  padding: clamp(var(--spacing-lg), 5vw, var(--spacing-xl)) 0;
}
```

#### Responsive Images

Implement responsive images with proper sizing and optimization.

```css
/* Responsive images */
.responsive-image {
  width: 100%;
  height: auto;
  display: block;
}

/* Aspect ratio containers */
.aspect-ratio-16-9 {
  aspect-ratio: 16 / 9;
  overflow: hidden;
}

.aspect-ratio-4-3 {
  aspect-ratio: 4 / 3;
  overflow: hidden;
}

.aspect-ratio-1-1 {
  aspect-ratio: 1 / 1;
  overflow: hidden;
}

/* Object fit for images */
.aspect-ratio-16-9 img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* Responsive video */
.responsive-video {
  position: relative;
  width: 100%;
  height: 0;
  padding-bottom: 56.25%; /* 16:9 aspect ratio */
}

.responsive-video iframe {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}
```

### CSS Architecture

#### BEM Methodology

Use BEM (Block, Element, Modifier) for maintainable CSS architecture.

```css
/* Block */
.card {
  background: white;
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
  overflow: hidden;
}

/* Element */
.card__header {
  padding: var(--spacing-md);
  border-bottom: 1px solid #e9ecef;
}

.card__title {
  margin: 0;
  font-size: 1.25rem;
  font-weight: 600;
}

.card__body {
  padding: var(--spacing-md);
}

.card__footer {
  padding: var(--spacing-md);
  background: #f8f9fa;
  border-top: 1px solid #e9ecef;
}

/* Modifier */
.card--featured {
  border: 2px solid var(--color-primary);
}

.card--large .card__header {
  padding: var(--spacing-lg);
}

.card--large .card__title {
  font-size: 1.5rem;
}

/* Button example */
.button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  padding: var(--spacing-sm) var(--spacing-md);
  border: none;
  border-radius: var(--border-radius);
  font-family: var(--font-family-base);
  font-size: var(--font-size-base);
  text-decoration: none;
  cursor: pointer;
  transition: all 0.2s ease;
}

.button--primary {
  background-color: var(--color-primary);
  color: white;
}

.button--secondary {
  background-color: var(--color-secondary);
  color: white;
}

.button--large {
  padding: var(--spacing-md) var(--spacing-lg);
  font-size: 1.125rem;
}

.button--small {
  padding: var(--spacing-xs) var(--spacing-sm);
  font-size: 0.875rem;
}
```

#### CSS Modules Structure

Organize CSS files using a modular approach.

```css
/* Base styles */
@import "base/reset.css";
@import "base/typography.css";
@import "base/variables.css";

/* Layout components */
@import "layout/header.css";
@import "layout/footer.css";
@import "layout/sidebar.css";
@import "layout/grid.css";

/* UI components */
@import "components/button.css";
@import "components/card.css";
@import "components/form.css";
@import "components/modal.css";

/* Utilities */
@import "utilities/spacing.css";
@import "utilities/display.css";
@import "utilities/text.css";

/* Pages */
@import "pages/home.css";
@import "pages/about.css";
@import "pages/contact.css";
```

#### Utility Classes

Create utility classes for common styling patterns.

```css
/* Spacing utilities */
.m-0 {
  margin: 0;
}
.m-1 {
  margin: var(--spacing-xs);
}
.m-2 {
  margin: var(--spacing-sm);
}
.m-3 {
  margin: var(--spacing-md);
}
.m-4 {
  margin: var(--spacing-lg);
}
.m-5 {
  margin: var(--spacing-xl);
}

.p-0 {
  padding: 0;
}
.p-1 {
  padding: var(--spacing-xs);
}
.p-2 {
  padding: var(--spacing-sm);
}
.p-3 {
  padding: var(--spacing-md);
}
.p-4 {
  padding: var(--spacing-lg);
}
.p-5 {
  padding: var(--spacing-xl);
}

/* Display utilities */
.d-none {
  display: none;
}
.d-block {
  display: block;
}
.d-inline {
  display: inline;
}
.d-inline-block {
  display: inline-block;
}
.d-flex {
  display: flex;
}
.d-grid {
  display: grid;
}

/* Text utilities */
.text-left {
  text-align: left;
}
.text-center {
  text-align: center;
}
.text-right {
  text-align: right;
}
.text-justify {
  text-align: justify;
}

.text-uppercase {
  text-transform: uppercase;
}
.text-lowercase {
  text-transform: lowercase;
}
.text-capitalize {
  text-transform: capitalize;
}

/* Color utilities */
.text-primary {
  color: var(--color-primary);
}
.text-secondary {
  color: var(--color-secondary);
}
.text-success {
  color: var(--color-success);
}
.text-danger {
  color: var(--color-danger);
}
.text-warning {
  color: var(--color-warning);
}
.text-info {
  color: var(--color-info);
}

.bg-primary {
  background-color: var(--color-primary);
}
.bg-secondary {
  background-color: var(--color-secondary);
}
.bg-success {
  background-color: var(--color-success);
}
.bg-danger {
  background-color: var(--color-danger);
}
.bg-warning {
  background-color: var(--color-warning);
}
.bg-info {
  background-color: var(--color-info);
}
```

### Performance

#### Critical CSS

Inline critical CSS for faster initial page load.

```css
/* Critical CSS - Above the fold */
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: var(--font-family-base);
  font-size: var(--font-size-base);
  line-height: var(--line-height-base);
  color: #333;
}

.header {
  background: var(--color-primary);
  color: white;
  padding: var(--spacing-md);
}

.hero {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: var(--spacing-xl) 0;
  text-align: center;
}

/* Non-critical CSS loaded asynchronously */
.nav-links {
  display: flex;
  list-style: none;
  gap: var(--spacing-lg);
}

.card {
  background: white;
  border-radius: var(--border-radius);
  box-shadow: var(--box-shadow);
}
```

#### CSS Optimization

Optimize CSS for better performance.

```css
/* Use efficient selectors */
/* Good - specific and fast */
.button-primary {
}

/* Avoid - overly specific */
div.container > ul.nav > li.item > a.link {
}

/* Use transform and opacity for animations */
.animate-fade-in {
  opacity: 0;
  transform: translateY(20px);
  transition: opacity 0.3s ease, transform 0.3s ease;
}

.animate-fade-in.visible {
  opacity: 1;
  transform: translateY(0);
}

/* Use will-change sparingly */
.animate-element {
  will-change: transform, opacity;
}

.animate-element.animation-complete {
  will-change: auto;
}

/* Optimize for GPU acceleration */
.gpu-accelerated {
  transform: translateZ(0);
  backface-visibility: hidden;
  perspective: 1000px;
}
```

### Accessibility

#### Focus Management

Implement proper focus styles for keyboard navigation.

```css
/* Focus styles */
*:focus {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
}

/* Skip links */
.skip-link {
  position: absolute;
  top: -40px;
  left: 6px;
  background: var(--color-primary);
  color: white;
  padding: 8px;
  text-decoration: none;
  border-radius: 4px;
  z-index: 1000;
}

.skip-link:focus {
  top: 6px;
}

/* Button focus */
.button:focus {
  outline: 2px solid var(--color-primary);
  outline-offset: 2px;
  box-shadow: 0 0 0 4px rgba(0, 123, 255, 0.25);
}

/* Form focus */
input:focus,
textarea:focus,
select:focus {
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}
```

#### Screen Reader Support

Provide proper support for screen readers.

```css
/* Screen reader only content */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

/* Skip to content link */
.skip-to-content {
  position: absolute;
  top: -40px;
  left: 6px;
  background: var(--color-primary);
  color: white;
  padding: 8px 16px;
  text-decoration: none;
  border-radius: 4px;
  z-index: 1000;
}

.skip-to-content:focus {
  top: 6px;
}

/* High contrast mode support */
@media (prefers-contrast: high) {
  .button {
    border: 2px solid currentColor;
  }

  .card {
    border: 1px solid #000;
  }
}

/* Reduced motion support */
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```

### Animations and Transitions

#### Smooth Transitions

Create smooth transitions for interactive elements.

```css
/* Transition variables */
:root {
  --transition-fast: 0.15s ease;
  --transition-normal: 0.3s ease;
  --transition-slow: 0.5s ease;
}

/* Button transitions */
.button {
  transition: all var(--transition-normal);
}

.button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.button:active {
  transform: translateY(0);
  transition: all var(--transition-fast);
}

/* Card hover effects */
.card {
  transition: transform var(--transition-normal), box-shadow var(--transition-normal);
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

/* Form focus transitions */
input,
textarea,
select {
  transition: border-color var(--transition-normal), box-shadow var(--transition-normal);
}

input:focus,
textarea:focus,
select:focus {
  border-color: var(--color-primary);
  box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
}
```

#### Keyframe Animations

Create engaging keyframe animations.

```css
/* Fade in animation */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.fade-in {
  animation: fadeIn 0.6s ease forwards;
}

/* Slide in from left */
@keyframes slideInLeft {
  from {
    opacity: 0;
    transform: translateX(-100%);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.slide-in-left {
  animation: slideInLeft 0.5s ease forwards;
}

/* Pulse animation */
@keyframes pulse {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
  100% {
    transform: scale(1);
  }
}

.pulse {
  animation: pulse 2s infinite;
}

/* Loading spinner */
@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.spinner {
  width: 20px;
  height: 20px;
  border: 2px solid #f3f3f3;
  border-top: 2px solid var(--color-primary);
  border-radius: 50%;
  animation: spin 1s linear infinite;
}
```
