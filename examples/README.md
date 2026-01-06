# VEXA Execution Language Examples

This directory contains example VEL scripts demonstrating various features.

## Running Examples

To run an example in Roblox:

```lua
local VEL = require(ReplicatedStorage.Shared.ExcutionLang)
local fs = require(ReplicatedStorage.YourFileSystemModule) -- or however you read files

local code = fs.read("examples/basic_math.vel")
local result = VEL.run(code)
print(result)
```

## Available Examples

- **basic_math.vel** - Simple arithmetic operations
- **cache_operations.vel** - Using WRITE and READ with the cache
- **table_operations.vel** - Working with tables/arrays
- **arithmetic.vel** - Demonstrates all arithmetic operations (ADD, SUB, MUL, DIV)
