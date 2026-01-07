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
- `SUB` - Subtract from the active value
- `MUL` - Multiply the active value
- `DIV` - Divide the active value
- `WRITE` - Write to cache
- `READ()` - Read from cache

### 🚧 Planned Features
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

## Runtime Safety and Security

### Current Safeguards

VEL is designed as a minimal scripting language with a focus on safety. Current implementation includes:

- **Sequential execution** - Instructions execute top-to-bottom with predictable flow
- **Single active value model** - Limits complexity and state management
- **No dynamic code execution** - VEL scripts cannot execute arbitrary Luau code
- **Type-safe operations** - Operations are designed for specific types (numbers, tables)

### Planned/Recommended Safeguards

For safe execution of VEL scripts, especially when accepting user-provided code, the following safeguards should be implemented:

#### Execution Limits

- **Step/Gas Limit**: Hard stop on runaway execution (e.g., max 10,000 operations per script)
  - Prevents infinite loops and excessive computation
  - Should be configurable based on use case
  
- **Max Input Size**: Limit script length and token count
  - Prevents memory exhaustion from extremely large scripts
  - Recommended: 10KB script size, 1000 tokens maximum

- **Max AST Depth**: Prevent deeply nested structures that could cause stack overflow
  - Limits nesting of tables and future control structures
  - Recommended: Maximum depth of 100 levels

#### Resource Protection

- **Max Table/String Size**: Prevent memory exhaustion
  - Limit table entries and string lengths
  - Recommended: 1000 table entries, 10KB strings

- **Operation Timeout**: Wall-clock time limit for script execution
  - Prevents time-based DoS attacks
  - Recommended: 1-5 seconds maximum

#### Capability-based Security

- **Default-deny for side effects**: HTTP, DataStore, and remote operations should be explicitly opted into
  - VEL core should not include network or storage capabilities
  - Integrators must explicitly enable any side effects
  
- **No Raw Luau Evaluation**: Avoid `loadstring`-style execution of user code
  - VEL parser should never use `loadstring` or similar functions
  - All execution should go through the controlled VEL executor

### For Integrators

If you're embedding VEL in your project, ensure:

1. **Validate Input**: Always validate and sanitize VEL scripts before execution
2. **Implement Limits**: Set appropriate execution limits (steps, time, memory)
3. **Sandbox Execution**: Run VEL in an isolated environment
4. **Control Capabilities**: Only expose safe operations to VEL scripts
5. **Monitor Resources**: Track execution time and memory usage
6. **Handle Errors**: Gracefully handle syntax and runtime errors
7. **Audit Scripts**: Log and review scripts from untrusted sources

### Security Best Practices

When using VEL:

- ✅ Treat all user-provided scripts as untrusted
- ✅ Implement rate limiting for script execution
- ✅ Use the latest version of VEL
- ✅ Report security issues privately (see [SECURITY.md](SECURITY.md))
- ❌ Do not execute VEL scripts with elevated privileges
- ❌ Do not expose sensitive APIs or data to VEL scripts
- ❌ Do not allow unbounded script execution

### Future Security Enhancements

As VEL evolves with planned features (IF/ELSE, loops, functions), additional safeguards will be critical:

- **Loop iteration limits** to prevent infinite loops
- **Function call depth limits** to prevent stack overflow
- **Scope isolation** for variables and functions
- **Permission model** for accessing different capabilities
- **Resource accounting** for memory and CPU usage

## Contributing

We welcome contributions! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

For security-related contributions or concerns, please review our [Security Policy](SECURITY.md).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
