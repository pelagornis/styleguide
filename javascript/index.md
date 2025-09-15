---
layout: page
title: JavaScript Style Guide
icon: /assets/images/icons/javascript.svg
---

## Table of Contents

- [Naming](#naming)
- [JavaScript Style Rules](#javascript-style-rules)
- [JavaScript Formatting Rules](#javascript-formatting-rules)
- [Modern JavaScript Features](#modern-javascript-features)
- [Async Programming](#async-programming)
- [Error Handling](#error-handling)
- [Performance](#performance)
- [Testing](#testing)

### Naming

#### Variable and Function Names

Use **camelCase** for variable and function names (first letter lowercase, subsequent words uppercase).

```js
let totalAmount = 100;
function calculateTotal() {}
```

#### Constant Names

Constants should be written in **UPPERCASE** letters with words separated by underscores. This style clearly distinguishes constants from regular variables, making them easily identifiable.

```js
const MAX_STRING = 100;
```

#### Class Names

Class names should follow **PascalCase**, where each word, including the first, starts with an uppercase letter. This differentiates class names from other identifiers, making them easy to recognize.

```js
class Pelagornis {}
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
function fetchData() {}
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
const company = "pelagornis";
const greeting = `Hello, ${company}`;
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
if (x === 5) {
}
if (y !== 10) {
}
```

#### Conditional Statements

Always use curly braces around the body of **if-else** statements, even if there’s only one line of code. This makes the code easier to read and prevents errors when adding more lines in the future.

```js
if (x > 5) {
  console.log(`Point: ${x}`);
} else {
  // ...
}
```

#### `switch` Statements

Ensure that a `break` statement follows each `case` in a `switch` statement. This prevents unintended fall-through, where code can accidentally execute multiple `case` blocks.

```js
switch (lang) {
  case "en":
    console.log("English");
    break;
  case "ko":
    console.log("Korea");
    break;
  default:
    console.log("Unknown lang");
}
```

#### Loops

Prefer **higher-order functions** like `forEach`, `map`, or `filter` for iterating over arrays, as these methods are more concise and functional compared to traditional loops.

```js
arr.forEach((item) => console.log(item));
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
    console.error("Error:", error);
  }
}
```

#### Objects and Arrays

Whenever possible, use **dot notation** for accessing properties of objects, as it’s more concise. For manipulating arrays, use **higher-order functions** like `map`, `filter`, or `reduce` instead of traditional loops.

```js
const user = { name: "Zepa", age: 22 };
console.log(user.name);
```

#### Type Conversion

Always use **explicit type conversion** (e.g., `String()`, `Number()`) instead of relying on JavaScript’s automatic type coercion, which can lead to confusing or unpredictable results.

```js
const str = String(100);
const num = Number("123");
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
function sum(a, b) {}
```

**Opening curly braces**: Do not add spaces between the function declaration and the opening curly brace.

```js
function hello() {
  console.log("Hello");
}
```

#### Line Breaks

Break long lines of code to improve readability and maintain a maximum line length of 80–100 characters.

```js
const content =
  "VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV" +
  "LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL";
```

#### Blank Lines

Add a blank line at the end of the file to separate it from any subsequent code. Use blank lines between logical blocks of code to increase readability.

```js
function sum(a, b) {}

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
function add(a, b) {
  return a + b;
}

/*
 * This function returns user details.
 * It fetches user information based on the provided ID.
 */
function fetchUser(id) {}
```

#### Sorting and Whitespace in Objects

Sort the properties of objects alphabetically for consistency and easier navigation.

```js
const company = {
  name: "pelagornis",
  location: "Korea",
};
```

### ETC Rules

#### Modularization and File Separation

Split code into modules, each focusing on a single responsibility. This promotes better organization, testability, and maintainability.

```js
// src/utils/data.js
export function Data(items) {}
```

#### JSDoc Usage

Document functions using `JSDoc` comments. Provide clear descriptions of parameters, return values, and side effects to help others (and yourself) understand your code.

````js
/**
 * Returns the sum of two numbers.
 * @param {number} a - The first number
 * @param {number} b - The second number
 * @returns {number} The sum of a and b
 */
function add(a, b) { return a + b; }

### Modern JavaScript Features

#### Destructuring Assignment
Use destructuring for cleaner variable assignment and function parameters.

```js
// Object destructuring
const user = { name: 'John', age: 30, city: 'Seoul' };
const { name, age, city } = user;

// Array destructuring
const colors = ['red', 'green', 'blue'];
const [primary, secondary, tertiary] = colors;

// Function parameter destructuring
function greetUser({ name, age }) {
  return `Hello ${name}, you are ${age} years old`;
}

// Nested destructuring
const config = {
  database: {
    host: 'localhost',
    port: 5432,
    credentials: {
      username: 'admin',
      password: 'secret'
    }
  }
};

const { database: { host, credentials: { username } } } = config;
````

#### Spread and Rest Operators

Use spread and rest operators for array and object manipulation.

```js
// Spread operator for arrays
const arr1 = [1, 2, 3];
const arr2 = [4, 5, 6];
const combined = [...arr1, ...arr2];

// Spread operator for objects
const user = { name: "John", age: 30 };
const userWithEmail = { ...user, email: "john@example.com" };

// Rest operator for function parameters
function sum(...numbers) {
  return numbers.reduce((total, num) => total + num, 0);
}

// Rest operator for destructuring
const [first, second, ...rest] = [1, 2, 3, 4, 5];
```

#### Template Literals

Use template literals for string interpolation and multi-line strings.

```js
const name = "John";
const age = 30;

// String interpolation
const greeting = `Hello, my name is ${name} and I am ${age} years old`;

// Multi-line strings
const html = `
  <div class="user-card">
    <h2>${name}</h2>
    <p>Age: ${age}</p>
  </div>
`;

// Tagged template literals
function highlight(strings, ...values) {
  return strings.reduce((result, string, i) => {
    const value = values[i] ? `<mark>${values[i]}</mark>` : "";
    return result + string + value;
  }, "");
}

const highlighted = highlight`Hello ${name}, you are ${age} years old`;
```

#### Optional Chaining and Nullish Coalescing

Use optional chaining and nullish coalescing for safer property access.

```js
// Optional chaining
const user = {
  profile: {
    settings: {
      theme: "dark",
    },
  },
};

const theme = user?.profile?.settings?.theme;
const email = user?.profile?.email ?? "No email provided";

// Nullish coalescing
const config = {
  timeout: null,
  retries: undefined,
  debug: false,
};

const timeout = config.timeout ?? 5000; // 5000
const retries = config.retries ?? 3; // 3
const debug = config.debug ?? true; // false (not nullish)
```

#### Array Methods

Use modern array methods for functional programming.

```js
const users = [
  { id: 1, name: "John", age: 30, active: true },
  { id: 2, name: "Jane", age: 25, active: false },
  { id: 3, name: "Bob", age: 35, active: true },
];

// Filter and map
const activeUserNames = users
  .filter((user) => user.active)
  .map((user) => user.name);

// Reduce
const totalAge = users.reduce((sum, user) => sum + user.age, 0);

// Find and findIndex
const user = users.find((user) => user.id === 2);
const userIndex = users.findIndex((user) => user.id === 2);

// Some and every
const hasActiveUsers = users.some((user) => user.active);
const allUsersActive = users.every((user) => user.active);

// Flat and flatMap
const nested = [
  [1, 2],
  [3, 4],
  [5, 6],
];
const flattened = nested.flat();
const doubled = nested.flatMap((arr) => arr.map((x) => x * 2));
```

### Async Programming

#### Promises

Use Promises for handling asynchronous operations.

```js
// Creating promises
function fetchUserData(userId) {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      if (userId > 0) {
        resolve({ id: userId, name: "John Doe" });
      } else {
        reject(new Error("Invalid user ID"));
      }
    }, 1000);
  });
}

// Promise chaining
fetchUserData(1)
  .then((user) => {
    console.log("User:", user);
    return fetchUserPosts(user.id);
  })
  .then((posts) => {
    console.log("Posts:", posts);
  })
  .catch((error) => {
    console.error("Error:", error);
  });

// Promise.all for parallel execution
Promise.all([fetchUserData(1), fetchUserData(2), fetchUserData(3)])
  .then((users) => {
    console.log("All users:", users);
  })
  .catch((error) => {
    console.error("Error fetching users:", error);
  });

// Promise.allSettled for handling mixed results
Promise.allSettled([
  fetchUserData(1),
  fetchUserData(-1), // This will fail
  fetchUserData(3),
]).then((results) => {
  results.forEach((result, index) => {
    if (result.status === "fulfilled") {
      console.log(`User ${index + 1}:`, result.value);
    } else {
      console.log(`User ${index + 1} failed:`, result.reason);
    }
  });
});
```

#### Async/Await

Use async/await for cleaner asynchronous code.

```js
// Basic async/await
async function fetchUserWithPosts(userId) {
  try {
    const user = await fetchUserData(userId);
    const posts = await fetchUserPosts(user.id);
    return { user, posts };
  } catch (error) {
    console.error("Error:", error);
    throw error;
  }
}

// Parallel execution with async/await
async function fetchMultipleUsers(userIds) {
  try {
    const userPromises = userIds.map((id) => fetchUserData(id));
    const users = await Promise.all(userPromises);
    return users;
  } catch (error) {
    console.error("Error fetching users:", error);
    throw error;
  }
}

// Error handling with async/await
async function safeFetchUser(userId) {
  try {
    const user = await fetchUserData(userId);
    return { success: true, data: user };
  } catch (error) {
    return { success: false, error: error.message };
  }
}
```

#### Generators

Use generators for creating iterators and handling complex async flows.

```js
// Basic generator
function* numberGenerator() {
  yield 1;
  yield 2;
  yield 3;
}

const gen = numberGenerator();
console.log(gen.next().value); // 1
console.log(gen.next().value); // 2
console.log(gen.next().value); // 3

// Generator with parameters
function* fibonacci() {
  let a = 0,
    b = 1;
  while (true) {
    yield a;
    [a, b] = [b, a + b];
  }
}

const fib = fibonacci();
for (let i = 0; i < 10; i++) {
  console.log(fib.next().value);
}

// Async generator
async function* asyncDataGenerator() {
  for (let i = 0; i < 5; i++) {
    await new Promise((resolve) => setTimeout(resolve, 1000));
    yield `Data ${i}`;
  }
}

async function processAsyncData() {
  for await (const data of asyncDataGenerator()) {
    console.log(data);
  }
}
```

### Error Handling

#### Try-Catch Blocks

Use try-catch blocks for error handling.

```js
// Basic try-catch
function divide(a, b) {
  try {
    if (b === 0) {
      throw new Error("Division by zero is not allowed");
    }
    return a / b;
  } catch (error) {
    console.error("Error in divide function:", error.message);
    throw error;
  }
}

// Try-catch with async/await
async function fetchDataWithRetry(url, maxRetries = 3) {
  for (let attempt = 1; attempt <= maxRetries; attempt++) {
    try {
      const response = await fetch(url);
      if (!response.ok) {
        throw new Error(`HTTP error! status: ${response.status}`);
      }
      return await response.json();
    } catch (error) {
      console.error(`Attempt ${attempt} failed:`, error.message);
      if (attempt === maxRetries) {
        throw new Error(`Failed to fetch data after ${maxRetries} attempts`);
      }
      await new Promise((resolve) => setTimeout(resolve, 1000 * attempt));
    }
  }
}
```

#### Custom Error Classes

Create custom error classes for better error handling.

```js
class ValidationError extends Error {
  constructor(message, field) {
    super(message);
    this.name = "ValidationError";
    this.field = field;
  }
}

class NetworkError extends Error {
  constructor(message, statusCode) {
    super(message);
    this.name = "NetworkError";
    this.statusCode = statusCode;
  }
}

function validateUser(user) {
  if (!user.name) {
    throw new ValidationError("Name is required", "name");
  }
  if (!user.email) {
    throw new ValidationError("Email is required", "email");
  }
  return true;
}

function handleUserCreation(user) {
  try {
    validateUser(user);
    // Process user creation
    return { success: true, user };
  } catch (error) {
    if (error instanceof ValidationError) {
      return { success: false, error: error.message, field: error.field };
    }
    throw error;
  }
}
```

#### Error Boundaries

Implement error boundaries for graceful error handling.

```js
class ErrorBoundary {
  constructor() {
    this.errors = [];
  }

  async execute(fn) {
    try {
      return await fn();
    } catch (error) {
      this.errors.push(error);
      console.error("Error caught by boundary:", error);
      return null;
    }
  }

  hasErrors() {
    return this.errors.length > 0;
  }

  getErrors() {
    return this.errors;
  }

  clearErrors() {
    this.errors = [];
  }
}

// Usage
const boundary = new ErrorBoundary();

const result1 = await boundary.execute(() => fetchUserData(1));
const result2 = await boundary.execute(() => fetchUserData(-1));

if (boundary.hasErrors()) {
  console.log("Some operations failed:", boundary.getErrors());
}
```

### Performance

#### Memory Management

Optimize memory usage and prevent memory leaks.

```js
// WeakMap for private data
const privateData = new WeakMap();

class User {
  constructor(name, email) {
    privateData.set(this, { name, email });
  }

  getName() {
    return privateData.get(this).name;
  }

  getEmail() {
    return privateData.get(this).email;
  }
}

// WeakSet for tracking objects
const processedUsers = new WeakSet();

function processUser(user) {
  if (processedUsers.has(user)) {
    return; // Already processed
  }

  // Process user
  processedUsers.add(user);
}

// Proper cleanup
class DataManager {
  constructor() {
    this.listeners = new Set();
    this.timers = new Set();
  }

  addListener(callback) {
    this.listeners.add(callback);
  }

  removeListener(callback) {
    this.listeners.delete(callback);
  }

  startTimer(callback, interval) {
    const timer = setInterval(callback, interval);
    this.timers.add(timer);
    return timer;
  }

  cleanup() {
    this.listeners.clear();
    this.timers.forEach((timer) => clearInterval(timer));
    this.timers.clear();
  }
}
```

#### Debouncing and Throttling

Use debouncing and throttling for performance optimization.

```js
// Debounce function
function debounce(func, wait) {
  let timeout;
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout);
      func(...args);
    };
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
  };
}

// Throttle function
function throttle(func, limit) {
  let inThrottle;
  return function executedFunction(...args) {
    if (!inThrottle) {
      func.apply(this, args);
      inThrottle = true;
      setTimeout(() => (inThrottle = false), limit);
    }
  };
}

// Usage examples
const debouncedSearch = debounce((query) => {
  console.log("Searching for:", query);
}, 300);

const throttledScroll = throttle(() => {
  console.log("Scroll event");
}, 100);

// Event listeners
document.getElementById("search").addEventListener("input", (e) => {
  debouncedSearch(e.target.value);
});

window.addEventListener("scroll", throttledScroll);
```

#### Lazy Loading

Implement lazy loading for better performance.

```js
// Lazy loading with Intersection Observer
class LazyLoader {
  constructor() {
    this.observer = new IntersectionObserver(
      this.handleIntersection.bind(this),
      { threshold: 0.1 }
    );
  }

  observe(element) {
    this.observer.observe(element);
  }

  handleIntersection(entries) {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        this.loadContent(entry.target);
        this.observer.unobserve(entry.target);
      }
    });
  }

  loadContent(element) {
    const src = element.dataset.src;
    if (src) {
      element.src = src;
      element.classList.add("loaded");
    }
  }
}

