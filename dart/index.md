---
layout: page
title: Dart Style Guide
icon: /assets/images/icons/dart.svg
---

## Table of Contents

- [Naming](#naming)
- [Dart Style Rules](#dart-style-rules)
- [Dart Formatting Rules](#dart-formatting-rules)
- [Modern Dart Features](#modern-dart-features)
- [Asynchronous Programming](#asynchronous-programming)
- [Flutter Guidelines](#flutter-guidelines)
- [Testing](#testing)
- [Performance](#performance)

### Naming

#### Class names

Use PascalCase, which starts with an uppercase letter.

```dart
class CarModel {
  final String modelName;
  CarModel(this.modelName);
}

class UserProfile {
  final int userId;
  final String userName;
  UserProfile(this.userId, this.userName);
}

class PaymentService {
  final String paymentGateway;
  PaymentService(this.paymentGateway);
}
```

#### Interface names

Use the same convention as classes. Avoid the `I` prefix unless it's necessary for clarity or common in your codebase.

```dart
// Preferred
abstract class Storage {
  Future<void> store(String data);
  Future<String> retrieve();
}

abstract class Repository<T> {
  Future<T?> getById(int id);
  Future<void> save(T item);
}

// Only when necessary for clarity
abstract class IUserService {
  Future<User> getUser(int id);
}
```

#### Abstract class names

Follow the same conventions as class names, often using terms like `Base` or `Abstract` to indicate abstraction.

```dart
abstract class AbstractShape {
  double calculateArea();
}

abstract class BaseRepository<T> {
  Future<T?> findById(int id);
}
```

#### Functions and Methods

**Function names**: Use camelCase, starting with a lowercase letter.

```dart
Future<User> fetchUserData(int userId) async {
  // fetch user logic
}

String formatUserName(String name) {
  return name.trim().toLowerCase();
}
```

**Extension methods**: Also use camelCase, and the method name should make sense in the context of the extended class.

```dart
extension StringExtensions on String {
  bool get isEmailValid {
    return contains('@') && contains('.');
  }
}

extension IntExtensions on int {
  bool get isOdd => this % 2 != 0;
}
```

#### Variables

**Variable names**: Use camelCase for variables.

```dart
final String companyName = 'pelagornis';
final int totalCount = 100;
var currentUser = User();
```

**Constants**: Use camelCase for const variables, UPPER_CASE for compile-time constants.

```dart
// Compile-time constants
const String API_KEY = 'qwodciabs1';
const String BASE_URL = 'https://api.pelagornis.com';

// Runtime constants
final String databaseUrl = 'postgresql://localhost:5432/mydb';
```

#### Parameters

**Function parameters**: Use descriptive names in camelCase.

```dart
void setUserName(String userName) {
  print('User name set to: $userName');
}

Future<void> updateUserProfile({
  required int userId,
  String? name,
  String? email,
}) async {
  // Update logic
}
```

**Boolean parameters**: Use "is" or "has" for booleans to indicate state or possession.

```dart
bool isActive(User user) {
  return user.status == 'active';
}

Future<void> processData({
  required List<Data> data,
  bool isAsync = true,
  bool hasValidation = false,
}) async {
  // Processing logic
}
```

### Dart Style Rules

#### No trailing spaces

Remove unnecessary trailing spaces from the end of lines.

#### Line Length

Limit lines to **120 characters** for readability.

#### Indentation

Use 2 spaces per indentation level. Avoid using tabs.

#### Curly braces

Always use braces for conditionals and loops, even when the block is a single statement.

```dart
if (condition) {
  doSomething();
}

for (var item in items) {
  processItem(item);
}
```

#### Avoid nested lambdas

If a lambda expression is too nested, consider refactoring the code to improve readability.

```dart
// Instead of
final result = list.where((item) {
  return anotherList.any((otherItem) => otherItem == item);
});

// Use a helper function
bool isItemInList(Item item) => anotherList.contains(item);
final result = someList.where(isItemInList);
```

#### Visibility Modifiers

Use explicit visibility modifiers. Prefer `private` over default visibility.

```dart
class UserService {
  final String _apiKey;
  final ApiClient _client;

  UserService(this._apiKey) : _client = ApiClient(_apiKey);

  Future<User> _fetchUser(int id) async {
    // Private method
  }
}
```

#### Type Inference and Explicit Types

Prefer Dart's type inference whenever possible, but provide explicit types when they improve readability or when dealing with complex types.

```dart
final totalAmount = 100.0; // inferred as double
final User user = fetchUser(); // explicit type when needed
final List<Map<String, dynamic>> complexData = fetchComplexData();
```

### Dart Formatting Rules

#### Function declarations

Always use spaces between function parameters for better readability.

```dart
double calculatePrice(Item item, double discount) {
  return item.price - (item.price * discount);
}

Future<void> processUserData({
  required int userId,
  String? name,
  String? email,
  bool isActive = true,
}) async {
  // Function body
}
```

#### Single-line functions

If the function is a single expression, use arrow syntax.

```dart
bool isEven(int number) => number % 2 == 0;

String formatName(String name) => name.trim().toLowerCase();

Future<String> fetchData() async => await api.getData();
```

#### Multi-line functions

Use braces and align the body properly.

```dart
Future<List<User>> fetchUsers() async {
  final response = await api.getUsers();
  final users = response.map((json) => User.fromJson(json)).toList();
  return users;
}
```

#### Control Statements

Use proper formatting for control statements.

```dart
// if-else statements
if (user.isActive) {
  await processActiveUser(user);
} else if (user.isPending) {
  await processPendingUser(user);
} else {
  await processInactiveUser(user);
}

// switch statements
switch (user.status) {
  case UserStatus.active:
    return 'Active';
  case UserStatus.pending:
    return 'Pending';
  case UserStatus.inactive:
    return 'Inactive';
  default:
    return 'Unknown';
}
```

#### Data classes

Use classes with proper constructors for data holders.

```dart
class User {
  final int id;
  final String name;
  final String email;
  final bool isActive;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.isActive = true,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          isActive == other.isActive;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      isActive.hashCode;
}
```

### Modern Dart Features

#### Sealed Classes

Use sealed classes for representing restricted class hierarchies.

```dart
sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;
  Success(this.data);
}

class Error<T> extends Result<T> {
  final Exception exception;
  Error(this.exception);
}

class Loading<T> extends Result<T> {}

// Usage
void handleResult(Result<User> result) {
  switch (result) {
    case Success<User>():
      handleSuccess(result.data);
    case Error<User>():
      handleError(result.exception);
    case Loading<User>():
      showLoading();
  }
}
```

#### Records

Use records for lightweight data structures.

```dart
// Simple records
(String, int) getUserInfo() => ('John', 25);
var (name, age) = getUserInfo();

// Named records
({String name, int age}) getUserInfoNamed() => (name: 'John', age: 25);
var userInfo = getUserInfoNamed();
print('${userInfo.name} is ${userInfo.age} years old');

// Records in collections
List<({String name, int age})> users = [
  (name: 'John', age: 25),
  (name: 'Jane', age: 30),
];
```

#### Pattern Matching

Use pattern matching for complex data handling.

```dart
// Switch expressions with patterns
String describeUser(User user) => switch (user) {
  User(id: 0, name: 'admin') => 'Administrator',
  User(isActive: true) => 'Active user: ${user.name}',
  User(isActive: false) => 'Inactive user: ${user.name}',
  _ => 'Unknown user',
};

// Pattern matching in if statements
if (user case User(id: var id, isActive: true) when id > 0) {
  print('Active user with ID: $id');
}
```

#### Extension Methods

Use extension methods to add functionality to existing classes.

```dart
extension StringExtensions on String {
  bool get isEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  String get capitalize => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';

  String removeWhitespace() => replaceAll(RegExp(r'\s+'), '');
}

extension ListExtensions<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;

  List<T> get unique => toSet().toList();

  void addIfNotNull(T? item) {
    if (item != null) add(item);
  }
}
```

#### Null Safety

Leverage Dart's null safety features.

```dart
// Nullable and non-nullable types
String? nullableName;
String nonNullableName = 'John';

// Null-aware operators
String displayName = user?.name ?? 'Unknown';
int? length = user?.name?.length;

// Null assertion (use carefully)
String name = user!.name; // Throws if user is null

// Late initialization
late String lateInitializedName;
void initializeName() {
  lateInitializedName = 'John';
}
```

### Asynchronous Programming

#### Basic Async/Await

Use async/await for asynchronous operations.

```dart
// Async functions
Future<User> fetchUserData(int userId) async {
  await Future.delayed(Duration(seconds: 1)); // Simulate network call
  return User(id: userId, name: 'User $userId');
}

// Error handling
Future<void> loadUserData() async {
  try {
    final user = await fetchUserData(123);
    updateUI(user);
  } catch (e) {
    handleError(e);
  }
}
```

#### Streams

Use streams for reactive programming.

```dart
Stream<User> observeUserUpdates() async* {
  while (true) {
    final user = await fetchLatestUser();
    yield user;
    await Future.delayed(Duration(seconds: 5));
  }
}

// Usage
void startObserving() {
  observeUserUpdates()
      .listen(
        (user) => updateUI(user),
        onError: (error) => handleError(error),
        onDone: () => print('Stream completed'),
      );
}
```

#### Future and Completer

Use Future and Completer for custom async operations.

```dart
class DataProcessor {
  final _completer = Completer<List<Data>>();

  Future<List<Data>> processData(List<Data> input) async {
    // Start processing
    _processInBackground(input);
    return _completer.future;
  }

  void _processInBackground(List<Data> input) {
    Timer(Duration(seconds: 2), () {
      final result = input.map((data) => data.process()).toList();
      _completer.complete(result);
    });
  }
}
```

#### Isolates

Use isolates for CPU-intensive tasks.

```dart
Future<List<int>> computeHeavyTask(List<int> data) async {
  return await Isolate.run(() {
    // CPU-intensive computation
    return data.map((x) => x * x * x).toList();
  });
}

// Using compute function for simpler cases
Future<List<int>> computeSimpleTask(List<int> data) async {
  return await compute(_processData, data);
}

List<int> _processData(List<int> data) {
  return data.map((x) => x * 2).toList();
}
```

### Flutter Guidelines

#### Widget Composition

Break down complex widgets into smaller, focused components.

```dart
class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserProfileAppBar(),
      body: Column(
        children: [
          UserProfileHeader(),
          UserProfileContent(),
          UserProfileActions(),
        ],
      ),
    );
  }
}
```

#### State Management

Use appropriate state management patterns.

```dart
// Provider pattern
class UserProvider extends ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> loadUser(int id) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await userService.getUser(id);
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// Riverpod pattern
final userProvider = FutureProvider.family<User, int>((ref, id) async {
  final userService = ref.read(userServiceProvider);
  return await userService.getUser(id);
});
```

#### Custom Widgets

Create reusable custom widgets.

```dart
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final bool isLoading;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.style,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(text),
    );
  }
}
```

#### Navigation

Use proper navigation patterns.

```dart
// Named routes
class AppRoutes {
  static const String home = '/';
  static const String profile = '/profile';
  static const String settings = '/settings';
}

// Navigation
Navigator.pushNamed(context, AppRoutes.profile, arguments: userId);

// With result
final result = await Navigator.pushNamed<bool>(
  context,
  AppRoutes.settings,
);

// Custom route transitions
Navigator.push(
  context,
  PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: animation.drive(
          Tween(begin: Offset(1.0, 0.0), end: Offset.zero),
        ),
        child: child,
      );
    },
  ),
);
```

### Testing

#### Unit Testing

Write comprehensive unit tests.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([UserRepository])
void main() {
  group('UserService', () {
    late UserService userService;
    late MockUserRepository mockRepository;

    setUp(() {
      mockRepository = MockUserRepository();
      userService = UserService(mockRepository);
    });

    test('should return user when valid id provided', () async {
      // Given
      const userId = 123;
      final expectedUser = User(id: userId, name: 'John');
      when(mockRepository.findById(userId)).thenAnswer((_) async => expectedUser);

      // When
      final result = await userService.getUser(userId);

      // Then
      expect(result, equals(expectedUser));
      verify(mockRepository.findById(userId)).called(1);
    });

    test('should throw exception when user not found', () async {
      // Given
      const userId = 999;
      when(mockRepository.findById(userId)).thenAnswer((_) async => null);

      // When & Then
      expect(
        () => userService.getUser(userId),
        throwsA(isA<UserNotFoundException>()),
      );
    });
  });
}
```

#### Widget Testing

Test Flutter widgets properly.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomButton Widget Tests', () {
    testWidgets('should display text and handle tap', (WidgetTester tester) async {
      // Given
      bool wasTapped = false;

      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              onPressed: () => wasTapped = true,
            ),
          ),
        ),
      );

      // Then
      expect(find.text('Test Button'), findsOneWidget);

      await tester.tap(find.byType(CustomButton));
      await tester.pump();

      expect(wasTapped, isTrue);
    });

    testWidgets('should show loading indicator when isLoading is true', (WidgetTester tester) async {
      // When
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'Test Button',
              isLoading: true,
            ),
          ),
        ),
      );

      // Then
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Test Button'), findsNothing);
    });
  });
}
```

#### Integration Testing

Write integration tests for complete user flows.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('User Flow Integration Tests', () {
    testWidgets('complete user registration flow', (WidgetTester tester) async {
      // Start the app
      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      // Navigate to registration
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Fill registration form
      await tester.enterText(find.byKey(Key('email_field')), 'test@example.com');
      await tester.enterText(find.byKey(Key('password_field')), 'password123');
      await tester.enterText(find.byKey(Key('name_field')), 'John Doe');

      // Submit form
      await tester.tap(find.text('Register'));
      await tester.pumpAndSettle();

      // Verify success
      expect(find.text('Registration successful'), findsOneWidget);
    });
  });
}
```

### Performance

#### Lazy Initialization

Use lazy initialization for expensive operations.

```dart
class ExpensiveService {
  late final List<Data> _heavyComputation;

  List<Data> get data {
    _heavyComputation ??= _computeHeavyData();
    return _heavyComputation;
  }

  List<Data> _computeHeavyData() {
    // Expensive computation
    return List.generate(1000000, (index) => Data(index));
  }
}
```

#### Efficient Collections

Use appropriate collection types for performance.

```dart
// Use Set for O(1) lookups
final Set<String> userIds = {'user1', 'user2', 'user3'};
bool isUserExists(String id) => userIds.contains(id);

// Use Map for key-value pairs
final Map<String, User> userCache = {};
User? getCachedUser(String id) => userCache[id];

// Use List for ordered data
final List<Event> events = [];
void addEvent(Event event) => events.add(event);
```

#### Memory Management

Be mindful of memory usage.

```dart
// Dispose resources properly
class DataController extends ChangeNotifier {
  StreamSubscription? _subscription;
  Timer? _timer;

  void startListening() {
    _subscription = dataStream.listen((data) {
      // Handle data
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // Periodic task
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _timer?.cancel();
    super.dispose();
  }
}

// Use const constructors when possible
class AppColors {
  static const Color primary = Color(0xFF2196F3);
  static const Color secondary = Color(0xFF03DAC6);
  static const Color error = Color(0xFFB00020);
}
```
