---
layout: page
title: HTML Style Guide
icon: /assets/images/icons/html.svg
---

## Table of Contents

- [HTML Style Rules](#html-style-rules)
- [HTML Formatting Rules](#html-formatting-rules)
- [Modern HTML Features](#modern-html-features)
- [Accessibility Guidelines](#accessibility-guidelines)
- [SEO Optimization](#seo-optimization)
- [Performance](#performance)
- [Semantic HTML](#semantic-html)

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

### Modern HTML Features

#### HTML5 Semantic Elements

Use semantic HTML5 elements for better structure and accessibility.

```html
<!-- Document structure -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Page Title</title>
  </head>
  <body>
    <header>
      <nav>
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/about">About</a></li>
        </ul>
      </nav>
    </header>

    <main>
      <article>
        <header>
          <h1>Article Title</h1>
          <time datetime="2024-01-15">January 15, 2024</time>
        </header>
        <section>
          <h2>Section Title</h2>
          <p>Article content...</p>
        </section>
      </article>

      <aside>
        <h3>Related Links</h3>
        <ul>
          <li><a href="/related1">Related Article 1</a></li>
          <li><a href="/related2">Related Article 2</a></li>
        </ul>
      </aside>
    </main>

    <footer>
      <p>&copy; 2024 Company Name. All rights reserved.</p>
    </footer>
  </body>
</html>
```

#### Form Elements and Validation

Use modern form elements with proper validation.

```html
<form novalidate>
  <fieldset>
    <legend>User Information</legend>

    <div class="form-group">
      <label for="email">Email Address</label>
      <input
        type="email"
        id="email"
        name="email"
        required
        autocomplete="email"
        aria-describedby="email-error"
      />
      <div id="email-error" class="error-message" role="alert"></div>
    </div>

    <div class="form-group">
      <label for="password">Password</label>
      <input
        type="password"
        id="password"
        name="password"
        required
        minlength="8"
        autocomplete="new-password"
        aria-describedby="password-help"
      />
      <div id="password-help" class="help-text">
        Password must be at least 8 characters long.
      </div>
    </div>

    <div class="form-group">
      <label for="age">Age</label>
      <input
        type="number"
        id="age"
        name="age"
        min="13"
        max="120"
        aria-describedby="age-help"
      />
      <div id="age-help" class="help-text">
        You must be at least 13 years old.
      </div>
    </div>

    <div class="form-group">
      <label for="country">Country</label>
      <select id="country" name="country" required>
        <option value="">Select a country</option>
        <option value="us">United States</option>
        <option value="ca">Canada</option>
        <option value="uk">United Kingdom</option>
      </select>
    </div>

    <div class="form-group">
      <fieldset>
        <legend>Newsletter Subscription</legend>
        <input type="radio" id="newsletter-yes" name="newsletter" value="yes" />
        <label for="newsletter-yes">Yes, subscribe me</label>

        <input type="radio" id="newsletter-no" name="newsletter" value="no" />
        <label for="newsletter-no">No, thanks</label>
      </fieldset>
    </div>

    <div class="form-group">
      <input type="checkbox" id="terms" name="terms" required />
      <label for="terms">
        I agree to the <a href="/terms" target="_blank">Terms of Service</a>
      </label>
    </div>

    <button type="submit">Create Account</button>
  </fieldset>
</form>
```

#### Media Elements

Use modern media elements with proper attributes.

```html
<!-- Responsive images -->
<picture>
  <source media="(min-width: 800px)" srcset="large-image.jpg" />
  <source media="(min-width: 400px)" srcset="medium-image.jpg" />
  <img src="small-image.jpg" alt="Descriptive alt text" loading="lazy" />
</picture>

<!-- Video with multiple sources -->
<video controls preload="metadata" poster="video-poster.jpg">
  <source src="video.mp4" type="video/mp4" />
  <source src="video.webm" type="video/webm" />
  <track kind="captions" src="captions.vtt" srclang="en" label="English" />
  <p>Your browser doesn't support HTML5 video.</p>
</video>

<!-- Audio with multiple sources -->
<audio controls preload="metadata">
  <source src="audio.mp3" type="audio/mpeg" />
  <source src="audio.ogg" type="audio/ogg" />
  <p>Your browser doesn't support HTML5 audio.</p>
</audio>
```

### Accessibility Guidelines

#### ARIA Labels and Roles

Use ARIA attributes to improve accessibility.

```html
<!-- Navigation with ARIA -->
<nav role="navigation" aria-label="Main navigation">
  <ul>
    <li><a href="/" aria-current="page">Home</a></li>
    <li><a href="/about">About</a></li>
    <li><a href="/contact">Contact</a></li>
  </ul>
</nav>

<!-- Button with ARIA -->
<button
  type="button"
  aria-expanded="false"
  aria-controls="menu"
  aria-label="Toggle navigation menu"
>
  <span class="hamburger-icon" aria-hidden="true">☰</span>
  Menu
</button>

<!-- Modal dialog -->
<div
  role="dialog"
  aria-modal="true"
  aria-labelledby="modal-title"
  aria-describedby="modal-description"
>
  <h2 id="modal-title">Confirm Action</h2>
  <p id="modal-description">Are you sure you want to delete this item?</p>
  <button type="button" aria-label="Close dialog">×</button>
</div>

<!-- Form with ARIA -->
<div class="form-group">
  <label for="username">Username</label>
  <input
    type="text"
    id="username"
    name="username"
    required
    aria-describedby="username-error username-help"
    aria-invalid="false"
  />
  <div id="username-help" class="help-text">
    Username must be 3-20 characters long.
  </div>
  <div id="username-error" class="error-message" role="alert"></div>
</div>
```

#### Focus Management

Implement proper focus management for keyboard navigation.

```html
<!-- Skip links -->
<a href="#main-content" class="skip-link">Skip to main content</a>

<!-- Focusable elements -->
<button type="button" tabindex="0">Focusable Button</button>
<input type="text" tabindex="0" placeholder="Focusable Input" />
<a href="/link" tabindex="0">Focusable Link</a>

<!-- Non-focusable elements -->
<div tabindex="-1">Non-focusable div</div>
<span tabindex="-1">Non-focusable span</span>
```

#### Screen Reader Support

Provide proper support for screen readers.

```html
<!-- Hidden text for screen readers -->
<button type="button">
  <span class="icon" aria-hidden="true">🔍</span>
  <span class="sr-only">Search</span>
</button>

<!-- Live regions for dynamic content -->
<div aria-live="polite" aria-atomic="true" id="status-messages"></div>

<!-- Descriptive text -->
<img
  src="chart.jpg"
  alt="Sales increased by 25% from Q1 to Q2, reaching $2.5M in revenue"
/>

<!-- Complex images with long descriptions -->
<img
  src="infographic.jpg"
  alt="Detailed infographic showing market trends"
  longdesc="infographic-description.html"
/>
```

### SEO Optimization

#### Meta Tags

Use comprehensive meta tags for SEO.

```html
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />

  <!-- Primary meta tags -->
  <title>Page Title - Company Name</title>
  <meta name="title" content="Page Title - Company Name" />
  <meta
    name="description"
    content="Brief description of the page content (150-160 characters)"
  />
  <meta name="keywords" content="keyword1, keyword2, keyword3" />
  <meta name="author" content="Author Name" />

  <!-- Open Graph / Facebook -->
  <meta property="og:type" content="website" />
  <meta property="og:url" content="https://example.com/page/" />
  <meta property="og:title" content="Page Title - Company Name" />
  <meta
    property="og:description"
    content="Brief description of the page content"
  />
  <meta property="og:image" content="https://example.com/image.jpg" />
  <meta property="og:site_name" content="Company Name" />

  <!-- Twitter -->
  <meta property="twitter:card" content="summary_large_image" />
  <meta property="twitter:url" content="https://example.com/page/" />
  <meta property="twitter:title" content="Page Title - Company Name" />
  <meta
    property="twitter:description"
    content="Brief description of the page content"
  />
  <meta property="twitter:image" content="https://example.com/image.jpg" />

  <!-- Additional SEO -->
  <meta name="robots" content="index, follow" />
  <meta name="googlebot" content="index, follow" />
  <link rel="canonical" href="https://example.com/page/" />
  <link rel="alternate" hreflang="en" href="https://example.com/page/" />
  <link rel="alternate" hreflang="es" href="https://example.com/es/page/" />
</head>
```

#### Structured Data

Implement structured data for better search results.

```html
<!-- JSON-LD structured data -->
<script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "Company Name",
    "url": "https://example.com",
    "logo": "https://example.com/logo.png",
    "contactPoint": {
      "@type": "ContactPoint",
      "telephone": "+1-555-123-4567",
      "contactType": "customer service"
    },
    "sameAs": [
      "https://facebook.com/company",
      "https://twitter.com/company",
      "https://linkedin.com/company/company"
    ]
  }
</script>

<!-- Microdata -->
<article itemscope itemtype="https://schema.org/Article">
  <h1 itemprop="headline">Article Title</h1>
  <div itemprop="author" itemscope itemtype="https://schema.org/Person">
    <span itemprop="name">Author Name</span>
  </div>
  <time itemprop="datePublished" datetime="2024-01-15">January 15, 2024</time>
  <div itemprop="articleBody">
    <p>Article content...</p>
  </div>
</article>
```

### Performance

#### Resource Loading

Optimize resource loading for better performance.

```html
<!-- Preload critical resources -->
<link
  rel="preload"
  href="/fonts/main-font.woff2"
  as="font"
  type="font/woff2"
  crossorigin
/>
<link rel="preload" href="/css/critical.css" as="style" />
<link rel="preload" href="/js/critical.js" as="script" />

<!-- Prefetch resources for next page -->
<link rel="prefetch" href="/next-page.html" />
<link rel="prefetch" href="/images/hero-image.jpg" />

<!-- DNS prefetch for external domains -->
<link rel="dns-prefetch" href="//fonts.googleapis.com" />
<link rel="dns-prefetch" href="//api.example.com" />

<!-- Lazy loading for images -->
<img src="image.jpg" alt="Description" loading="lazy" decoding="async" />

<!-- Defer non-critical scripts -->
<script src="/js/analytics.js" defer></script>
<script src="/js/chat-widget.js" defer></script>

<!-- Async for independent scripts -->
<script src="/js/third-party-widget.js" async></script>
```

#### Critical CSS

Inline critical CSS for faster rendering.

```html
<head>
  <style>
    /* Critical CSS for above-the-fold content */
    body {
      margin: 0;
      font-family: Arial, sans-serif;
    }
    .header {
      background: #333;
      color: white;
      padding: 1rem;
    }
    .hero {
      background: #f0f0f0;
      padding: 2rem;
      text-align: center;
    }
  </style>

  <!-- Load non-critical CSS asynchronously -->
  <link
    rel="preload"
    href="/css/main.css"
    as="style"
    onload="this.onload=null;this.rel='stylesheet'"
  />
  <noscript><link rel="stylesheet" href="/css/main.css" /></noscript>
</head>
```

### Semantic HTML

#### Content Structure

Use semantic elements to structure content properly.

```html
<!-- Article structure -->
<article>
  <header>
    <h1>Article Title</h1>
    <div class="article-meta">
      <address class="author">
        By <a href="/author/john-doe">John Doe</a>
      </address>
      <time datetime="2024-01-15T10:30:00Z">January 15, 2024 at 10:30 AM</time>
    </div>
  </header>

  <div class="article-content">
    <p>Article introduction...</p>

    <section>
      <h2>Section Title</h2>
      <p>Section content...</p>

      <figure>
        <img src="image.jpg" alt="Descriptive alt text" />
        <figcaption>Image caption explaining the image</figcaption>
      </figure>
    </section>

    <section>
      <h2>Another Section</h2>
      <p>More content...</p>

      <blockquote cite="https://example.com/source">
        <p>This is a quote from an external source.</p>
        <footer>
          <cite>Source Name</cite>
        </footer>
      </blockquote>
    </section>
  </div>

  <footer>
    <div class="article-tags">
      <span>Tags:</span>
      <ul>
        <li><a href="/tag/web-development">Web Development</a></li>
        <li><a href="/tag/html">HTML</a></li>
      </ul>
    </div>
  </footer>
</article>
```

#### Navigation Structure

Create accessible navigation structures.

```html
<!-- Breadcrumb navigation -->
<nav aria-label="Breadcrumb">
  <ol>
    <li><a href="/">Home</a></li>
    <li><a href="/category">Category</a></li>
    <li aria-current="page">Current Page</li>
  </ol>
</nav>

<!-- Main navigation -->
<nav role="navigation" aria-label="Main navigation">
  <ul>
    <li><a href="/" aria-current="page">Home</a></li>
    <li>
      <a href="/products" aria-expanded="false" aria-haspopup="true">
        Products
      </a>
      <ul>
        <li><a href="/products/software">Software</a></li>
        <li><a href="/products/hardware">Hardware</a></li>
      </ul>
    </li>
    <li><a href="/about">About</a></li>
    <li><a href="/contact">Contact</a></li>
  </ul>
</nav>

<!-- Pagination -->
<nav aria-label="Pagination">
  <ul>
    <li><a href="/page/1" aria-label="Previous page">«</a></li>
    <li><a href="/page/1">1</a></li>
    <li><a href="/page/2" aria-current="page">2</a></li>
    <li><a href="/page/3">3</a></li>
    <li><a href="/page/3" aria-label="Next page">»</a></li>
  </ul>
</nav>
```