// Usage
const lazyLoader = new LazyLoader();
document.querySelectorAll("img[data-src]").forEach((img) => {
  lazyLoader.observe(img);
});

// Lazy loading with dynamic imports
async function loadModule(moduleName) {
  try {
    const module = await import(`./modules/${moduleName}.js`);
    return module;
  } catch (error) {
    console.error(`Failed to load module ${moduleName}:`, error);
    return null;
  }
}

// Conditional module loading
async function loadFeature(featureName) {
  if (shouldLoadFeature(featureName)) {
    const feature = await loadModule(featureName);
    if (feature) {
      feature.initialize();
    }
  }
}
```

### Testing

#### Unit Testing

Write comprehensive unit tests for your functions.

```js
// Test framework setup (using Jest-like syntax)
class TestRunner {
  constructor() {
    this.tests = [];
    this.passed = 0;
    this.failed = 0;
  }

  test(name, fn) {
    this.tests.push({ name, fn });
  }

  async run() {
    for (const test of this.tests) {
      try {
        await test.fn();
        console.log(`✓ ${test.name}`);
        this.passed++;
      } catch (error) {
        console.log(`✗ ${test.name}: ${error.message}`);
        this.failed++;
      }
    }
    console.log(`\nTests: ${this.passed} passed, ${this.failed} failed`);
  }
}

