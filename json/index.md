---
layout: page
title: JSON Style Guide
icon: /assets/images/icons/json.svg
---

## Table of Contents
- [Naming](#naming)
- [JSON Style Rules](#json-style-rules)
- [JSON Formatting Rules](#json-formatting-rules)

### Naming

### Key Names
Use **camelCase** for key names to maintain consistency across different programming languages.
  
```json
{
  "firstName": "Pelagornis",
  "lastName": "INC"
}
```

Consistency: Ensure that you use the same naming convention consistently across the project. For example, if you use camelCase in one file, use it in all other files as well.

#### Number Values
Numbers that should be treated as strings (e.g., phone numbers, card numbers) should be stored as string values.

```json
{
  "phoneNumber": "123-456-7890"
}
```

#### Boolean Values
Store boolean values as true or false. Avoid using `1`, `0`, `yes`, or `no`, as these are not valid in JSON.

```json
{
  "isActive": true
}
```

#### Null Values
Use `null` for missing or undefined values. It’s better to use null than an empty string ("") or other placeholder values.
```json
{
  "middleName": null
}
```

### JSON Style Rules

#### Indentation
Use **2 spaces** for indentation to ensure a clean and readable hierarchy.

```json
{
  "name": "Alice",
  "age": 30,
  "address": {
    "street": "123 Main St",
    "city": "Wonderland"
  }
}
```

#### Whitespace
Always add a space between **keys and values** for readability.
Add a space after a **comma** to improve clarity.

```json
{
  "lang": "ko",
  "city": "Korea" 
}
```

#### Trailing Comma
Do not add a comma after the last item in an object or array. JSON does not allow trailing commas and some parsers may fail.
```json
{
  "name": "Pelagornis",
  "city": "Korea"
}
```

#### Sorting Keys
**Sort object keys alphabetically** for consistency and easier navigation in larger JSON files.

```json
{
  "name": "ZEPA"
  "type": "AI"
}
```

### JSON Formatting Rules

#### Arrays
When working with arrays, each item should be placed on a new line, and each line should be indented properly.

```json
{
  "fruits": [
    "apple",
    "banana",
    "cherry"
  ]
}
```

#### Nested Objects
When nesting objects within objects, ensure that each nested object is indented to clearly reflect its structure.

```json
{
  "name": "Pelagornis",
  "address": {
    "city": "Korea"
  }
}
```
#### String Formatting
Strings should always be enclosed in double quotes ("). Single quotes (') are not valid in JSON.
```json
{
  "quote": "He said, \"Hello!\""
}
```
#### File Encoding
JSON files must be saved with `UTF-8` encoding to ensure proper character rendering and compatibility.

#### Comments
JSON does not support comments. Do not include comments within JSON files. If comments are necessary, maintain them in a separate documentation file.
