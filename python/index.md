---
layout: page
title: Python Style Guide
icon: /assets/images/icons/python.svg
---

## Table of Contents
- [Naming](#naming)
- [Python Style Rules](#python-style-rules)
- [Python Formatting Rules](#python-formatting-rules)
- [Patterns](#patterns)

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
from typing import Optional, Union

def get_value(x: Optional[str] = None) -> Union[int, str]:
    if x:
        return int(x)
    return "No value"
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
