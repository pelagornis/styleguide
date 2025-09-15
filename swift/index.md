---
layout: page
title: Swift Style Guide
icon: /assets/images/icons/swift.svg
---

## Table of Contents

- [Naming](#naming)
- [Swift Style Rules](#swift-style-rules)
- [Swift Formatting Rules](#swift-formatting-rules)
- [Modern Swift Features](#modern-swift-features)
- [SwiftUI Guidelines](#swiftui-guidelines)
- [Concurrency](#concurrency)
- [Error Handling](#error-handling)
- [Performance](#performance)
- [Accessibility](#accessibility)
- [Patterns](#patterns)

### Naming

#### Apple’s API Style Guidelines

Apple’s [official Swift naming and API design guidelines](https://www.swift.org/documentation/api-design-guidelines/) hosted on swift.org are considered part of this style guide and are followed as if they were repeated here in their entirety.

#### Identifiers

Typically, identifiers contain only 7-bit ASCII characters. Unicode identifiers have clear, legitimate meanings in the problem area of the code base (e.g., Greek characters representing mathematical concepts) and are acceptable if the team that owns the code understands them well.

```swift
/// Wrong
let 😎 = "😎"

/// Right
let nice = "😎"
```

#### Initializers

For clarity, the initializer argument that corresponds directly to the stored property has the same property and name. Use explicit `self.` to clearly distinguish between assignments.

```swift
/// Wrong
public struct Company {
    public let name: String
    public let location: String

    public init(name: String, location place: String) {
        name = name
        location = place
    }
}

/// Right
public struct Company {
    public let name: String
    public let location: String

    public init(name: String, location: String) {
        self.name = name
        self.location = location
    }
}
```

#### Static and Class Properties

Static and class properties that return instances of the declaring type are not suffixed with the name of the type.

```swift
/// Wrong
public class UIColor {
    public class var blackColor: UIColor {
        // ...
    }
}

/// Right
public class UIColor {
    public class var black: UIColor {
        // ...
    }
}
```

#### Global Constants

Like other variables, the global constant is `lowerCamelCase`.

```swift
/// Wrong
let VERSION = "1.0.0"

/// Right
let version = "1.0.0"
```

### Swift Style Rules

#### Access Control

Omit the internal keyword when defining types, properties, or functions with an internal access control level.

```swift
/// Wrong
internal  class Base {
    internal  init() {
        // ...
    }

    internal  func run() {
        // ...
    }
}

/// Right
class Base {
    init() {
        // ...
    }

    func run() {
        // ...
    }
}
```

#### Attribute Annotations

Place the properties of the function, type, and calculated properties on the line above the declaration.

```swift
/// Wrong
@objc func tapAction() {
    // ...
}
@discardableResult func run() {
    // ...
}

/// Right
@objc
func tapAction() {
    // ...
}

@discardableResult
func run() {
    // ...
}
```

#### Collection Types

Add a trailing comma on the last element of a multi-line array.

```swift
/// Wrong
let color: [Color] = [
    .black,
    .red,
    .blue
]

/// Right
let color: [Color] = [
    .black,
    .red,
    .blue,
]
```

There should be no spaces inside the backets of collection literals.

```swift
/// Wrong
let constraints = [ top, right, left, bottom ]

/// Right
let constraints = [top, right, left, bottom]
```

#### Types

Don't include easily deducible types.

```swift
/// Wrong
let status: Bool = true
let statusCode: String = 400

/// Right
let status = true
let statusCode = 400
```

Prefer letting the type of a variable or property be inferred from the right-hand-side value rather than writing the type explicitly on the left-hand side.

```swift
/// Wrong
struct Command {
    let bash: Alias = .init(executableURL: "/bin/bash", dashc: "-c")

    func run() {
        let command: Arguments = .init("ls")
        bash.run(command)
    }
}

/// Right
struct Command {
    let bash = Alias(executableURL: "/bin/bash", dashc: "-c")

    func run() {
        let command = Arguments("ls")
        bash.run(command)
    }
}
```

#### Self Keyword

Don't use `self` unless it's necessary for disambiguation.

```swift
/// Wrong
final class Server {
    private let statusCode: Int32
    private let result: Result
    private var serverRequestSuccess: Bool

    init(statusCode: Int32, result: Result) {
        self.statusCode = statusCode
        self.result = result
        self.serverRequestSuccess = !result.success.isEmpty
    }
}

/// Right
final class Server {
    private let statusCode: Int32
    private let result: Result
    private var serverRequestSuccess: Bool

    init(statusCode: Int32, result: Result) {
        self.statusCode = statusCode
        self.result = result
        serverRequestSuccess = !result.success.isEmpty
    }
}
```

Bind to `self` when upgrading from a weak reference.

```swift
/// Wrong
final class AClass {
    func run(completion: () -> Void) {
        Server.run() { [weak self] result in
            guard let strongSelf = self else { return }
            // ...
            completion()
        }
    }
}

/// Right
final class AClass {
    func run(completion: () -> Void) {
        Server.run() { [weak self] result in
            guard let self else { return }
            // ...
            completion()
        }
    }
}
```

#### Space

Colons should always be followed by a space. but not preceded by a space.

```swift
/// Wrong
let token : Token = "#sidi3wjdia2sdpwd1"

/// Right
let token: Token = "#sidi3wjdia2sdpwd1"
```

Place a space on either side of a return arrow for readability.

```swift
/// Wrong
func request()->Result {
    // ...
}

/// Right
func request() -> Result {
    // ...
}
```

#### Parentheses

Omit unnecessary parentheses.

```swift
/// Wrong
if (count > 0) { // ... }
let event = allEvents.map() { // ... }

/// Right
if count > 0 { // ... }
let event = allEvents.map { // ... }
```

#### Enum Type

Omit enum associated values from case statements when all arguments are unlabeled.

```swift
/// Wrong
if case .response(_) = Response { // ... }

switch result {
    case .success(_, _):
    // ...
}

/// Right
if case .response = Response { // ... }

switch result {
    case .success:
    // ...
}
```

When destructuring an enum case or a tuple, place the `let` keyword inline, adjacent to each individual property assignment.

```swift
/// Wrong
switch result {
case let .success(value):
  // ...
case let .error(statusCode, description):
  // ...
}

/// Right
switch result {
case .success(let value):
  // ...
case .error(let statusCode, let description):
  // ...
}
```

#### Declaration

Place simple attributes for stored properties on the same line as the rest of the declaration.
Complex attributes with named arguments, or more than one unnamed argument, should be placed on the previous line.

```swift
/// Wrong
struct BaseView: View {

    @StateObject
    var object = ObservableObject()

    @available(*, unavailable, message: "No longer in production") var oldView: some View {
        // ...
    }

}

/// Right
struct BaseView: View {

    @StateObject var object = ObservableObject()

    @available(*, unavailable, message: "No longer in production")
    var oldView: some View {
        // ...
    }

}
```

#### Empty Space

Include a single space in an empty set of braces(`{ }`).

```swift
/// Wrong
extension UIView: Buildable {}

/// Right
extension UIView: Buildable { }
```

#### Functions

Omit `Void` return types from function definitions.

```swift
/// Wrong
func run() -> Void {
    // ...
}
/// Right
func run() {
    // ...
}
```

Separate long function declarations with line breaks before each argument label, and before the return signature or any effects (`async`, `throws`).

```swift
class Company {
    /// Wrong
    func addMember(name: String, email: String, number: String) -> Member {
        // ...
    }

    /// Wrong
    func addMember(
        name: String,
        email: String,
        number: String)
    -> Member {
        // ...
    }

    /// Right
    func addMember(
        name: String,
        email: String,
        number: String
    )
    -> Member
    {
        // ...
    }
}
```

Long function invocations should also break on each argument.

```swift
/// Wrong
Company.addMember(name: "Zepa", email: "official@pelagornis.com", number: "010-1234-4567")

Company.addMember(
    name: "Zepa",
    email: "official@pelagornis.com",
    number: "010-1234-4567"
)

/// Right
Company.addMember(
    name: "Zepa",
    email: "official@pelagornis.com",
    number: "010-1234-4567")
```

Remove blank lines between chained functions.

```swift
/// Wrong
var item: [String] {
    datas
      .filter { $0.fetch() }

      .map { $0.id }
}

/// Right
var item: [String] {
    datas
      .filter { $0.fetch() }
      .map { $0.id }
}
```

#### Closure

Favor `Void` return types over () in closure declarations.

```swift
/// Wrong
func run(completion: () -> ()) {
    // ...
}

/// Right
func run(completion: () -> Void) {
    // ...
}
```

Name unused closure parameters as underscores(`_`).

```swift
/// Wrong
run() { environment, command in
    Task.run(command)
}

/// Right
run() { _, command in
    Task.run(command)
}
```

Omit `Void` return types from closure expressions.

```swift
run() { command -> Void in
    // ...
}

/// Right
run() { command in
    // ...
}
```

Prefer trailing closure syntax for closure arguments with no parameter name.

```swift
// WRONG
member.map({ $0.id })

// RIGHT
member.map { $0.id }
```

### Swift Formatting Rules

#### Indentation

Indent by 2 spaces at a time.

When writing a colon (`:`), leave spaces only on the right side of the colon.

```swift
/// Wrong
let item:[Int:String]?

/// Right
let item: [Int: String]?
```

#### Maximum line length

Each line should have a maximum column width of 100 characters.

- Xcode's `Prefeneces` -> `Text Editing` -> `Display` and set it to 100 characters.

#### Empty line

Make sure there are no spaces in the blank line, and all files must end in blank lines.
The MARK syntax requires spaces below.

```swift
/// Wrong
// MARK: Property
let name: String = ""

/// Right
// MARK: Property

let name: String = ""

```

#### Semicolons

Semicolons (;) are not used, either to terminate or separate statements.

```swift
/// Wrong
func run() {
    let company = "Pelagornis";
    print("Hello \(company)");
}

/// Right
func run() {
    let company = "Pelagornis";
    print("Hello \(company)")
}
```

#### Import

The module import is sorted alphabetically, import the built-in framework first, separated by blank lines, and import the third-party framework.

```swift
import UIKit

import Builder
import Snapkit
```

#### Comment

Use `///` to leave comments used for documentation.

```swift
/// Banner image exposed at the top of the main screen
final class BannerView: UIView {

  /// Image to float banner image View
    var bannerImageView: ImageView!
}
```

Use `// MARK:` to separate codes by type.

```swift
// MARK: Properties

let nameLabel: UILabel!
let dismissButton: UIButton!

// MARK: Initalizer

override init(frame: CGRect) {
  // ...
}

// MARK: Actions

override func dismissButtonDidTap() {
  // ...
}
```

### Modern Swift Features

#### Result Builders

Use result builders for declarative APIs and DSLs.

```swift
/// Wrong
let view = VStack {
    Text("Hello")
    Text("World")
}

/// Right
@ViewBuilder
var content: some View {
    Text("Hello")
    Text("World")
}
```

#### Property Wrappers

Use property wrappers to encapsulate common patterns and reduce boilerplate.

```swift
/// Wrong
class ViewModel: ObservableObject {
    private var _isLoading = false
    var isLoading: Bool {
        get { _isLoading }
        set {
            _isLoading = newValue
            objectWillChange.send()
        }
    }
}

/// Right
class ViewModel: ObservableObject {
    @Published var isLoading = false
}
```

#### Opaque Types

Use opaque return types (`some`) for better API design and performance.

```swift
/// Wrong
func createView() -> AnyView {
    AnyView(Text("Hello"))
}

/// Right
func createView() -> some View {
    Text("Hello")
}
```

#### Key Paths

Use key paths for type-safe property references.

```swift
/// Wrong
let names = people.map { $0.name }

/// Right
let names = people.map(\.name)
```

#### Dynamic Member Lookup

Use `@dynamicMemberLookup` sparingly and only when it significantly improves API ergonomics.

```swift
/// Wrong
@dynamicMemberLookup
struct Config {
    subscript(dynamicMember key: String) -> String? {
        return nil
    }
}

/// Right
@dynamicMemberLookup
struct Config {
    private let values: [String: String]

    subscript(dynamicMember key: String) -> String? {
        return values[key]
    }
}
```

### SwiftUI Guidelines

#### View Composition

Break down complex views into smaller, focused components.

```swift
/// Wrong
struct ContentView: View {
    var body: some View {
        VStack {
            // 100+ lines of view code
        }
    }
}

/// Right
struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            ContentSection()
            FooterView()
        }
    }
}
```

#### State Management

Use appropriate state management patterns for different data types.

```swift
/// Wrong
struct ContentView: View {
    @State private var user: User?
    @State private var isLoading = false
    @State private var error: Error?
}

/// Right
struct ContentView: View {
    @StateObject private var viewModel = UserViewModel()
}
```

#### View Modifiers

Create custom view modifiers for reusable styling.

```swift
/// Wrong
struct ContentView: View {
    var body: some View {
        Text("Hello")
            .font(.title)
            .foregroundColor(.blue)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}

/// Right
struct ContentView: View {
    var body: some View {
        Text("Hello")
            .cardStyle()
    }
}

extension View {
    func cardStyle() -> some View {
        self
            .font(.title)
            .foregroundColor(.blue)
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}
```

#### Environment Values

Use environment values for dependency injection.

```swift
/// Wrong
struct ContentView: View {
    let networkService: NetworkService

    var body: some View {
        // ...
    }
}

/// Right
struct ContentView: View {
    @Environment(\.networkService) private var networkService

    var body: some View {
        // ...
    }
}
```

### Concurrency

#### Async/Await

Prefer async/await over completion handlers for asynchronous operations.

```swift
/// Wrong
func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
        } else if let data = data {
            completion(.success(data))
        }
    }.resume()
}

/// Right
func fetchData() async throws -> Data {
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
}
```

#### Actors

Use actors for thread-safe data access.

```swift
/// Wrong
class Counter {
    private var count = 0
    private let queue = DispatchQueue(label: "counter.queue")

    func increment() {
        queue.async {
            self.count += 1
        }
    }
}

/// Right
actor Counter {
    private var count = 0

    func increment() {
        count += 1
    }

    func getCount() -> Int {
        return count
    }
}
```

#### Task Groups

Use task groups for concurrent operations.

```swift
/// Wrong
func fetchAllData() async throws -> [Data] {
    let data1 = try await fetchData1()
    let data2 = try await fetchData2()
    let data3 = try await fetchData3()
    return [data1, data2, data3]
}

/// Right
func fetchAllData() async throws -> [Data] {
    try await withThrowingTaskGroup(of: Data.self) { group in
        group.addTask { try await fetchData1() }
        group.addTask { try await fetchData2() }
        group.addTask { try await fetchData3() }

        var results: [Data] = []
        for try await data in group {
            results.append(data)
        }
        return results
    }
}
```

#### MainActor

Use `@MainActor` for UI-related code.

```swift
/// Wrong
class ViewModel: ObservableObject {
    @Published var data: [Item] = []

    func loadData() {
        Task {
            let items = try await fetchItems()
            DispatchQueue.main.async {
                self.data = items
            }
        }
    }
}

/// Right
@MainActor
class ViewModel: ObservableObject {
    @Published var data: [Item] = []

    func loadData() {
        Task {
            let items = try await fetchItems()
            self.data = items
        }
    }
}
```

### Error Handling

#### Structured Error Types

Define specific error types for better error handling.

```swift
/// Wrong
enum NetworkError: Error {
    case error
}

/// Right
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingFailed(Error)
    case serverError(Int)

    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .decodingFailed(let error):
            return "Decoding failed: \(error.localizedDescription)"
        case .serverError(let code):
            return "Server error: \(code)"
        }
    }
}
```

#### Result Type

Use Result type for operations that can fail.

```swift
/// Wrong
func fetchUser(id: String, completion: @escaping (User?, Error?) -> Void) {
    // ...
}

/// Right
func fetchUser(id: String) async -> Result<User, NetworkError> {
    do {
        let user = try await networkService.fetchUser(id: id)
        return .success(user)
    } catch {
        return .failure(.decodingFailed(error))
    }
}
```

### Performance

#### Lazy Properties

Use lazy properties for expensive computations.

```swift
/// Wrong
class DataProcessor {
    let processedData = expensiveComputation()
}

/// Right
class DataProcessor {
    lazy var processedData = expensiveComputation()
}
```

#### Value Types

Prefer value types (structs, enums) over reference types when possible.

```swift
/// Wrong
class Point {
    var x: Double
    var y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

/// Right
struct Point {
    let x: Double
    let y: Double
}
```

#### Collection Performance

Use appropriate collection types for performance.

```swift
/// Wrong
var items: [String] = []
for i in 0..<1000 {
    items.append("Item \(i)")
}

/// Right
let items = (0..<1000).map { "Item \($0)" }
```

### Accessibility

#### Accessibility Labels

Provide meaningful accessibility labels for UI elements.

```swift
/// Wrong
Button("X") {
    dismiss()
}

/// Right
Button("Close") {
    dismiss()
}
.accessibilityLabel("Close dialog")
```

#### Accessibility Traits

Use appropriate accessibility traits.

```swift
/// Wrong
Text("Play")
    .onTapGesture {
        playMusic()
    }

/// Right
Text("Play")
    .onTapGesture {
        playMusic()
    }
    .accessibilityAddTraits(.isButton)
```

#### Dynamic Type

Support Dynamic Type for better accessibility.

```swift
/// Wrong
Text("Hello")
    .font(.system(size: 16))

/// Right
Text("Hello")
    .font(.body)
```

### Patterns

#### Unwrapping

Prefer to initialize properties at init time, if possible, without using the force unwrapping option.

```swift
/// Wrong
final class Company: NSObject {

    var name: String!

    init() {
        super.init()
        name = "Pelagornis"
    }
}

/// Right
final class Company: NSObject {

    var name: String

    init() {
        name = ""
        super.init()
    }
}
```

#### Dependency Injection

Use dependency injection for better testability and modularity.

```swift
/// Wrong
class UserService {
    private let networkService = NetworkService()

    func fetchUser() async throws -> User {
        return try await networkService.fetchUser()
    }
}

/// Right
class UserService {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchUser() async throws -> User {
        return try await networkService.fetchUser()
    }
}
```

#### Protocol-Oriented Programming

Use protocols to define contracts and enable better testability.

```swift
/// Wrong
class DataManager {
    func save(_ data: Data) {
        // Direct file system access
    }
}

/// Right
protocol DataStorable {
    func save(_ data: Data) throws
}

class FileDataManager: DataStorable {
    func save(_ data: Data) throws {
        // File system implementation
    }
}

class DatabaseDataManager: DataStorable {
    func save(_ data: Data) throws {
        // Database implementation
    }
}
```

#### Optional Binding

`guard else` is written on the same line if it does not impair readability or does not exceed 100 lines.

And Prefer to use `guard` statements rather than `if` statements to minimize overlap.

#### Defer

Consider using `defer block` if you need a cleanup code at multiple end points.

#### Blank

Only one blank line is allowed

```swift
/// Wrong
func run() {
    let name = ""


    print(name)
}

/// Right
func run() {
    let name = ""

    print(name)
}
```

#### Spacing

Give a space around the curly brackets.

```swift
/// Wrong
value.filter{true}.map{$0}

/// Right
value.filter { true }.map { $0 }

```

#### Access Modifier

Access control should be as strict as possible, preferring `public` to `open` and `private` to `fileprivate` unless that level is required.

#### Global Function

It prefers to define methods in the type definition section, and does not define possible global functions

```swift
/// Wrong
func age(_ person: Person) {
    // ...
}

/// Right
struct Person {
    var age: Int {
        // ...
    }
}
```

#### Property

Extract complex property observers into methods. The purpose is to reduce overlap, to separate side effects from attribute declarations, and to make the use of implicitly forwarded parameters explicitly `oldValue`.

```swift
/// WRONG
public class TextField {
  public var text: String? {
    didSet {
      guard oldValue != text else {
        return
      }
    }
  }
}

/// RIGHT
public class TextField {
  public var text: String? {
    didSet { textDidUpdate(from: oldValue) }
  }

  private func textDidUpdate(from oldValue: String?) {
    guard oldValue != text else {
      return
    }
  }
}
```

#### Static Type

If a method needs to be redefined, the default type method should be `static` because the author must choose a `static` type instead of using the `class` keyword.

```swift
/// Wrong
class Company {
    class func checkStaff(_ member: Member, time: Date) {
        // ...
    }
}

/// Right
class Company {
    static func checkStaff(_ member: Member, _ time: Date) {
        // ...
    }
}
```

#### Final Keyword

If inheritance is unnecessary, add the `final` keyword to the default class.

```swift
/// Wrong
class Repository {
    // ...
}

/// Right
final class Repository {
    // ...
}
```

#### Immutable or Computed Static Properties

Prefer immutable or computed `static` properties over mutable ones whenever possible. Use stored `static let` properties or computed `static var` properties over stored `static var` properties whenever possible, as stored `static var` properties are global mutable state.

```swift
/// Wrong
enum Color {
    static var red = DynamicColor(...)
}

/// Right
enum Color {
    static let red = DynamicColor(...)
}
```

```swift
/// Wrong
struct Timmer {
    var count: Int

    static var start = Timmer(count: 0)
}

/// Right
struct Timmer {
    var count: Int

    static var start: Timer {
        Timmer(count: 0)
    }
}
```

#### Enum Type

Preferred to list all cases for accuracy consideration rather than using `default` cases when switching enumeration types.

```swift
/// Not Preferred
enum Color {
    case red
    case green
    case blue

    var rawValue: String {
        switch self {
            case .red:
            return "Red"
            case .green:
            return "Green"
            case .blue:
            return "Blue"
            default:
            return "Not provided Color"
        }
    }
}

/// Preferred
enum Color {
    case red
    case green
    case blue

    var rawValue: String {
        switch self {
            case .red:
            return "Red"
            case .green:
            return "Green"
            case .blue:
            return "Blue"
        }
    }
}
```

#### Return Keyword

Omit the unnecessary `return` keyword.

```swift
/// Wrong
var size: CGSize {
    return CGSize(
        width: 100.0,
        height: 100.0
    )
}

/// Right
var size: CGSize {
    CGSize(
        width: 100.0,
        height: 100.0
    )
}
```

#### AnyObject Type

Use `AnyObject` instead of `class` in protocol definitions.

```swift
// WRONG
protocol Request: class {
    // ...
}

// RIGHT
protocol Request: AnyObject {
    // ...
}
```

#### Extension

Extension specifies access control for each declaration individually.

```swift
/// Wrong
public extension Company {
    func addStaff(_ member: Member) {
        // ...
    }
}

/// Right
extension Company {
    public func addStaff(_ member: Member) {
        // ...
    }
}
```

#### Logging

Prefer dedicated logging systems like `os_log` or `swift-log` over writing directly to standard out using `print(…)`, `debugPrint(…)`, or `dump(…)`.

```swift
/// Wrong
print("User logged in: \(user.id)")
debugPrint("Network request failed: \(error)")

/// Right
import os.log

private let logger = Logger(subsystem: "com.app.myapp", category: "authentication")

logger.info("User logged in: \(user.id)")
logger.error("Network request failed: \(error.localizedDescription)")
```

#### Equatable Type

Prefer using the generated `Equatable` implementation when comparing properties of all types.

#### Void Type

Avoid using `()` as a type and prefer to use `Void`.

```swift
/// Wrong
let response: (Response<(), Error>) -> ()

/// Right
let response: (Response<Void, Error>) -> Void
```

Avoid using `Void()` and prefer to use `()`

```swift
let response: (Response<Void, Error>) -> Void

/// Wrong
response(.success(Void()))

/// Right
response(.success(()))
```
