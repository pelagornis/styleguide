---
layout: page
title: JavaScript Style Guide
icon: /assets/images/icons/javascript.svg
---

## Table of Contents

- [Naming](#naming)
- [Javascript Style Rules](#javascript-style-rules)
- [Javascript Formatting Rules](#javascript-formatting-rules)
- [ETC Rules](#etc-rules)

### Naming

#### Variable and Function Names
Use **camelCase** for variable and function names (first letter lowercase, subsequent words uppercase).

```js
let totalAmount = 100;
function calculateTotal() { }
```

#### Constant Names
Constants should be written in **UPPERCASE** letters with words separated by underscores. This style clearly distinguishes constants from regular variables, making them easily identifiable.

```js
const MAX_STRING = 100;
```

#### Class Names
Class names should follow **PascalCase**, where each word, including the first, starts with an uppercase letter. This differentiates class names from other identifiers, making them easy to recognize.

```js
class Pelagornis { }
```

#### File and Folder Names
For file and folder names, use **lowercase letters** with **hyphens** separating words. This format is widely accepted and makes the names easier to read across different systems.

```
button-component.js
pelagornis-ui/
```

#### Method Names
Method names should generally start with a verb to indicate action and should follow **camelCase** to maintain consistency with variable and function names.

```js
function fetchData() { }
```

### Javascript Style Rules

#### Semicolons
Always use semicolons at the end of statements. While JavaScript has automatic semicolon insertion, it’s better to include semicolons explicitly to avoid potential issues and ensure consistent behavior.

```js
const x = 5;
const y = 10;
```

#### Quotes
For string literals, use **single quotes** (`'`). However, when performing string interpolation, use **backticks** (```) to create template literals.

```js
const company = 'pelagornis';
const greeting = 'Hello, ${company}';
```

#### Variable Declarations
Always use `const` for values that will not change, and `let` for values that can be reassigned. Avoid `var`, as it can lead to unexpected behavior due to its function-scoped nature.

```js
const maxCount = 10;
let currentCount = 5;
```

#### Comparison Operators
Always use strict **equality** (`===`) and **strict inequality** (`!==`) for comparisons. This ensures that both the value and the type match, preventing issues with JavaScript’s automatic type coercion.

```js
if (x === 5) { }
if (y !== 10) { }
```

#### Conditional Statements
Always use curly braces around the body of **if-else** statements, even if there’s only one line of code. This makes the code easier to read and prevents errors when adding more lines in the future.

```js
if (x > 5) {
  console.log('Point: ${x}');
} else {
  // ...
}
```

#### `switch` Statements
Ensure that a `break` statement follows each `case` in a `switch` statement. This prevents unintended fall-through, where code can accidentally execute multiple `case` blocks.

```js
switch (lang) {
  case 'en':
    console.log('English');
    break;
  case 'ko':
    console.log('Korea');
    break;
  default:
    console.log('Unknown lang');
}
```

#### Loops
Prefer **higher-order functions** like `forEach`, `map`, or `filter` for iterating over arrays, as these methods are more concise and functional compared to traditional loops.

```js
arr.forEach(item => console.log(item));
```

#### Functions and Methods
Use **arrow functions** for a more concise syntax, and use **named functions** rather than anonymous ones for better debugging and easier stack tracing.

```js
const add = (a, b) => a + b;
```

#### Asynchronous
For handling asynchronous operations, prefer using `async/await` syntax. It is more readable and easier to manage than using `then/catch`.

```js
async function fetchData() {
  try {
    const response = await fetch(url);
    return await response.json();
  } catch (error) {
    console.error('Error:', error);
  }
}
```

#### Objects and Arrays
Whenever possible, use **dot notation** for accessing properties of objects, as it’s more concise. For manipulating arrays, use **higher-order functions** like `map`, `filter`, or `reduce` instead of traditional loops.

```js
const user = { name: 'Zepa', age: 22 };
console.log(user.name);
```

#### Type Conversion
Always use **explicit type conversion** (e.g., `String()`, `Number()`) instead of relying on JavaScript’s automatic type coercion, which can lead to confusing or unpredictable results.

```js
const str = String(100);
const num = Number('123');
```

### Javascript Formatting Rules

#### Indentation
Use **2 spaces** for indentation throughout the codebase. This helps keep the code compact while maintaining readability.

#### Whitespace
**Around operators**: Always add a space before and after operators (=, +, -, etc.) for clarity.

```js
const sum = a + b;
const product = x * y;
```
**Function parameters**: Do not add spaces between the function name and the opening parenthesis.

```js
function sum(a, b) { }
```

**Opening curly braces**: Do not add spaces between the function declaration and the opening curly brace.

```js
function hello() { console.log('Hello'); }
```

#### Line Breaks
Break long lines of code to improve readability and maintain a maximum line length of 80–100 characters.

```js
const content = 'VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV' + 'LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL';
```

#### Blank Lines
Add a blank line at the end of the file to separate it from any subsequent code. Use blank lines between logical blocks of code to increase readability.

```js
function sum(a, b) { }

// Blank line
```

#### `const` and `let` Declaration Order
Declare **constants** at the top of a block, followed by `let` variables. This keeps the code structured and easier to follow.

```js
const MAX_COUNT = 100;
let currentCount = 5;
```

#### Comments
Use **single-line comments** with `//` for short explanations, and **multi-line comments** with `/* */` for longer descriptions.

```js
// This function returns the sum of two numbers.
function add(a, b) { return a + b; }

/*
 * This function returns user details.
 * It fetches user information based on the provided ID.
 */
function fetchUser(id) { }
```

#### Sorting and Whitespace in Objects
Sort the properties of objects alphabetically for consistency and easier navigation.

```js
const company = {
  name: 'pelagornis',
  location: 'Korea'
};
```

### ETC Rules

#### Modularization and File Separation
Split code into modules, each focusing on a single responsibility. This promotes better organization, testability, and maintainability.

```js
// src/utils/data.js
export function Data(items) { }
```

#### JSDoc Usage
Document functions using `JSDoc` comments. Provide clear descriptions of parameters, return values, and side effects to help others (and yourself) understand your code.

```js
/**
 * Returns the sum of two numbers.
 * @param {number} a - The first number
 * @param {number} b - The second number
 * @returns {number} The sum of a and b
 */
function add(a, b) { return a + b; }
```
