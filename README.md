# Functional Programming Course Tests
Exercise unit tests for the course Functional Programming.

All SML tests are written using: [sml-unittest](https://github.com/MatevzFa/sml-unittest).
All Racket tests are written using [Racket's unit testing framework](https://docs.racket-lang.org/rackunit/).

## General Usage SML
1. Download the repo
2. Place your desired exercise solution (e.g. `naloga1.sml`) into the corresponding directory (e.g. `vaje1/naloga1.sml`)
3. Cd into the directory and run: `sml naloga1-test.sml` (replacing the exercise number if necessary)

## General Usage Racket
1. Download the repo
2. Place your desired exercise solution (e.g. `naloga5.rkt`) into the corresponding directory (e.g. `vaje5/naloga5.rkt`)
3. In your solution file (e.g. `naloga5.rkt`) export all of your functions using the function provide, for example vaje5 `(provide power gcd fib reverse map filter remove zip range is-palindrome)`
4. Cd into the directory and run: `racket naloga5-test.rkt` (replacing the exercise number if necessary)
5. You should hopefully get something like this:
```
37 success(es) 0 failure(s) 0 error(s) 37 test(s) run
0
```