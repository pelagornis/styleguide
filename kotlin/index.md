---
layout: page
title: Kotlin Style Guide
icon: /assets/images/icons/kotlin.svg
---

## Table of Contents
-[Naming](#naming)
-[Kotlin Style Rules](#kotlin-style-rules)
-[Kotlin Formatting Rules](#kotlin-formatting-rules)

### Naming

#### Classes and Interfaces

- **Class names**: Use PascalCase, which starts with an uppercase letter.

```kotlin
class CarModel(val modelName: String)
class UserProfile(val userId: Int, val userName: String)
class PaymentService(val paymentGateway: String)
```

- **Interface names**: Use the same convention as classes, but prefix with `I` only if it is common in your codebase or necessary for clarity.

```kotlin
interface IStorage {
    fun store(data: String)
    fun retrieve(): String
}

interface IRepository<T> {
    fun getById(id: Int): T
    fun save(item: T)
}
```

- **Abstract class names**: Follow the same conventions as class names, often using terms like `Base` or `Abstract` to indicate abstraction.

```kotlin
abstract class AbstractShape {
    abstract fun calculateArea(): Double
}

abstract class BaseRepository<T> {
    abstract fun findById(id: Int): T?
}
```

#### Functions and Methods
**Function names**: Use camelCase, starting with a lowercase letter.

```kotlin
fun fetchUserData(userId: Int): User {
    // fetch user logic
}
```

**Extension functions**: Also use camelCase, and the function name should make sense in the context of the extended class.

```kotlin
fun String.isEmailValid(): Boolean {
    return this.contains('@') && this.contains('.')
}

fun Int.isOdd(): Boolean {
    return this % 2 != 0
}
```

#### Variables
**Variable names**: Use camelCase for variables.

```kotlin
val companyName = "pelagornis"
val totalCount = 100
```

**Constants**: Use uppercase with underscores.

```kotlin
const val API_KEY = "qwodciabs1"
const val BASE_URL = "https://api.pelagornis.com"
```

#### Parameters
**Function parameters**: Use descriptive names in camelCase.

```kotlin
fun setUserName(userName: String) {
    println("User name set to: $userName")
}
```
**Boolean parameters**: Use “is” or “has” for booleans to indicate state or possession.

```kotlin
fun isActive(user: User): Boolean {
    return user.status == "active"
}
```

### Kotlin Style Rules

#### No trailing spaces
Remove unnecessary trailing spaces from the end of lines.

#### Line Length
Limit lines to **120 characters** for readability.

##### Indentation
Use 4 spaces per indentation level. Avoid using tabs.

#### Curly braces
Always use braces for conditionals and loops, even when the block is a single statement.
    
```kotlin
if (condition) {
    doSomething()
}
```

#### Avoid nested lambdas
If a lambda expression is too nested, consider refactoring the code to improve readability.

```kotlin
// Instead of
list.filter { item ->
    anotherList.any { it == item }
}
// Use a helper function
fun isItemInList(item: Item) = anotherList.contains(item)
someList.filter(::isItemInList)
```

#### Visibility Modifiers
Use explicit visibility modifiers. Avoid using default visibility unless it’s necessary.

```kotlin
private val userName: String
```

#### Type Inference and Explicit Types
Prefer Kotlin's type inference whenever possible, but provide explicit types when they improve readability or when dealing with complex types.

```kotlin
val totalAmount = 100.0 // inferred as Double
val user: User = fetchUser() // explicit type when needed
```


### Kotlin Formatting Rules

#### Function declarations
Always use spaces between function parameters for better readability.

```kotlin
fun calculatePrice(item: Item, discount: Double): Double {
    return item.price - (item.price * discount)
}
```

#### No spaces before function parentheses

```kotlin
// Wrong
fun exampleFunction () {
    // ...
}

// Right
fun exampleFunction() {
    // ...
}
```

#### Single-line lambdas
If the lambda is a single line, keep it on the same line.

```kotlin
val list = listOf(1, 2, 3)
val doubled = list.map { it * 2 }
```

#### Multi-line lambdas
Use braces and align the body properly.

```kotlin
val list = listOf(1, 2, 3)
val result = list.map { 
    val newValue = it * 2
    newValue + 1 
}
```

### Control Statements
- **Avoid single-expression functions** if it harms readability. If the body contains complex logic, break it into multiple lines or use a helper function.

```kotlin
fun isEven(number: Int): Boolean {
    return number % 2 == 0
}
```

#### Data classes
Use `data` keyword for classes that are used as plain data holders and contain no behavior other than storing data.

```kotlin
data class User(val name: String, val age: Int)
```