// Test utilities
function expect(actual) {
  return {
    toBe(expected) {
      if (actual !== expected) {
        throw new Error(`Expected ${expected}, but got ${actual}`);
      }
    },
    toEqual(expected) {
      if (JSON.stringify(actual) !== JSON.stringify(expected)) {
        throw new Error(
          `Expected ${JSON.stringify(expected)}, but got ${JSON.stringify(
            actual
          )}`
        );
      }
    },
    toThrow() {
      try {
        actual();
        throw new Error("Expected function to throw an error");
      } catch (error) {
        // Expected behavior
      }
    },
  };
}

// Example tests
const runner = new TestRunner();

runner.test("add function should return sum of two numbers", () => {
  expect(add(2, 3)).toBe(5);
  expect(add(-1, 1)).toBe(0);
  expect(add(0, 0)).toBe(0);
});

runner.test("divide function should throw error for division by zero", () => {
  expect(() => divide(5, 0)).toThrow();
});

runner.test("fetchUserData should return user object", async () => {
  const user = await fetchUserData(1);
  expect(user).toEqual({ id: 1, name: "John Doe" });
});

runner.run();
```

#### Mocking

Use mocking for testing functions with dependencies.

```js
// Mock function
function createMock() {
  const calls = [];
  const mockFn = function (...args) {
    calls.push(args);
    return mockFn.returnValue;
  };

  mockFn.calls = calls;
  mockFn.returnValue = undefined;
  mockFn.mockReturnValue = (value) => {
    mockFn.returnValue = value;
    return mockFn;
  };

  return mockFn;
}

// Mock fetch
const mockFetch = createMock();
mockFetch.mockReturnValue({
  ok: true,
  json: () => Promise.resolve({ id: 1, name: "John Doe" }),
});

// Test with mock
runner.test("fetchUserData should use fetch", async () => {
  const originalFetch = global.fetch;
  global.fetch = mockFetch;

  try {
    await fetchUserData(1);
    expect(mockFetch.calls.length).toBe(1);
    expect(mockFetch.calls[0][0]).toBe("/api/users/1");
  } finally {
    global.fetch = originalFetch;
  }
});
```
