---
layout: page
title: JSON Style Guide
icon: /assets/images/icons/json.svg
---

## Table of Contents

- [Naming](#naming)
- [JSON Style Rules](#json-style-rules)
- [JSON Formatting Rules](#json-formatting-rules)
- [JSON Schema](#json-schema)
- [API Design](#api-design)
- [Security](#security)
- [Performance](#performance)
- [Tools and Validation](#tools-and-validation)

### Naming

#### Key Names

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
  "name": "ZEPA",
  "type": "AI"
}
```

#### Data Types

Use appropriate data types for different kinds of data.

```json
{
  "id": 12345,
  "name": "John Doe",
  "email": "john@example.com",
  "age": 30,
  "isActive": true,
  "salary": 75000.5,
  "tags": ["developer", "senior"],
  "profile": {
    "bio": "Software engineer with 5 years experience",
    "avatar": "https://example.com/avatar.jpg"
  },
  "lastLogin": "2024-01-15T10:30:00Z",
  "metadata": null
}
```

### JSON Formatting Rules

#### Arrays

When working with arrays, each item should be placed on a new line, and each line should be indented properly.

```json
{
  "fruits": ["apple", "banana", "cherry"]
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

### JSON Schema

#### Schema Definition

Use JSON Schema to define the structure and validation rules for your JSON data.

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://example.com/schemas/user.json",
  "title": "User",
  "description": "A user in the system",
  "type": "object",
  "properties": {
    "id": {
      "type": "integer",
      "minimum": 1,
      "description": "Unique identifier for the user"
    },
    "name": {
      "type": "string",
      "minLength": 1,
      "maxLength": 100,
      "description": "User's full name"
    },
    "email": {
      "type": "string",
      "format": "email",
      "description": "User's email address"
    },
    "age": {
      "type": "integer",
      "minimum": 0,
      "maximum": 150,
      "description": "User's age in years"
    },
    "isActive": {
      "type": "boolean",
      "description": "Whether the user account is active"
    },
    "tags": {
      "type": "array",
      "items": {
        "type": "string"
      },
      "uniqueItems": true,
      "description": "User tags"
    },
    "profile": {
      "type": "object",
      "properties": {
        "bio": {
          "type": "string",
          "maxLength": 500
        },
        "avatar": {
          "type": "string",
          "format": "uri"
        }
      },
      "additionalProperties": false
    }
  },
  "required": ["id", "name", "email"],
  "additionalProperties": false
}
```

#### Schema Validation

Implement schema validation in your applications.

```json
{
  "validUser": {
    "id": 123,
    "name": "John Doe",
    "email": "john@example.com",
    "age": 30,
    "isActive": true,
    "tags": ["developer", "senior"],
    "profile": {
      "bio": "Software engineer",
      "avatar": "https://example.com/avatar.jpg"
    }
  },
  "invalidUser": {
    "id": "not-a-number",
    "email": "invalid-email",
    "age": -5
  }
}
```

### API Design

#### RESTful API Response Format

Design consistent API response structures.

```json
{
  "success": true,
  "data": {
    "id": 123,
    "name": "John Doe",
    "email": "john@example.com"
  },
  "meta": {
    "timestamp": "2024-01-15T10:30:00Z",
    "version": "1.0",
    "requestId": "req-123456"
  }
}
```

#### Error Response Format

Standardize error responses across your API.

```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "The request data is invalid",
    "details": [
      {
        "field": "email",
        "message": "Invalid email format"
      },
      {
        "field": "age",
        "message": "Age must be a positive number"
      }
    ]
  },
  "meta": {
    "timestamp": "2024-01-15T10:30:00Z",
    "version": "1.0",
    "requestId": "req-123456"
  }
}
```

#### Pagination Format

Implement consistent pagination for list endpoints.

```json
{
  "success": true,
  "data": [
    {
      "id": 1,
      "name": "User 1"
    },
    {
      "id": 2,
      "name": "User 2"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 10,
    "total": 100,
    "totalPages": 10,
    "hasNext": true,
    "hasPrev": false
  },
  "meta": {
    "timestamp": "2024-01-15T10:30:00Z",
    "version": "1.0"
  }
}
```

#### Collection Resource Format

Design consistent collection resources.

```json
{
  "users": [
    {
      "id": 1,
      "name": "John Doe",
      "email": "john@example.com",
      "links": {
        "self": "/api/v1/users/1",
        "profile": "/api/v1/users/1/profile"
      }
    },
    {
      "id": 2,
      "name": "Jane Smith",
      "email": "jane@example.com",
      "links": {
        "self": "/api/v1/users/2",
        "profile": "/api/v1/users/2/profile"
      }
    }
  ],
  "links": {
    "self": "/api/v1/users",
    "next": "/api/v1/users?page=2",
    "prev": null
  },
  "meta": {
    "count": 2,
    "total": 100
  }
}
```

### Security

#### Sensitive Data Handling

Never include sensitive information in JSON responses.

```json
{
  "user": {
    "id": 123,
    "name": "John Doe",
    "email": "john@example.com",
    "role": "user"
  }
}
```

#### Input Sanitization

Validate and sanitize all JSON input.

```json
{
  "sanitizedInput": {
    "name": "John Doe",
    "description": "Clean description without <script> tags",
    "htmlContent": "&lt;script&gt;alert('xss')&lt;/script&gt;"
  }
}
```

#### Authentication Tokens

Handle authentication tokens securely.

```json
{
  "auth": {
    "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "type": "Bearer",
    "expiresIn": 3600,
    "refreshToken": "refresh_token_here"
  }
}
```

### Performance

#### Minimize JSON Size

Optimize JSON payload size for better performance.

```json
{
  "compact": {
    "id": 123,
    "n": "John Doe",
    "e": "john@example.com",
    "a": 30
  }
}
```

#### Use Compression

Implement compression for large JSON responses.

```json
{
  "compressed": {
    "data": "large_data_here",
    "compression": "gzip",
    "originalSize": 1024000,
    "compressedSize": 256000
  }
}
```

#### Efficient Data Structures

Use efficient data structures for better performance.

```json
{
  "efficient": {
    "users": {
      "123": {
        "name": "John Doe",
        "email": "john@example.com"
      },
      "124": {
        "name": "Jane Smith",
        "email": "jane@example.com"
      }
    },
    "indexes": {
      "byEmail": {
        "john@example.com": 123,
        "jane@example.com": 124
      }
    }
  }
}
```

### Tools and Validation

#### JSON Linting

Use JSON linters to validate syntax and formatting.

```json
{
  "linted": {
    "properly": "formatted",
    "with": "consistent",
    "indentation": true
  }
}
```

#### JSON Schema Validators

Implement schema validation in your development workflow.

```json
{
  "validated": {
    "against": "schema",
    "with": "proper",
    "error": "handling"
  }
}
```

#### JSON Minification

Minify JSON for production environments.

```json
{ "minified": { "compact": "format", "no": "whitespace", "smaller": "size" } }
```
