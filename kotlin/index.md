---
layout: page
title: Kotlin Style Guide
icon: /assets/images/icons/kotlin.svg
---

## Table of Contents

- [Naming](#naming)
- [Kotlin Style Rules](#kotlin-style-rules)
- [Kotlin Formatting Rules](#kotlin-formatting-rules)
- [Modern Kotlin Features](#modern-kotlin-features)
- [Coroutines](#coroutines)
- [Functional Programming](#functional-programming)
- [Kotlin Multiplatform](#kotlin-multiplatform)
- [Testing](#testing)
- [Performance](#performance)

### Naming

#### Class names

Use PascalCase, which starts with an uppercase letter.

```kotlin
class CarModel(val modelName: String)
class UserProfile(val userId: Int, val userName: String)
class PaymentService(val paymentGateway: String)
```

#### Interface names

Use the same convention as classes. Avoid the `I` prefix unless it's necessary for clarity or common in your codebase.

```kotlin
// Preferred
interface Storage {
    fun store(data: String)
    fun retrieve(): String
}

interface Repository<T> {
    fun getById(id: Int): T
    fun save(item: T)
}

// Only when necessary for clarity
interface IUserService {
    fun getUser(id: Int): User
}
```

#### Abstract class names

Follow the same conventions as class names, often using terms like `Base` or `Abstract` to indicate abstraction.

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

#### Control Statements

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

### Modern Kotlin Features

#### Sealed Classes

Use sealed classes for representing restricted class hierarchies.

```kotlin
sealed class Result<out T> {
    data class Success<T>(val data: T) : Result<T>()
    data class Error(val exception: Throwable) : Result<Nothing>()
    object Loading : Result<Nothing>()
}

// Usage
when (val result = fetchData()) {
    is Result.Success -> handleSuccess(result.data)
    is Result.Error -> handleError(result.exception)
    is Result.Loading -> showLoading()
}
```

#### Inline Classes

Use inline classes for type-safe wrappers around primitive types.

```kotlin
@JvmInline
value class UserId(val value: Int)

@JvmInline
value class Email(val value: String)

fun sendEmail(userId: UserId, email: Email) {
    // Type-safe parameters
}
```

#### Extension Properties

Use extension properties for computed values.

```kotlin
val String.isValidEmail: Boolean
    get() = this.contains("@") && this.contains(".")

val List<Int>.average: Double
    get() = if (isEmpty()) 0.0 else sum().toDouble() / size
```

#### Destructuring Declarations

Use destructuring for data classes and collections.

```kotlin
data class Point(val x: Int, val y: Int)

val point = Point(10, 20)
val (x, y) = point

// With maps
val map = mapOf("name" to "John", "age" to 30)
for ((key, value) in map) {
    println("$key: $value")
}
```

#### Smart Casts

Leverage Kotlin's smart casting for type safety.

```kotlin
fun processValue(value: Any) {
    when (value) {
        is String -> {
            // value is automatically cast to String here
            println(value.length)
        }
        is Int -> {
            // value is automatically cast to Int here
            println(value * 2)
        }
    }
}
```

### Coroutines

#### Basic Coroutine Usage

Use coroutines for asynchronous programming.

```kotlin
import kotlinx.coroutines.*

// Suspend functions
suspend fun fetchUserData(userId: Int): User {
    delay(1000) // Simulate network call
    return User(id = userId, name = "User $userId")
}

// Coroutine scope
fun loadUserData() {
    CoroutineScope(Dispatchers.Main).launch {
        try {
            val user = fetchUserData(123)
            updateUI(user)
        } catch (e: Exception) {
            handleError(e)
        }
    }
}
```

#### Structured Concurrency

Use structured concurrency with coroutine scopes.

```kotlin
class UserRepository {
    private val scope = CoroutineScope(Dispatchers.IO + SupervisorJob())

    suspend fun fetchUsers(): List<User> = withContext(Dispatchers.IO) {
        // Network call
        apiService.getUsers()
    }

    fun cleanup() {
        scope.cancel()
    }
}
```

#### Flow for Reactive Programming

Use Flow for reactive streams.

```kotlin
fun observeUserUpdates(): Flow<User> = flow {
    while (true) {
        val user = fetchLatestUser()
        emit(user)
        delay(5000)
    }
}.flowOn(Dispatchers.IO)

// Usage
viewModelScope.launch {
    observeUserUpdates()
        .catch { e -> handleError(e) }
        .collect { user -> updateUI(user) }
}
```

#### Channel Communication

Use channels for communication between coroutines.

```kotlin
class DataProcessor {
    private val dataChannel = Channel<Data>(Channel.UNLIMITED)

    fun startProcessing() {
        CoroutineScope(Dispatchers.Default).launch {
            for (data in dataChannel) {
                processData(data)
            }
        }
    }

    suspend fun sendData(data: Data) {
        dataChannel.send(data)
    }
}
```

### Functional Programming

#### Higher-Order Functions

Use higher-order functions for reusable logic.

```kotlin
fun <T> List<T>.filterAndTransform(
    predicate: (T) -> Boolean,
    transform: (T) -> String
): List<String> = filter(predicate).map(transform)

// Usage
val result = users.filterAndTransform(
    predicate = { it.isActive },
    transform = { "${it.name} (${it.email})" }
)
```

#### Function Composition

Compose functions for complex operations.

```kotlin
fun <A, B, C> ((A) -> B).andThen(f: (B) -> C): (A) -> C = { a -> f(this(a)) }

val processUser = ::validateUser
    .andThen(::saveUser)
    .andThen(::sendWelcomeEmail)

// Usage
val result = processUser(userData)
```

#### Immutable Data Structures

Prefer immutable data structures.

```kotlin
// Use immutable collections
val users: List<User> = listOf(user1, user2, user3)
val userMap: Map<String, User> = mapOf(
    "john" to user1,
    "jane" to user2
)

// Create new instances instead of mutating
val updatedUsers = users + newUser
val updatedMap = userMap + ("bob" to newUser)
```

#### Lambda Expressions

Use lambda expressions effectively.

```kotlin
// Simple lambdas
val numbers = listOf(1, 2, 3, 4, 5)
val evenNumbers = numbers.filter { it % 2 == 0 }
val doubled = numbers.map { it * 2 }

// Complex lambdas with multiple statements
val processedData = data.map { item ->
    val processed = processItem(item)
    val validated = validateItem(processed)
    validated
}
```

### Kotlin Multiplatform

#### Common Code Structure

Organize common code for multiplatform projects.

```kotlin
// commonMain/kotlin/expect.kt
expect class Platform() {
    val name: String
}

expect fun getCurrentTime(): Long

// commonMain/kotlin/actual.kt
expect class Platform() {
    val name: String
}

// androidMain/kotlin/actual.kt
actual class Platform actual constructor() {
    actual val name: String = "Android ${android.os.Build.VERSION.SDK_INT}"
}

actual fun getCurrentTime(): Long = System.currentTimeMillis()

// iosMain/kotlin/actual.kt
actual class Platform actual constructor() {
    actual val name: String = UIDevice.currentDevice.systemName() + " " + UIDevice.currentDevice.systemVersion
}

actual fun getCurrentTime(): Long = NSDate().timeIntervalSince1970.toLong()
```

#### Shared Business Logic

Share business logic across platforms.

```kotlin
// commonMain/kotlin/UserRepository.kt
class UserRepository(private val api: ApiService) {
    suspend fun getUser(id: Int): Result<User> = try {
        val user = api.fetchUser(id)
        Result.success(user)
    } catch (e: Exception) {
        Result.failure(e)
    }

    suspend fun saveUser(user: User): Result<Unit> = try {
        api.saveUser(user)
        Result.success(Unit)
    } catch (e: Exception) {
        Result.failure(e)
    }
}
```

### Testing

#### Unit Testing

Write comprehensive unit tests.

```kotlin
class UserServiceTest {
    private lateinit var userService: UserService
    private lateinit var mockRepository: UserRepository

    @BeforeEach
    fun setup() {
        mockRepository = mockk()
        userService = UserService(mockRepository)
    }

    @Test
    fun `should return user when valid id provided`() = runTest {
        // Given
        val userId = 123
        val expectedUser = User(id = userId, name = "John")
        coEvery { mockRepository.findById(userId) } returns expectedUser

        // When
        val result = userService.getUser(userId)

        // Then
        assertEquals(expectedUser, result)
        coVerify { mockRepository.findById(userId) }
    }
}
```

#### Coroutine Testing

Test coroutine-based code properly.

```kotlin
class DataProcessorTest {
    @Test
    fun `should process data asynchronously`() = runTest {
        // Given
        val processor = DataProcessor()
        val testData = listOf(Data(1), Data(2), Data(3))

        // When
        val result = processor.processDataAsync(testData)

        // Then
        assertEquals(3, result.size)
        assertTrue(result.all { it.isProcessed })
    }
}
```

### Performance

#### Lazy Initialization

Use lazy initialization for expensive operations.

```kotlin
class ExpensiveService {
    private val heavyComputation by lazy {
        // Expensive computation
        computeHeavyData()
    }

    fun getData() = heavyComputation
}
```

#### Collection Operations

Use appropriate collection operations for performance.

```kotlin
// Use sequences for chained operations
val result = largeList
    .asSequence()
    .filter { it.isValid }
    .map { it.transform() }
    .take(100)
    .toList()

// Use appropriate collection types
val userMap = users.associateBy { it.id } // O(1) lookup
val userGroups = users.groupBy { it.department }
```

#### Memory Management

Be mindful of memory usage.

```kotlin
// Use weak references when appropriate
class Cache<T> {
    private val cache = mutableMapOf<String, WeakReference<T>>()

    fun get(key: String): T? = cache[key]?.get()

    fun put(key: String, value: T) {
        cache[key] = WeakReference(value)
    }
}
```
