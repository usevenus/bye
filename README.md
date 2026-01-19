# By Example

A hands-on introduction to [Venus](https://github.com/usevenus/vns) through
annotated examples.

## What is Venus?

Venus is a comprehensive object-oriented programming (OOP) library for Perl 5 that provides:

- **Modern OOP** - Class building, role composition, and mixin support
- **Type System** - Type checking, coercion, and assertions
- **Value Objects** - OOP wrappers for Perl primitives (strings, arrays, hashes, etc.)
- **Zero Dependencies** - Built entirely with Perl core modules
- **Perl 5.18+** - Backward compatible with older Perl versions

Venus brings modern programming patterns to Perl while respecting its roots and
requiring no external dependencies.

## About This Guide

Each topic includes runnable code examples with expected outputs. The examples
are extracted from test files in the `tests/` directory and rendered as POD
documentation in the `topics/` directory.

## Project Structure

```
bye/
├── tests/
│   └── *.t # Topic test files (one per topic)
├── topics/
│   └── *.pod # Generated POD documentation
└── README.md
```

---

## Topics

### Getting Started

- [hello-world](topics/hello-world.pod.md) - Your first Venus program

### Core Types

- [strings](topics/strings.pod.md) - String manipulation
- [numbers](topics/numbers.pod.md) - Numeric operations
- [arrays](topics/arrays.pod.md) - Array handling
- [hashes](topics/hashes.pod.md) - Hash operations
- [booleans](topics/booleans.pod.md) - Boolean values
- [true-false](topics/true-false.pod.md) - Boolean singletons
- [references](topics/references.pod.md) - Reference handling
- [values](topics/values.pod.md) - Value objects

### Object-Oriented Programming

- [classes](topics/classes.pod.md) - Defining classes
- [attributes](topics/attributes.pod.md) - Class attributes
- [methods](topics/methods.pod.md) - Method definitions
- [inheritance](topics/inheritance.pod.md) - Class inheritance
- [roles](topics/roles.pod.md) - Role composition
- [mixins](topics/mixins.pod.md) - Mixin composition
- [method-modifiers](topics/method-modifiers.pod.md) - Before/after/around modifiers

### Type System

- [type-checking](topics/type-checking.pod.md) - Runtime type checks
- [type-casting](topics/type-casting.pod.md) - Type conversion
- [type-coercion](topics/type-coercion.pod.md) - Automatic coercion
- [type-assertions](topics/type-assertions.pod.md) - Type assertions
- [assert](topics/assert.pod.md) - Assertion utilities
- [schema](topics/schema.pod.md) - Schema validation
- [data-validation](topics/data-validation.pod.md) - Data validation

### Collections

- [collection-iteration](topics/collection-iteration.pod.md) - Iterating collections
- [slicing](topics/slicing.pod.md) - Array/hash slicing
- [searching](topics/searching.pod.md) - Finding elements
- [sorting](topics/sorting.pod.md) - Sorting collections
- [joining](topics/joining.pod.md) - Joining elements
- [merging](topics/merging.pod.md) - Merging structures
- [reducing-folding](topics/reducing-folding.pod.md) - Reduce operations
- [unique-random](topics/unique-random.pod.md) - Unique and random selection

### Strings & Patterns

- [regular-expressions](topics/regular-expressions.pod.md) - Regex operations
- [replace](topics/replace.pod.md) - String replacement
- [search](topics/search.pod.md) - Pattern searching
- [templates](topics/templates.pod.md) - Template rendering

### Files & Paths

- [paths](topics/paths.pod.md) - Path manipulation
- [reading-files](topics/reading-files.pod.md) - Reading files
- [writing-files](topics/writing-files.pod.md) - Writing files
- [directories](topics/directories.pod.md) - Directory operations
- [temp-files](topics/temp-files.pod.md) - Temporary files
- [permissions](topics/permissions.pod.md) - File permissions

### Date & Time

- [date-time](topics/date-time.pod.md) - Date/time basics
- [date-formatting](topics/date-formatting.pod.md) - Formatting dates

### CLI & Environment

- [args](topics/args.pod.md) - Command-line arguments
- [opts](topics/opts.pod.md) - Option parsing
- [vars](topics/vars.pod.md) - Environment variables
- [cli](topics/cli.pod.md) - CLI applications

### Error Handling

- [errors](topics/errors.pod.md) - Error basics
- [error-throwing](topics/error-throwing.pod.md) - Throwing errors
- [custom-errors](topics/custom-errors.pod.md) - Custom error classes
- [try-catch](topics/try-catch.pod.md) - Exception handling
- [try](topics/try.pod.md) - Try utilities
- [result-monad](topics/result-monad.pod.md) - Result pattern

### Data Formats

- [json](topics/json.pod.md) - JSON encoding/decoding
- [yaml](topics/yaml.pod.md) - YAML encoding/decoding
- [dump](topics/dump.pod.md) - Data dumping

### Utilities

- [logging](topics/logging.pod.md) - Logging utilities
- [random](topics/random.pod.md) - Random generation
- [process](topics/process.pod.md) - Process management
- [match](topics/match.pod.md) - Pattern matching
- [meta](topics/meta.pod.md) - Package introspection
- [space](topics/space.pod.md) - Namespace utilities
- [unpack](topics/unpack.pod.md) - Argument unpacking

### Advanced Patterns

- [boxing](topics/boxing.pod.md) - Value boxing
- [dispatching](topics/dispatching.pod.md) - Method dispatching
- [constructor-functions](topics/constructor-functions.pod.md) - Constructor helpers
- [argument-unpacking](topics/argument-unpacking.pod.md) - Unpacking arguments
- [method-chaining](topics/method-chaining.pod.md) - Fluent interfaces
- [value-assignment](topics/value-assignment.pod.md) - Value assignment
- [value-deconstruction](topics/value-deconstruction.pod.md) - Destructuring values
- [venus](topics/venus.pod.md) - Bootstrapping Venus

---

## Running the Examples

**Requires Venus 5.00**

Each topic has a corresponding test file.

To run an individual test (using Venus):

```bash
vns test tests/hello-world.t
```

To run an individual test (using Perl `prove`):

```bash
PERL5LIB=/path/to/venus/lib prove -v tests/hello-world.t
```

To run all tests (using Venus):

```bash
vns tests
```

To run all tests (using Perl `prove`):

```bash
PERL5LIB=/path/to/venus/lib prove -v tests/
```

## License

Apache License 2.0

## See Also

- [Venus on GitHub](https://github.com/usevenus/vns)
- [Venus on MetaCPAN](https://metacpan.org/pod/Venus)
