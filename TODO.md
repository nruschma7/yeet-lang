# TODO

## Lexer reliability

- [ ] Return a lexer error for unterminated string literals instead of allowing a runtime pattern-match failure.
- [ ] Handle Windows-style `\r\n` line endings as one newline so error locations remain accurate.
- [ ] Convert integer literals safely and report values outside the supported `Int` range as lexer errors.
- [ ] Define and implement the intended behavior for escapes and newlines inside string literals.

## Test coverage

- [ ] Add lexer tests for malformed strings, invalid characters, line endings, and integer boundary cases.
- [ ✔️] Avoid relying on the test process being launched from the repository root when locating fixture files.

## Language and runtime

- [ ] Make the README example match the currently supported syntax, or implement its `fn`, `=>`, and `+` syntax.
- [ ] Add parsing and execution for the tokens currently recognized by the lexer.
- [ ] Replace the executable's fixed Hello World output with reading and executing a `.yeet` program.
- [ ] Implement the planned language features: functions, immutable bindings, static typing, pattern matching, and algebraic data types.
