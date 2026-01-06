# VEXA Execution Language (VEL)

**VEXA Execution Language (VEL)** is a lightweight, experimental scripting language written in **Luau**, designed for simple value manipulation, caching, and instruction-based execution.

It is intentionally minimal, easy to parse, and human-readable — built *because why not*.

> ⚠️ This project is experimental. Expect breaking changes, missing features, and undocumented behaviour.

## Overview

VEL operates on a **single active value** and a **cache system**.
Instructions are executed sequentially, modifying the active value or interacting with the cache.

After execution, the interpreter returns:

* A **number**, or
* A **table containing numbers**

depending on what the script produced.

## Basic Syntax Rules

### Instruction Terminator

Each instruction **must end with a semicolon (`;`)**

```text
SET 100;
ADD 25;
```

### Strings

Strings are defined using double quotes (`"`):

```text
WRITE "ALPHA";
```

### Tables

Tables are defined using curly braces (`{}`):

```text
SET {1, 2, 3};
```

> Table behaviour depends on the instruction consuming it.

### Whitespace

Whitespace is ignored except where needed to separate instructions and arguments.

## Example Program

```text
SET 100;
ADD 100;
WRITE "ALPHA";
```

### What this does:

1. Sets the active value to `100`
2. Adds `100` to it → active value becomes `200`
3. Writes `200` into the cache under the key `"ALPHA"`

## Execution Model

* VEL maintains **one active value** at all times
* Instructions modify or reference this value
* Cache is used for storing and retrieving named values
* Instructions execute **top-to-bottom**

## Core Instructions

> ⚠️ This list may become out of date. The README **will probably be forgotten**.

## Implementation Status

### ✅ Currently Implemented
- `SET` - Set the active value
- `ADD` - Add to the active value
- `WRITE` - Write to cache
- `READ()` - Read from cache

### 🚧 Planned Features
- `SUB`, `MUL`, `DIV` - Additional arithmetic operations
- Conditional execution (IF/ELSE)
- Loops (WHILE/FOR)
- Function definitions
- Scoped variables
- Enhanced table operations

### `SET`

Sets the active value to the provided value.

```text
SET 50;
SET {10, 20, 30};
```

### `ADD`

Adds the provided value to the active value.

```text
SET 10;
ADD 5;
```

Resulting active value:

```
15
```

> Behaviour when adding tables depends on implementation.

### `WRITE`

Writes the current active value to the cache at the specified key.

```text
WRITE "SCORE";
```

Cache result:

```text
SCORE = <active value>
```

## Special Values & Functions

> ⚠️ Also likely to be out of date.

### `READ(String)`

Reads a value from the cache and returns it for use in instructions.

```text
SET READ("SCORE");
ADD 10;
```

### Behaviour:

1. Reads `"SCORE"` from cache
2. Sets active value to that value
3. Adds `10`

## Cache System

* Cache is a key-value store
* Keys are **strings**
* Values are typically numbers or tables
* Cache persists for the lifetime of the execution context

Example:

```text
SET 42;
WRITE "ANSWER";

SET READ("ANSWER");
ADD 8;
```

Final active value:

```
50
```

## Return Values

After execution completes, the interpreter returns:

* The **final active value**, or
* A **table of numbers**, if applicable

## Error Handling (Current / Planned)

Currently:

* Invalid instructions may silently fail or error
* Type mismatches may cause runtime errors

Planned:

* Instruction validation
* Better error messages
* Line-number reporting

## Design Philosophy

* Minimal syntax
* Easy to parse in Luau
* Scriptable logic without heavy boilerplate
* Designed for experimentation, not production (yet)

## Planned Features (Maybe)

* `SUB`, `MUL`, `DIV`
* Conditional execution
* Loops
* Function definitions
* Scoped variables
* Better table operations

## Example Full Script

```text
SET 100;
WRITE "BASE";

SET READ("BASE");
ADD 50;
WRITE "TOTAL";
```

Cache result:

```text
BASE  = 100
TOTAL = 150
```

## License

No license yet.
Use at your own risk. 😄
