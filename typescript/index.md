---
layout: page
title: TypeScript Style Guide
icon: /assets/images/icons/typescript.svg
---

## Table of Contents
- [Naming](#naming)
- [Typescript Style Rules](#typescript-style-rules)
- [Typescript Formatting Rules](#typescript-formatting-rules)

### Naming

#### Variables, Functions, and Properties
Use **camelCase** for variable, function, and property names.

```typescript
const companyName = "pelagornis";
let statusCode = 200;

function fetchCompanyInfo() {
    return { companyName, statusCode };
}
```

Function names should start with a verb and clearly indicate the function’s purpose.
```typescript
function fetchUserData(id: number) { /* ... */ }
```
  
#### Classes and Interfaces
Use **PascalCase** for class and interface names.

``` typescript
class User {
  constructor(public id: number, public name: string) {}
}

interface UserData {
  id: number;
  name: string;
  email: string;
}
```

#### Constants
Use **UPPER_SNAKE_CASE** for constants to make it clear they are constant values.

```typescript
const BASE_URL = "https://api.pelagornis.com";
```

#### Enums
Use **PascalCase** for enum names and **UPPER_SNAKE_CASE** for enum values.

```typescript
enum UserRule {
  ADMIN = "ADMIN",
  USER = "USER",
  GUEST = "GUEST"
}
```

### Type Aliases
Use **PascalCase** for type aliases, appending the `Type` suffix.

```typescript
type ApiResponse = { data: TokenType[]; error?: string };
```

### TypeScript Style Rules

#### Strict Mode
Always enable TypeScript's **strict mode** (`"strict": true` setting). This enforces a stricter type-checking policy to ensure safer code.

#### Always Use `const` or `let`
Never use `var`. Always use `const` or `let` for variable declarations.

```typescript
const planets = "Earth"; // constant value
let star = "Sun"; // value that might change
star = "Regulus"; // updating value
```

#### Avoid `any`
Avoid using the `any` type. Instead, use more specific types or, if necessary, `unknown`.

```typescript
let result: unknown;
```

#### Prefer Explicit Return Types
Always specify an explicit return type for functions.

```typescript
const fetchData = async (url: string): Promise<string> => {
  const response = await fetch(url);
  return response.text();
}
```

#### Avoid Using `Function` Type
Avoid using the `Function` type. Instead, use a specific function signature.

```typescript
type AddFunction = (a: number, b: number) => number;
const add: AddFunction = (a, b) => a + b;
```

#### Use `as const` for Literal Types
Use `as const` when dealing with constant values to infer literal types.

```typescript
const direction = "up" as const;
```

### TypeScript Formatting Rules

#### Indentation
Use **2 spaces** for indentation.

#### Line Length
Limit the length of a line to **100 characters** or fewer.

#### Braces
Always use **braces** for control structures, even if the block is a single line.

```typescript
if (isActive) {
  console.log("Active");
}
```

#### Semicolons
Always include **semicolons (;)** at the end of statements.

```typescript
const statusCode = 200;
```

#### Spacing
Add **spaces** around operators for readability.

```typescript
const result = a + b;
const product = price * quantity;
```

#### Trailing Commas
Use **trailing commas** in array and object literals.
```typescript
const companyInfo = {
  name: "pelagornis",
  city: "Seoul, Korea",
};

const numbers = [
  1,
  2,
  3,
];
```
