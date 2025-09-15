---
layout: page
title: TypeScript Style Guide
icon: /assets/images/icons/typescript.svg
---

## Table of Contents

- [Naming](#naming)
- [TypeScript Style Rules](#typescript-style-rules)
- [TypeScript Formatting Rules](#typescript-formatting-rules)
- [Advanced TypeScript Features](#advanced-typescript-features)
- [Generics](#generics)
- [Decorators and Metadata](#decorators-and-metadata)
- [Testing](#testing)
- [Performance](#performance)

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
function fetchUserData(id: number) {
  /* ... */
}
```

#### Classes and Interfaces

Use **PascalCase** for class and interface names.

```typescript
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
  GUEST = "GUEST",
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
};
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

const numbers = [1, 2, 3];
```

### Advanced TypeScript Features

#### Union and Intersection Types

Use union and intersection types for flexible type definitions.

```typescript
// Union types
type Status = "loading" | "success" | "error";
type ID = string | number;

// Intersection types
interface User {
  name: string;
  email: string;
}

interface Admin {
  permissions: string[];
}

type AdminUser = User & Admin;

// Discriminated unions
interface LoadingState {
  status: "loading";
}

interface SuccessState {
  status: "success";
  data: any;
}

interface ErrorState {
  status: "error";
  error: string;
}

type AppState = LoadingState | SuccessState | ErrorState;

function handleState(state: AppState) {
  switch (state.status) {
    case "loading":
      console.log("Loading...");
      break;
    case "success":
      console.log("Data:", state.data);
      break;
    case "error":
      console.log("Error:", state.error);
      break;
  }
}
```

#### Mapped Types

Use mapped types for transforming existing types.

```typescript
// Basic mapped type
type Partial<T> = {
  [P in keyof T]?: T[P];
};

// Readonly mapped type
type Readonly<T> = {
  readonly [P in keyof T]: T[P];
};

// Custom mapped types
type Stringify<T> = {
  [K in keyof T]: string;
};

type User = {
  id: number;
  name: string;
  age: number;
};

type StringifiedUser = Stringify<User>;
// Result: { id: string; name: string; age: string; }

// Conditional mapped types
type NonNullable<T> = T extends null | undefined ? never : T;

// Template literal types
type EventName<T extends string> = `on${Capitalize<T>}`;
type MouseEvent = EventName<"click" | "hover">; // 'onClick' | 'onHover'
```

#### Conditional Types

Use conditional types for type-level logic.

```typescript
// Basic conditional type
type IsArray<T> = T extends any[] ? true : false;

// Infer keyword
type ArrayElement<T> = T extends (infer U)[] ? U : never;
type StringArray = string[];
type StringElement = ArrayElement<StringArray>; // string

// Recursive conditional types
type DeepReadonly<T> = {
  readonly [P in keyof T]: T[P] extends object ? DeepReadonly<T[P]> : T[P];
};

// Utility conditional types
type NonNullable<T> = T extends null | undefined ? never : T;
type ReturnType<T> = T extends (...args: any[]) => infer R ? R : never;
```

#### Template Literal Types

Use template literal types for string manipulation.

```typescript
// Basic template literal types
type Greeting = `Hello, ${string}`;
type EventName<T extends string> = `on${Capitalize<T>}`;

// Advanced template literal types
type Join<K, P> = K extends string | number
  ? P extends string | number
    ? K extends ""
      ? P
      : P extends ""
      ? K
      : `${K}${"" extends P ? "" : "."}${P}`
    : never
  : never;

type Paths<T> = T extends object
  ? {
      [K in keyof T]-?: K extends string | number
        ? `${K}` | Join<K, Paths<T[K]>>
        : never;
    }[keyof T]
  : "";

type User = {
  name: string;
  address: {
    street: string;
    city: string;
  };
};

type UserPaths = Paths<User>; // 'name' | 'address' | 'address.street' | 'address.city'
```

#### Branded Types

Use branded types for type safety.

```typescript
// Branded type
type UserId = number & { readonly __brand: unique symbol };
type ProductId = number & { readonly __brand: unique symbol };

function createUserId(id: number): UserId {
  return id as UserId;
}

function createProductId(id: number): ProductId {
  return id as ProductId;
}

// Usage
const userId = createUserId(123);
const productId = createProductId(456);

// This will cause a TypeScript error
// const comparison = userId === productId; // Error!
```

### Generics

#### Basic Generics

Use generics for reusable type-safe code.

```typescript
// Generic function
function identity<T>(arg: T): T {
  return arg;
}

// Generic interface
interface Container<T> {
  value: T;
  getValue(): T;
  setValue(value: T): void;
}

// Generic class
class Stack<T> {
  private items: T[] = [];

  push(item: T): void {
    this.items.push(item);
  }

  pop(): T | undefined {
    return this.items.pop();
  }

  peek(): T | undefined {
    return this.items[this.items.length - 1];
  }

  isEmpty(): boolean {
    return this.items.length === 0;
  }
}

// Usage
const stringStack = new Stack<string>();
stringStack.push("hello");
stringStack.push("world");

const numberStack = new Stack<number>();
numberStack.push(1);
numberStack.push(2);
```

#### Generic Constraints

Use generic constraints to limit generic types.

```typescript
// Basic constraint
interface Lengthwise {
  length: number;
}

function logLength<T extends Lengthwise>(arg: T): T {
  console.log(arg.length);
  return arg;
}

// Keyof constraint
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

// Multiple constraints
interface Serializable {
  serialize(): string;
}

interface Deserializable {
  deserialize(data: string): void;
}

function processData<T extends Serializable & Deserializable>(data: T): T {
  const serialized = data.serialize();
  const newData = data.deserialize(serialized);
  return newData;
}
```

#### Utility Types

Use built-in utility types for common transformations.

```typescript
// Partial - makes all properties optional
interface User {
  id: number;
  name: string;
  email: string;
}

type PartialUser = Partial<User>;
// Result: { id?: number; name?: string; email?: string; }

// Required - makes all properties required
type RequiredUser = Required<PartialUser>;

// Pick - select specific properties
type UserName = Pick<User, "name">;
// Result: { name: string; }

// Omit - exclude specific properties
type UserWithoutId = Omit<User, "id">;
// Result: { name: string; email: string; }

// Record - create object type with specific keys and values
type UserRoles = Record<string, string[]>;
// Result: { [key: string]: string[]; }

// Exclude - exclude types from union
type NonString = Exclude<string | number | boolean, string>;
// Result: number | boolean

// Extract - extract types from union
type StringOrNumber = Extract<string | number | boolean, string | number>;
// Result: string | number
```

#### Advanced Generic Patterns

Use advanced generic patterns for complex type transformations.

```typescript
// Conditional generic types
type ApiResponse<T> = T extends string
  ? { message: T }
  : T extends number
  ? { count: T }
  : { data: T };

// Recursive generics
type DeepPartial<T> = {
  [P in keyof T]?: T[P] extends object ? DeepPartial<T[P]> : T[P];
};

// Generic function overloads
function process<T extends string>(input: T): T;
function process<T extends number>(input: T): T;
function process<T>(input: T): T {
  return input;
}

// Generic type guards
function isString(value: unknown): value is string {
  return typeof value === "string";
}

function isArray<T>(value: unknown): value is T[] {
  return Array.isArray(value);
}

// Generic error handling
class ApiError<T = string> extends Error {
  constructor(
    message: string,
    public code: T,
    public statusCode: number = 500
  ) {
    super(message);
    this.name = "ApiError";
  }
}

type ErrorCode = "VALIDATION_ERROR" | "NOT_FOUND" | "UNAUTHORIZED";
const error = new ApiError("User not found", "NOT_FOUND", 404);
```

### Decorators and Metadata

#### Class Decorators

Use class decorators for cross-cutting concerns.

```typescript
// Basic class decorator
function sealed(constructor: Function) {
  Object.seal(constructor);
  Object.seal(constructor.prototype);
}

@sealed
class User {
  name: string;
  email: string;
}

// Decorator factory
function configurable(value: boolean) {
  return function (
    target: any,
    propertyKey: string,
    descriptor: PropertyDescriptor
  ) {
    descriptor.configurable = value;
  };
}

// Method decorator
function log(
  target: any,
  propertyName: string,
  descriptor: PropertyDescriptor
) {
  const method = descriptor.value;

  descriptor.value = function (...args: any[]) {
    console.log(`Calling ${propertyName} with args:`, args);
    const result = method.apply(this, args);
    console.log(`${propertyName} returned:`, result);
    return result;
  };
}

class Calculator {
  @log
  add(a: number, b: number): number {
    return a + b;
  }
}
```

#### Property Decorators

Use property decorators for validation and metadata.

```typescript
// Property decorator
function required(target: any, propertyKey: string) {
  const existingRequired = Reflect.getMetadata("required", target) || [];
  Reflect.defineMetadata(
    "required",
    [...existingRequired, propertyKey],
    target
  );
}

// Validation decorator
function validate(
  target: any,
  propertyKey: string,
  descriptor: PropertyDescriptor
) {
  const method = descriptor.value;

  descriptor.value = function (...args: any[]) {
    const required = Reflect.getMetadata("required", target.constructor) || [];

    for (const prop of required) {
      if (!this[prop]) {
        throw new Error(`Property ${prop} is required`);
      }
    }

    return method.apply(this, args);
  };
}

class User {
  @required
  name: string;

  @required
  email: string;

  @validate
  save(): void {
    console.log("Saving user...");
  }
}
```

#### Parameter Decorators

Use parameter decorators for dependency injection and validation.

```typescript
// Parameter decorator
function inject(
  target: any,
  propertyKey: string | symbol,
  parameterIndex: number
) {
  const existingTokens = Reflect.getMetadata("design:paramtypes", target) || [];
  const token = existingTokens[parameterIndex];

  // Store injection token
  const existingInjections = Reflect.getMetadata("injections", target) || [];
  existingInjections[parameterIndex] = token;
  Reflect.defineMetadata("injections", existingInjections, target);
}

// Service decorator
function service(target: any) {
  Reflect.defineMetadata("service", true, target);
}

@service
class UserService {
  getUsers(): string[] {
    return ["John", "Jane"];
  }
}

@service
class EmailService {
  sendEmail(to: string, subject: string): void {
    console.log(`Sending email to ${to}: ${subject}`);
  }
}

class UserController {
  constructor(
    @inject private userService: UserService,
    @inject private emailService: EmailService
  ) {}

  notifyUsers(): void {
    const users = this.userService.getUsers();
    users.forEach((user) => {
      this.emailService.sendEmail(user, "Notification");
    });
  }
}
```

### Testing

#### Unit Testing with Jest

Write comprehensive unit tests for TypeScript code.

```typescript
// User service
class UserService {
  constructor(private apiClient: ApiClient) {}

  async getUser(id: number): Promise<User> {
    const response = await this.apiClient.get(`/users/${id}`);
    return response.data;
  }

  async createUser(userData: CreateUserData): Promise<User> {
    const response = await this.apiClient.post("/users", userData);
    return response.data;
  }
}

// Test file
describe("UserService", () => {
  let userService: UserService;
  let mockApiClient: jest.Mocked<ApiClient>;

  beforeEach(() => {
    mockApiClient = {
      get: jest.fn(),
      post: jest.fn(),
    } as jest.Mocked<ApiClient>;

    userService = new UserService(mockApiClient);
  });

  describe("getUser", () => {
    it("should return user data", async () => {
      const mockUser: User = { id: 1, name: "John", email: "john@example.com" };
      mockApiClient.get.mockResolvedValue({ data: mockUser });

      const result = await userService.getUser(1);

      expect(mockApiClient.get).toHaveBeenCalledWith("/users/1");
      expect(result).toEqual(mockUser);
    });

    it("should throw error when user not found", async () => {
      mockApiClient.get.mockRejectedValue(new Error("User not found"));

      await expect(userService.getUser(999)).rejects.toThrow("User not found");
    });
  });

  describe("createUser", () => {
    it("should create new user", async () => {
      const userData: CreateUserData = {
        name: "Jane",
        email: "jane@example.com",
      };
      const mockUser: User = { id: 2, ...userData };
      mockApiClient.post.mockResolvedValue({ data: mockUser });

      const result = await userService.createUser(userData);

      expect(mockApiClient.post).toHaveBeenCalledWith("/users", userData);
      expect(result).toEqual(mockUser);
    });
  });
});
```

#### Integration Testing

Write integration tests for complete workflows.

```typescript
// Integration test
describe("User Management Integration", () => {
  let app: Express;
  let server: Server;

  beforeAll(async () => {
    app = createApp();
    server = app.listen(0);
  });

  afterAll(async () => {
    server.close();
  });

  it("should create and retrieve user", async () => {
    const userData = { name: "John Doe", email: "john@example.com" };

    // Create user
    const createResponse = await request(app)
      .post("/api/users")
      .send(userData)
      .expect(201);

    const userId = createResponse.body.id;

    // Retrieve user
    const getResponse = await request(app)
      .get(`/api/users/${userId}`)
      .expect(200);

    expect(getResponse.body).toMatchObject(userData);
  });
});
```

#### Mocking and Stubbing

Use mocking for testing with dependencies.

```typescript
// Mock factory
function createMockUserService(): jest.Mocked<UserService> {
  return {
    getUser: jest.fn(),
    createUser: jest.fn(),
    updateUser: jest.fn(),
    deleteUser: jest.fn(),
  } as jest.Mocked<UserService>;
}

// Test with mocks
describe("UserController", () => {
  let userController: UserController;
  let mockUserService: jest.Mocked<UserService>;

  beforeEach(() => {
    mockUserService = createMockUserService();
    userController = new UserController(mockUserService);
  });

  it("should handle user creation", async () => {
    const userData = { name: "John", email: "john@example.com" };
    const createdUser = { id: 1, ...userData };

    mockUserService.createUser.mockResolvedValue(createdUser);

    const result = await userController.createUser(userData);

    expect(mockUserService.createUser).toHaveBeenCalledWith(userData);
    expect(result).toEqual(createdUser);
  });
});
```

### Performance

#### Type Optimization

Optimize types for better performance.

```typescript
// Use const assertions for better inference
const colors = ["red", "green", "blue"] as const;
type Color = (typeof colors)[number]; // 'red' | 'green' | 'blue'

// Use mapped types efficiently
type Optional<T, K extends keyof T> = Omit<T, K> & Partial<Pick<T, K>>;
type UserUpdate = Optional<User, "id">;

// Use branded types for performance
type UserId = number & { readonly __brand: "UserId" };
type ProductId = number & { readonly __brand: "ProductId" };

// Avoid complex conditional types in hot paths
type SimpleUser = {
  id: number;
  name: string;
  email: string;
};

// Use interfaces for object shapes
interface UserRepository {
  findById(id: UserId): Promise<User | null>;
  save(user: User): Promise<User>;
  delete(id: UserId): Promise<void>;
}
```

#### Memory Management

Optimize memory usage in TypeScript applications.

```typescript
// Use WeakMap for private data
const privateData = new WeakMap<User, { password: string }>();

class User {
  constructor(public id: number, public name: string, password: string) {
    privateData.set(this, { password });
  }

  getPassword(): string {
    return privateData.get(this)?.password || "";
  }
}

// Use WeakSet for tracking
const processedUsers = new WeakSet<User>();

function processUser(user: User): void {
  if (processedUsers.has(user)) {
    return;
  }

  // Process user
  processedUsers.add(user);
}

// Proper cleanup
class ResourceManager {
  private resources = new Set<{ dispose(): void }>();

  add<T extends { dispose(): void }>(resource: T): T {
    this.resources.add(resource);
    return resource;
  }

  dispose(): void {
    this.resources.forEach((resource) => resource.dispose());
    this.resources.clear();
  }
}
```

#### Bundle Optimization

Optimize TypeScript for smaller bundles.

```typescript
// Use tree-shaking friendly exports
export { UserService } from "./services/UserService";
export { EmailService } from "./services/EmailService";

// Avoid barrel exports in production
// Instead of: export * from './utils';
export { formatDate } from "./utils/date";
export { validateEmail } from "./utils/validation";

// Use dynamic imports for code splitting
async function loadUserModule() {
  const { UserService } = await import("./services/UserService");
  return new UserService();
}

// Use const enums for better performance
const enum UserRole {
  ADMIN = "admin",
  USER = "user",
  GUEST = "guest",
}
```

#### Documentation

Document TypeScript code effectively.

````typescript
/**
 * Represents a user in the system
 * @interface User
 */
interface User {
  /** Unique identifier for the user */
  id: number;
  /** User's full name */
  name: string;
  /** User's email address */
  email: string;
  /** User's role in the system */
  role: UserRole;
}

/**
 * User management service
 * @class UserService
 */
class UserService {
  /**
   * Creates a new user service instance
   * @param apiClient - API client for making HTTP requests
   */
  constructor(private apiClient: ApiClient) {}

  /**
   * Retrieves a user by their ID
   * @param id - The user ID
   * @returns Promise that resolves to the user data
   * @throws {ApiError} When user is not found
   * @example
   * ```typescript
   * const userService = new UserService(apiClient);
   * const user = await userService.getUser(123);
   * console.log(user.name);
   * ```
   */
  async getUser(id: number): Promise<User> {
    // Implementation
  }

  /**
   * Creates a new user
   * @param userData - Data for creating the user
   * @returns Promise that resolves to the created user
   * @throws {ValidationError} When user data is invalid
   * @throws {ApiError} When creation fails
   */
  async createUser(userData: CreateUserData): Promise<User> {
    // Implementation
  }
}
````
