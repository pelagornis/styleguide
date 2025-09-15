---
layout: page
title: Python Style Guide
icon: /assets/images/icons/python.svg
---

## Table of Contents

- [Naming](#naming)
- [Python Style Rules](#python-style-rules)
- [Python Formatting Rules](#python-formatting-rules)
- [Modern Python Features](#modern-python-features)
- [Object-Oriented Programming](#object-oriented-programming)
- [Functional Programming](#functional-programming)
- [Async Programming](#async-programming)
- [Error Handling](#error-handling)
- [Testing](#testing)
- [Performance](#performance)
- [Packaging and Distribution](#packaging-and-distribution)
- [Security](#security)

### Naming

#### Variable and Function Names

**Variable and Function Names**: Use `snake_case` (all lowercase letters, with underscores separating words).

```python
# Wrong
UserName = "Zepa"
TotalCount = 100

def ProcessData(data):
    return [item.strip() for item in data]

# Right
user_name = "zepa"
total_count = 100

def process_data(data):
    return [item.strip() for item in data]
```

**Class Names**: Use `CamelCase`.

```python
# Wrong
class company_info:
    def __init__(self, name, city):
        self.name = name
        self.city = city

# Right
class CompanyInfo:
    def __init__(self, name, city):
        self.name = name
        self.city = city
```

#### Constant Names

Use all uppercase letters with words separated by underscores.

```python
# Wrong
maxCount = 5
apiKey = "pywndqod1"

# Right
MAX_COUNT = 5
API_KEY = "pywndqod1"
```

#### Temporary Variables

Use short, meaningful names.

```python
for i in range(10):
    print(i)

temp = company_name
idx = 0
```

### Python Style Rules

#### Indentation

Use **4 spaces** for indentation. Do not use tabs.

```python
# Wrong
def example_function():
    if True:
        print("Success")

# Right
def example_function():
    if True:
        print("Success")
```

#### Line Length

Limit all lines to **80 characters**.

```python
# Wrong
def long_function_name_with_many_parameters(param1, param2, param3, param4, param5, param6):
    return param1 + param2 + param3 + param4 + param5 + param6

# Right
def long_function_name_with_many_parameters(param1, param2, param3, param4):
    return param1 + param2 + param3 + param4
```

#### Whitespace

Surround **binary operators** (e.g., `+`, `-`, `*`, etc.) with a single space on both sides.

```python
total_price = price + tax
a = b * (c + d)
discount = current - temp
```

Do not put spaces immediately inside parentheses in function definitions or slices.

```python
# Wrong
def my_function( x ):
    return x[ 0 : 3 ]

# Right
def my_function(x):
    return x[0:3]
```

Put a space after `for`, `if`, `while`, and other control flow statements.

```python
# Wrong
if(request_success):
    print("SUCCESS:" + status_code)

# Right
if request_success:
    print("SUCCESS:" + status_code)
```

### 3. Python Formatting Rules

#### Comments

**Inline Comments**: Use inline comments to explain complex or non-obvious code. Place comments above the code with two spaces before the `#`.

```python
# Wrong
if request_success:  # This is a bad comment style
    print("SUCCESS:" + status_code)

# Right
# Success Request Check
if request_success:
    print("SUCCESS:" + status_code)
```

**Docstrings**: Every **function** and **class** should have a docstring to describe what it does, its parameters, and its return values.

```python
# Wrong
def add_numbers(a, b):
    return a + b  # Missing docstring

# Right
def add_numbers(a, b):
    """
    Adds two numbers together.

    Args:
        a (int or float): The first number.
        b (int or float): The second number.

    Returns:
        int or float: The sum of the two numbers.
    """
    return a + b
```

#### Type Hints

**Type hints** should be used for function parameters and return values.

```python
def add(a: int, b: int) -> int:
    return a + b
```

Use `Optional` and `Union` when appropriate to define flexible types.

```python
from typing import Optional, Union, List, Dict, Any

def get_value(x: Optional[str] = None) -> Union[int, str]:
    if x:
        return int(x)
    return "No value"

# Modern Python 3.10+ syntax
def process_data(items: list[str]) -> dict[str, int]:
    return {item: len(item) for item in items}

# Generic types
from typing import TypeVar, Generic

T = TypeVar('T')

class Container(Generic[T]):
    def __init__(self, value: T) -> None:
        self.value = value

    def get(self) -> T:
        return self.value
```

#### Imports

Import standard libraries first, followed by third-party libraries, and then local imports. Each group of imports should be separated by a blank line.

```python
import os
import sys

import requests

from mymodule import my_function
```

### Patterns

#### Exception Handling

Handle exceptions by specifying **specific exceptions** and minimizing the use of `try...except` blocks.

```python
# Wrong
try:
    # ...
except:
    print("Something went wrong")  # Too generic, not recommended

# Right
try:
    # ...
except ValueError as e:
    print(f"ValueError occurred: {e}")
except FileNotFoundError as e:
    print(f"File not found: {e}")
except Exception as e:
    print(f"Unexpected error: {e}")
```

#### Function and Class Definitions

**Functions** should perform **one clear task**. A function should be as **small and simple** as possible.

```python
def calculate_area(radius: float) -> float:
    return 3.14159 * radius * radius
```

**Classes** should have a single responsibility and contain related methods.

```python
class Rectangle:
    def __init__(self, width: float, height: float):
        self.width = width
        self.height = height

    def area(self) -> float:
        return self.width * self.height
```

### Modern Python Features

#### Data Classes

Use data classes for simple data containers.

```python
from dataclasses import dataclass, field
from typing import List, Optional

@dataclass
class User:
    name: str
    email: str
    age: int
    tags: List[str] = field(default_factory=list)
    is_active: bool = True

@dataclass(frozen=True)
class Point:
    x: float
    y: float

    def distance_from_origin(self) -> float:
        return (self.x ** 2 + self.y ** 2) ** 0.5

# Usage
user = User("John Doe", "john@example.com", 30, ["developer", "python"])
point = Point(3.0, 4.0)
print(point.distance_from_origin())  # 5.0
```

#### Enums

Use enums for representing fixed sets of values.

```python
from enum import Enum, auto, IntEnum

class Status(Enum):
    PENDING = "pending"
    APPROVED = "approved"
    REJECTED = "rejected"

class Priority(IntEnum):
    LOW = 1
    MEDIUM = 2
    HIGH = 3
    CRITICAL = 4

class Color(Enum):
    RED = auto()
    GREEN = auto()
    BLUE = auto()

# Usage
status = Status.PENDING
if status == Status.APPROVED:
    print("Request approved")

# Enum comparison
if Priority.HIGH > Priority.MEDIUM:
    print("High priority is greater than medium")
```

#### Pathlib

Use pathlib for modern file path handling.

```python
from pathlib import Path

# Create paths
config_file = Path("config") / "settings.json"
backup_dir = Path.home() / "backups"

# Path operations
if config_file.exists():
    content = config_file.read_text()
    config_file.write_text(content.upper())

# Iterate over files
for py_file in Path(".").glob("*.py"):
    print(f"Python file: {py_file}")

# Create directories
backup_dir.mkdir(parents=True, exist_ok=True)
```

#### Context Managers

Use context managers for resource management.

```python
from contextlib import contextmanager, suppress
import tempfile
import os

# Built-in context managers
with open("file.txt", "r") as f:
    content = f.read()

# Custom context manager
@contextmanager
def temporary_file():
    temp_file = tempfile.NamedTemporaryFile(delete=False)
    try:
        yield temp_file
    finally:
        temp_file.close()
        os.unlink(temp_file.name)

# Usage
with temporary_file() as temp:
    temp.write(b"Hello, World!")

# Suppress exceptions
with suppress(FileNotFoundError):
    os.remove("nonexistent_file.txt")
```

#### Walrus Operator

Use the walrus operator (:=) for assignment expressions.

```python
# Traditional approach
data = get_data()
if data:
    process_data(data)

# With walrus operator
if data := get_data():
    process_data(data)

# In loops
while (line := file.readline()) != "":
    process_line(line)

# In list comprehensions
results = [y for x in data if (y := process(x)) is not None]
```

#### Pattern Matching (Python 3.10+)

Use pattern matching for complex conditional logic.

```python
def handle_response(response):
    match response:
        case {"status": "success", "data": data}:
            return f"Success: {data}"
        case {"status": "error", "message": msg}:
            return f"Error: {msg}"
        case {"status": "pending"}:
            return "Request is pending"
        case _:
            return "Unknown response format"

# Pattern matching with types
def process_value(value):
    match value:
        case int(n) if n > 0:
            return f"Positive integer: {n}"
        case int(n) if n < 0:
            return f"Negative integer: {n}"
        case str(s) if len(s) > 10:
            return f"Long string: {s[:10]}..."
        case str(s):
            return f"Short string: {s}"
        case list(items):
            return f"List with {len(items)} items"
        case _:
            return "Unknown type"
```

### Object-Oriented Programming

#### Class Design Principles

Follow SOLID principles for better class design.

```python
from abc import ABC, abstractmethod
from typing import Protocol

# Single Responsibility Principle
class UserValidator:
    def validate_email(self, email: str) -> bool:
        return "@" in email and "." in email.split("@")[1]

class UserRepository:
    def save(self, user: dict) -> None:
        # Save user to database
        pass

# Open/Closed Principle
class Shape(ABC):
    @abstractmethod
    def area(self) -> float:
        pass

class Rectangle(Shape):
    def __init__(self, width: float, height: float):
        self.width = width
        self.height = height

    def area(self) -> float:
        return self.width * self.height

class Circle(Shape):
    def __init__(self, radius: float):
        self.radius = radius

    def area(self) -> float:
        return 3.14159 * self.radius ** 2

# Liskov Substitution Principle
class Bird(ABC):
    @abstractmethod
    def move(self) -> None:
        pass

class FlyingBird(Bird):
    def move(self) -> None:
        print("Flying")

class WalkingBird(Bird):
    def move(self) -> None:
        print("Walking")

# Interface Segregation Principle
class Readable(Protocol):
    def read(self) -> str: ...

class Writable(Protocol):
    def write(self, data: str) -> None: ...

class FileReader:
    def read(self) -> str:
        return "file content"

class FileWriter:
    def write(self, data: str) -> None:
        print(f"Writing: {data}")

# Dependency Inversion Principle
class Database(ABC):
    @abstractmethod
    def save(self, data: dict) -> None: ...

class PostgreSQLDatabase(Database):
    def save(self, data: dict) -> None:
        print(f"Saving to PostgreSQL: {data}")

class UserService:
    def __init__(self, database: Database):
        self.database = database

    def create_user(self, user_data: dict) -> None:
        self.database.save(user_data)
```

#### Properties and Descriptors

Use properties for controlled attribute access.

```python
class Temperature:
    def __init__(self, celsius: float = 0):
        self._celsius = celsius

    @property
    def celsius(self) -> float:
        return self._celsius

    @celsius.setter
    def celsius(self, value: float) -> None:
        if value < -273.15:
            raise ValueError("Temperature cannot be below absolute zero")
        self._celsius = value

    @property
    def fahrenheit(self) -> float:
        return self._celsius * 9/5 + 32

    @fahrenheit.setter
    def fahrenheit(self, value: float) -> None:
        self.celsius = (value - 32) * 5/9

# Custom descriptor
class ValidatedString:
    def __init__(self, min_length: int = 0, max_length: int = 100):
        self.min_length = min_length
        self.max_length = max_length

    def __set_name__(self, owner, name):
        self.name = name

    def __get__(self, obj, objtype=None):
        if obj is None:
            return self
        return obj.__dict__.get(self.name, "")

    def __set__(self, obj, value):
        if not isinstance(value, str):
            raise TypeError(f"{self.name} must be a string")
        if len(value) < self.min_length:
            raise ValueError(f"{self.name} must be at least {self.min_length} characters")
        if len(value) > self.max_length:
            raise ValueError(f"{self.name} must be at most {self.max_length} characters")
        obj.__dict__[self.name] = value

class User:
    name = ValidatedString(min_length=2, max_length=50)
    email = ValidatedString(min_length=5, max_length=100)

    def __init__(self, name: str, email: str):
        self.name = name
        self.email = email
```

#### Metaclasses

Use metaclasses for advanced class customization.

```python
class SingletonMeta(type):
    _instances = {}

    def __call__(cls, *args, **kwargs):
        if cls not in cls._instances:
            cls._instances[cls] = super().__call__(*args, **kwargs)
        return cls._instances[cls]

class DatabaseConnection(metaclass=SingletonMeta):
    def __init__(self):
        self.connected = True

# Usage
db1 = DatabaseConnection()
db2 = DatabaseConnection()
print(db1 is db2)  # True

# Metaclass for automatic registration
class PluginRegistry(type):
    def __new__(mcs, name, bases, namespace):
        cls = super().__new__(mcs, name, bases, namespace)
        if hasattr(cls, 'plugin_name'):
            PluginRegistry._plugins[cls.plugin_name] = cls
        return cls

    _plugins = {}

class Plugin(metaclass=PluginRegistry):
    pass

class EmailPlugin(Plugin):
    plugin_name = "email"

    def send(self, message: str) -> None:
        print(f"Sending email: {message}")

class SMSPlugin(Plugin):
    plugin_name = "sms"

    def send(self, message: str) -> None:
        print(f"Sending SMS: {message}")

# Usage
email_plugin = PluginRegistry._plugins["email"]()
email_plugin.send("Hello!")
```

### Functional Programming

#### Higher-Order Functions

Use higher-order functions for functional programming patterns.

```python
from functools import reduce, partial
from operator import add, mul

# Map, filter, reduce
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Map
squares = list(map(lambda x: x ** 2, numbers))
doubles = list(map(lambda x: x * 2, numbers))

# Filter
evens = list(filter(lambda x: x % 2 == 0, numbers))
odds = list(filter(lambda x: x % 2 != 0, numbers))

# Reduce
sum_all = reduce(add, numbers)
product_all = reduce(mul, numbers)

# Partial functions
def multiply(x: int, y: int) -> int:
    return x * y

double = partial(multiply, 2)
triple = partial(multiply, 3)

print(double(5))  # 10
print(triple(5))  # 15
```

#### Decorators

Use decorators for cross-cutting concerns.

```python
from functools import wraps
import time
from typing import Callable, Any

# Basic decorator
def timer(func: Callable) -> Callable:
    @wraps(func)
    def wrapper(*args, **kwargs) -> Any:
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"{func.__name__} took {end - start:.4f} seconds")
        return result
    return wrapper

# Decorator with parameters
def retry(max_attempts: int = 3, delay: float = 1.0):
    def decorator(func: Callable) -> Callable:
        @wraps(func)
        def wrapper(*args, **kwargs) -> Any:
            for attempt in range(max_attempts):
                try:
                    return func(*args, **kwargs)
                except Exception as e:
                    if attempt == max_attempts - 1:
                        raise e
                    time.sleep(delay)
            return None
        return wrapper
    return decorator

# Class decorator
def singleton(cls):
    instances = {}
    def get_instance(*args, **kwargs):
        if cls not in instances:
            instances[cls] = cls(*args, **kwargs)
        return instances[cls]
    return get_instance

# Usage
@timer
@retry(max_attempts=3, delay=0.5)
def fetch_data(url: str) -> str:
    # Simulate API call
    if url == "error":
        raise ConnectionError("Connection failed")
    return f"Data from {url}"

@singleton
class Config:
    def __init__(self):
        self.settings = {"debug": True}
```

#### Generators and Iterators

Use generators for memory-efficient iteration.

```python
# Generator function
def fibonacci(n: int):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

# Generator expression
squares = (x ** 2 for x in range(10))

# Custom iterator
class CountDown:
    def __init__(self, start: int):
        self.start = start

    def __iter__(self):
        return self

    def __next__(self):
        if self.start <= 0:
            raise StopIteration
        self.start -= 1
        return self.start + 1

# Usage
for num in fibonacci(10):
    print(num, end=" ")
print()

for square in squares:
    print(square, end=" ")
print()

for num in CountDown(5):
    print(num, end=" ")
print()
```

### Async Programming

#### Async/Await

Use async/await for asynchronous programming.

```python
import asyncio
import aiohttp
from typing import List, Dict, Any

async def fetch_url(session: aiohttp.ClientSession, url: str) -> Dict[str, Any]:
    try:
        async with session.get(url) as response:
            return {
                "url": url,
                "status": response.status,
                "content": await response.text()
            }
    except Exception as e:
        return {
            "url": url,
            "error": str(e)
        }

async def fetch_multiple_urls(urls: List[str]) -> List[Dict[str, Any]]:
    async with aiohttp.ClientSession() as session:
        tasks = [fetch_url(session, url) for url in urls]
        return await asyncio.gather(*tasks)

# Usage
async def main():
    urls = [
        "https://httpbin.org/delay/1",
        "https://httpbin.org/delay/2",
        "https://httpbin.org/delay/3"
    ]
    results = await fetch_multiple_urls(urls)
    for result in results:
        print(f"URL: {result['url']}, Status: {result.get('status', 'Error')}")

# Run the async function
asyncio.run(main())
```

#### Async Context Managers

Use async context managers for resource management.

```python
import asyncio
from contextlib import asynccontextmanager

@asynccontextmanager
async def async_file_reader(filename: str):
    try:
        with open(filename, 'r') as f:
            yield f
    except FileNotFoundError:
        print(f"File {filename} not found")
        yield None

# Async generator
async def async_range(start: int, stop: int, step: int = 1):
    current = start
    while current < stop:
        yield current
        current += step
        await asyncio.sleep(0.1)  # Simulate async work

# Usage
async def process_file():
    async with async_file_reader("data.txt") as file:
        if file:
            content = file.read()
            print(f"File content: {content}")

async def count_async():
    async for num in async_range(0, 10):
        print(f"Count: {num}")

# Run both
asyncio.run(asyncio.gather(process_file(), count_async()))
```

### Error Handling

#### Custom Exceptions

Create custom exceptions for better error handling.

```python
class ValidationError(Exception):
    """Raised when validation fails"""
    def __init__(self, message: str, field: str = None):
        super().__init__(message)
        self.field = field

class DatabaseError(Exception):
    """Raised when database operations fail"""
    def __init__(self, message: str, error_code: int = None):
        super().__init__(message)
        self.error_code = error_code

class APIError(Exception):
    """Raised when API calls fail"""
    def __init__(self, message: str, status_code: int = None):
        super().__init__(message)
        self.status_code = status_code

# Exception chaining
def process_data(data: dict) -> None:
    try:
        validate_data(data)
        save_to_database(data)
    except ValidationError as e:
        raise DatabaseError("Failed to process data") from e

def validate_data(data: dict) -> None:
    if not data.get("name"):
        raise ValidationError("Name is required", "name")
    if not data.get("email"):
        raise ValidationError("Email is required", "email")
```

#### Error Recovery

Implement error recovery strategies.

```python
import logging
from typing import Optional, Callable, Any

def retry_on_failure(
    max_attempts: int = 3,
    delay: float = 1.0,
    backoff: float = 2.0,
    exceptions: tuple = (Exception,)
):
    def decorator(func: Callable) -> Callable:
        def wrapper(*args, **kwargs) -> Any:
            current_delay = delay
            for attempt in range(max_attempts):
                try:
                    return func(*args, **kwargs)
                except exceptions as e:
                    if attempt == max_attempts - 1:
                        logging.error(f"Function {func.__name__} failed after {max_attempts} attempts: {e}")
                        raise e
                    logging.warning(f"Attempt {attempt + 1} failed: {e}. Retrying in {current_delay}s...")
                    time.sleep(current_delay)
                    current_delay *= backoff
            return None
        return wrapper
    return decorator

@retry_on_failure(max_attempts=3, delay=1.0, exceptions=(ConnectionError, TimeoutError))
def fetch_data(url: str) -> str:
    # Simulate API call that might fail
    import random
    if random.random() < 0.7:  # 70% chance of failure
        raise ConnectionError("Connection failed")
    return f"Data from {url}"
```

### Testing

#### Unit Testing with pytest

Write comprehensive unit tests using pytest.

```python
import pytest
from unittest.mock import Mock, patch
from typing import List

# Test functions
def add_numbers(a: int, b: int) -> int:
    return a + b

def divide_numbers(a: float, b: float) -> float:
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

def process_items(items: List[str]) -> List[str]:
    return [item.upper() for item in items if item]

# Test classes
class Calculator:
    def __init__(self):
        self.history = []

    def add(self, a: int, b: int) -> int:
        result = a + b
        self.history.append(f"{a} + {b} = {result}")
        return result

    def get_history(self) -> List[str]:
        return self.history.copy()

# Test file
class TestCalculator:
    def test_add_positive_numbers(self):
        calc = Calculator()
        result = calc.add(2, 3)
        assert result == 5
        assert "2 + 3 = 5" in calc.get_history()

    def test_add_negative_numbers(self):
        calc = Calculator()
        result = calc.add(-2, -3)
        assert result == -5

    def test_add_zero(self):
        calc = Calculator()
        result = calc.add(5, 0)
        assert result == 5

def test_add_numbers():
    assert add_numbers(2, 3) == 5
    assert add_numbers(-1, 1) == 0
    assert add_numbers(0, 0) == 0

def test_divide_numbers():
    assert divide_numbers(10, 2) == 5.0
    assert divide_numbers(7, 3) == pytest.approx(2.333, rel=1e-2)

def test_divide_by_zero():
    with pytest.raises(ValueError, match="Cannot divide by zero"):
        divide_numbers(10, 0)

def test_process_items():
    items = ["hello", "", "world", None, "python"]
    result = process_items(items)
    assert result == ["HELLO", "WORLD", "PYTHON"]

# Fixtures
@pytest.fixture
def sample_data():
    return [1, 2, 3, 4, 5]

@pytest.fixture
def calculator():
    return Calculator()

def test_calculator_with_fixture(calculator, sample_data):
    result = calculator.add(sample_data[0], sample_data[1])
    assert result == 3

# Parametrized tests
@pytest.mark.parametrize("a,b,expected", [
    (2, 3, 5),
    (-1, 1, 0),
    (0, 0, 0),
    (10, -5, 5)
])
def test_add_parametrized(a, b, expected):
    assert add_numbers(a, b) == expected

# Mocking
def test_with_mock():
    with patch('requests.get') as mock_get:
        mock_get.return_value.json.return_value = {"status": "success"}

        # Your function that uses requests.get
        response = mock_get("https://api.example.com")
        data = response.json()

        assert data["status"] == "success"
        mock_get.assert_called_once_with("https://api.example.com")
```

### Performance

#### Profiling and Optimization

Use profiling tools to identify performance bottlenecks.

```python
import cProfile
import pstats
from functools import lru_cache
import time

# Profiling decorator
def profile(func):
    def wrapper(*args, **kwargs):
        profiler = cProfile.Profile()
        profiler.enable()
        result = func(*args, **kwargs)
        profiler.disable()

        stats = pstats.Stats(profiler)
        stats.sort_stats('cumulative')
        stats.print_stats(10)  # Print top 10 functions

        return result
    return wrapper

# Caching
@lru_cache(maxsize=128)
def fibonacci(n: int) -> int:
    if n < 2:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

# Memory profiling
import tracemalloc

def memory_profile(func):
    def wrapper(*args, **kwargs):
        tracemalloc.start()
        result = func(*args, **kwargs)
        current, peak = tracemalloc.get_traced_memory()
        print(f"Current memory usage: {current / 1024 / 1024:.2f} MB")
        print(f"Peak memory usage: {peak / 1024 / 1024:.2f} MB")
        tracemalloc.stop()
        return result
    return wrapper

@profile
@memory_profile
def process_large_data():
    data = [i ** 2 for i in range(10000)]
    return sum(data)

# Performance comparison
def slow_function(n: int) -> int:
    result = 0
    for i in range(n):
        result += i ** 2
    return result

def fast_function(n: int) -> int:
    return sum(i ** 2 for i in range(n))

# Time comparison
start = time.time()
slow_function(10000)
slow_time = time.time() - start

start = time.time()
fast_function(10000)
fast_time = time.time() - start

print(f"Slow function: {slow_time:.4f}s")
print(f"Fast function: {fast_time:.4f}s")
```

#### Memory Optimization

Optimize memory usage for large datasets.

```python
import sys
from typing import Iterator, Generator

# Generator for memory-efficient processing
def read_large_file(filename: str) -> Generator[str, None, None]:
    with open(filename, 'r') as file:
        for line in file:
            yield line.strip()

# Memory-efficient data processing
def process_large_dataset(data: Iterator[str]) -> Generator[dict, None, None]:
    for line in data:
        if line:  # Skip empty lines
            parts = line.split(',')
            if len(parts) >= 3:
                yield {
                    'id': int(parts[0]),
                    'name': parts[1],
                    'value': float(parts[2])
                }

# Usage
def analyze_large_file(filename: str):
    data = read_large_file(filename)
    processed = process_large_dataset(data)

    total = 0
    count = 0
    for record in processed:
        total += record['value']
        count += 1

    return total / count if count > 0 else 0

# Memory-efficient data structures
from collections import deque
import heapq

# Use deque for efficient append/pop operations
queue = deque()
queue.append(1)
queue.append(2)
queue.popleft()  # Efficient left pop

# Use heapq for efficient priority queues
priority_queue = []
heapq.heappush(priority_queue, (1, 'task1'))
heapq.heappush(priority_queue, (3, 'task3'))
heapq.heappush(priority_queue, (2, 'task2'))

while priority_queue:
    priority, task = heapq.heappop(priority_queue)
    print(f"Processing {task} with priority {priority}")
```

### Packaging and Distribution

#### Project Structure

Organize your project with proper structure.

```
my_project/
├── pyproject.toml
├── README.md
├── LICENSE
├── .gitignore
├── src/
│   └── my_project/
│       ├── __init__.py
│       ├── core/
│       │   ├── __init__.py
│       │   ├── models.py
│       │   └── services.py
│       ├── utils/
│       │   ├── __init__.py
│       │   └── helpers.py
│       └── cli/
│           ├── __init__.py
│           └── main.py
├── tests/
│   ├── __init__.py
│   ├── test_models.py
│   └── test_services.py
├── docs/
│   └── index.md
└── examples/
    └── basic_usage.py
```

#### pyproject.toml Configuration

Configure your project with pyproject.toml.

```toml
[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "my-project"
version = "0.1.0"
description = "A sample Python project"
readme = "README.md"
requires-python = ">=3.8"
license = {text = "MIT"}
authors = [
    {name = "Your Name", email = "your.email@example.com"}
]
keywords = ["python", "example", "package"]
classifiers = [
    "Development Status :: 3 - Alpha",
    "Intended Audience :: Developers",
    "License :: OSI Approved :: MIT License",
    "Programming Language :: Python :: 3",
    "Programming Language :: Python :: 3.8",
    "Programming Language :: Python :: 3.9",
    "Programming Language :: Python :: 3.10",
    "Programming Language :: Python :: 3.11",
]
dependencies = [
    "requests>=2.25.0",
    "click>=8.0.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=6.0",
    "pytest-cov>=2.0",
    "black>=21.0",
    "flake8>=3.8",
    "mypy>=0.800",
]
docs = [
    "sphinx>=4.0",
    "sphinx-rtd-theme>=0.5",
]

[project.scripts]
my-project = "my_project.cli.main:main"

[project.urls]
Homepage = "https://github.com/yourusername/my-project"
Repository = "https://github.com/yourusername/my-project"
Documentation = "https://my-project.readthedocs.io"
"Bug Tracker" = "https://github.com/yourusername/my-project/issues"

[tool.setuptools.packages.find]
where = ["src"]

[tool.setuptools.package-dir]
"" = "src"

[tool.black]
line-length = 88
target-version = ['py38']
include = '\.pyi?$'
extend-exclude = '''
/(
  # directories
  \.eggs
  | \.git
  | \.hg
  | \.mypy_cache
  | \.tox
  | \.venv
  | build
  | dist
)/
'''

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py"]
python_classes = ["Test*"]
python_functions = ["test_*"]
addopts = [
    "--strict-markers",
    "--strict-config",
    "--cov=my_project",
    "--cov-report=term-missing",
    "--cov-report=html",
]

[tool.mypy]
python_version = "3.8"
warn_return_any = true
warn_unused_configs = true
disallow_untyped_defs = true
disallow_incomplete_defs = true
check_untyped_defs = true
disallow_untyped_decorators = true
no_implicit_optional = true
warn_redundant_casts = true
warn_unused_ignores = true
warn_no_return = true
warn_unreachable = true
strict_equality = true
```

### Security

#### Input Validation and Sanitization

Implement proper input validation and sanitization.

```python
import re
import html
from typing import Any, Dict, List
from dataclasses import dataclass

@dataclass
class ValidationError(Exception):
    field: str
    message: str

class InputValidator:
    @staticmethod
    def validate_email(email: str) -> str:
        pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
        if not re.match(pattern, email):
            raise ValidationError("email", "Invalid email format")
        return email.lower()

    @staticmethod
    def validate_password(password: str) -> str:
        if len(password) < 8:
            raise ValidationError("password", "Password must be at least 8 characters")
        if not re.search(r'[A-Z]', password):
            raise ValidationError("password", "Password must contain uppercase letter")
        if not re.search(r'[a-z]', password):
            raise ValidationError("password", "Password must contain lowercase letter")
        if not re.search(r'\d', password):
            raise ValidationError("password", "Password must contain digit")
        return password

    @staticmethod
    def sanitize_html(text: str) -> str:
        return html.escape(text)

    @staticmethod
    def validate_sql_input(input_str: str) -> str:
        # Remove potential SQL injection patterns
        dangerous_patterns = [
            r'(\b(SELECT|INSERT|UPDATE|DELETE|DROP|CREATE|ALTER|EXEC|UNION)\b)',
            r'(\b(OR|AND)\s+\d+\s*=\s*\d+)',
            r'(\'|\"|;|--|\/\*|\*\/)'
        ]

        for pattern in dangerous_patterns:
            if re.search(pattern, input_str, re.IGNORECASE):
                raise ValidationError("input", "Potentially dangerous input detected")

        return input_str

# Usage
def validate_user_input(data: Dict[str, Any]) -> Dict[str, str]:
    validator = InputValidator()
    validated_data = {}

    try:
        validated_data['email'] = validator.validate_email(data['email'])
        validated_data['password'] = validator.validate_password(data['password'])
        validated_data['name'] = validator.sanitize_html(data['name'])
        validated_data['comment'] = validator.sanitize_html(data.get('comment', ''))
    except ValidationError as e:
        raise e

    return validated_data
```

#### Secure Configuration

Implement secure configuration management.

```python
import os
from typing import Optional
from dataclasses import dataclass
from pathlib import Path

@dataclass
class SecurityConfig:
    secret_key: str
    database_url: str
    redis_url: str
    debug: bool = False

    @classmethod
    def from_env(cls) -> 'SecurityConfig':
        secret_key = os.getenv('SECRET_KEY')
        if not secret_key:
            raise ValueError("SECRET_KEY environment variable is required")

        database_url = os.getenv('DATABASE_URL')
        if not database_url:
            raise ValueError("DATABASE_URL environment variable is required")

        return cls(
            secret_key=secret_key,
            database_url=database_url,
            redis_url=os.getenv('REDIS_URL', 'redis://localhost:6379'),
            debug=os.getenv('DEBUG', 'False').lower() == 'true'
        )

    def validate(self) -> None:
        if len(self.secret_key) < 32:
            raise ValueError("SECRET_KEY must be at least 32 characters")

        if self.debug and os.getenv('ENVIRONMENT') == 'production':
            raise ValueError("Debug mode cannot be enabled in production")

# Environment-specific configuration
class Config:
    def __init__(self):
        self.environment = os.getenv('ENVIRONMENT', 'development')
        self.config = self._load_config()

    def _load_config(self) -> SecurityConfig:
        if self.environment == 'production':
            return self._load_production_config()
        elif self.environment == 'testing':
            return self._load_testing_config()
        else:
            return self._load_development_config()

    def _load_production_config(self) -> SecurityConfig:
        config = SecurityConfig.from_env()
        config.validate()
        return config

    def _load_testing_config(self) -> SecurityConfig:
        return SecurityConfig(
            secret_key='test-secret-key-for-testing-only',
            database_url='sqlite:///:memory:',
            redis_url='redis://localhost:6379/1',
            debug=True
        )

    def _load_development_config(self) -> SecurityConfig:
        return SecurityConfig(
            secret_key=os.getenv('SECRET_KEY', 'dev-secret-key-not-for-production'),
            database_url=os.getenv('DATABASE_URL', 'sqlite:///dev.db'),
            redis_url=os.getenv('REDIS_URL', 'redis://localhost:6379/0'),
            debug=True
        )
```

#### Documentation

Document your code effectively.

```python
"""
User management module.

This module provides functionality for managing users in the system.
It includes user creation, validation, and retrieval operations.

Example:
    >>> from my_project import UserService
    >>> service = UserService()
    >>> user = service.create_user({"name": "John", "email": "john@example.com"})
    >>> print(user.name)
    John
"""

from typing import List, Optional, Dict, Any
from dataclasses import dataclass
from datetime import datetime

@dataclass
class User:
    """
    Represents a user in the system.

    Attributes:
        id: Unique identifier for the user
        name: User's full name
        email: User's email address
        created_at: Timestamp when user was created
        is_active: Whether the user account is active

    Example:
        >>> user = User(1, "John Doe", "john@example.com")
        >>> print(user.name)
        John Doe
    """
    id: int
    name: str
    email: str
    created_at: datetime = None
    is_active: bool = True

    def __post_init__(self):
        if self.created_at is None:
            self.created_at = datetime.now()

    def deactivate(self) -> None:
        """
        Deactivate the user account.

        This method sets the is_active flag to False, effectively
        disabling the user's access to the system.

        Returns:
            None

        Example:
            >>> user = User(1, "John", "john@example.com")
            >>> user.deactivate()
            >>> print(user.is_active)
            False
        """
        self.is_active = False

class UserService:
    """
    Service class for user management operations.

    This class provides methods for creating, retrieving, and managing
    users in the system. It handles validation and business logic
    related to user operations.

    Attributes:
        database: Database interface for data persistence

    Example:
        >>> service = UserService()
        >>> user = service.create_user({
        ...     "name": "Jane Doe",
        ...     "email": "jane@example.com"
        ... })
        >>> users = service.get_active_users()
    """

    def __init__(self, database: DatabaseInterface):
        """
        Initialize the UserService.

        Args:
            database: Database interface for data persistence

        Raises:
            ValueError: If database is None
        """
        if database is None:
            raise ValueError("Database cannot be None")
        self.database = database

    def create_user(self, user_data: Dict[str, Any]) -> User:
        """
        Create a new user.

        This method validates the user data and creates a new user
        in the system. It performs email validation and ensures
        the user data is complete.

        Args:
            user_data: Dictionary containing user information
                - name (str): User's full name
                - email (str): User's email address

        Returns:
            User: The created user object

        Raises:
            ValueError: If user data is invalid
            ValidationError: If email format is invalid

        Example:
            >>> service = UserService(database)
            >>> user = service.create_user({
            ...     "name": "John Doe",
            ...     "email": "john@example.com"
            ... })
            >>> print(user.name)
            John Doe
        """
        # Validation logic here
        user = User(
            id=self._generate_id(),
            name=user_data["name"],
            email=user_data["email"]
        )

        self.database.save(user.__dict__)
        return user

    def get_active_users(self) -> List[User]:
        """
        Retrieve all active users.

        Returns:
            List[User]: List of active user objects

        Example:
            >>> service = UserService(database)
            >>> active_users = service.get_active_users()
            >>> print(f"Found {len(active_users)} active users")
        """
        users_data = self.database.find({"is_active": True})
        return [User(**data) for data in users_data]

    def _generate_id(self) -> int:
        """Generate a unique user ID."""
        # Implementation here
        return 1
```
