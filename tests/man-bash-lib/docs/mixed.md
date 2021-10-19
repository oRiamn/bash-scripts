# say-hello
A library that solves some common problems.

My super function description
Not thread-safe.
## Stdout
```bash
"Hello $1"
```
## Exit code
|code|reason|
| -- | -- |
|0|If successful.|
|1|If an empty string passed.|
## Arguments
|name|value|
| -- | -- |
|$1|string A value to print|
## Usage
```bash
echo "test: $(say-hello World)"
```

# validate
Validate a call method
## Exit code
|code|reason|
| -- | -- |
|0|If successful.|
|1|If an empty string passed.|
## Arguments
|name|value|
| -- | -- |
|$1|myvar|

# nothing
Did nothing because it's an example
## Arguments
|name|value|
| -- | -- |
|$1|first|
|$2|second|
|$3|third|
## Usage
```bash
nothing "one" "two" "three"
```

