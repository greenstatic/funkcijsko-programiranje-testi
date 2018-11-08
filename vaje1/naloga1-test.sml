(*
    Author: Gregor Kr.
    Date: 2018-11-08
    Version: 1.2

    SETUP:
        1. Place naloga1.sml (your excersie solution in the same dir as naloga1-test.sml
        2. Run the command bellow

    USAGE:
        sml naloga1-test.sml
*)

(* The unittest.sml file should be in the same dir as this file. *)
use "../unittest.sml";  

(* Your homework file should be in the same dir as this file as well. *)
use "naloga1.sml";

val _ = (

    test("factorial", [
        assert_eq(factorial 0, 1),
        assert_eq(factorial 1, 1),
        assert_eq(factorial 2, 2),
        assert_eq(factorial 3, 6),
        assert_eq(factorial 4, 24),
        assert_eq(factorial 8, 40320)
    ]);

    test("power", [
        assert_eq(power (1, 3), 1),
        assert_eq(power (2, 0), 1),
        assert_eq(power (2, 1), 2),
        assert_eq(power (2, 3), 8),
        assert_eq(power (2, 12), 4096)
    ]);

    test("gcd", [
        assert_eq(gcd (5, 1), 1),
        assert_eq(gcd (24, 12), 12),
        assert_eq(gcd (24, 18), 6),
        assert_eq(gcd (112, 74), 2),
        assert_eq(gcd (119, 68), 17)
    ]);

    test("len", [
        assert_eq(len [], 0),
        assert_eq(len [1], 1),
        assert_eq(len [1,2], 2),
        assert_eq(len [4,8,15,16,23,42], 6)
    ]);

    test("last", [
        assert_eq(last [], NONE),
        assert_eq(last [1], SOME 1),
        assert_eq(last [1,2], SOME 2),
        assert_eq(last [1,2,3,4,5,6], SOME 6)
    ]);

    test("nth", [
        assert_eq(nth ([], 0), NONE),
        assert_eq(nth ([], 1), NONE),
        assert_eq(nth ([], 10), NONE),
        assert_eq(nth ([1], 0), SOME 1),
        assert_eq(nth ([1], 10), NONE),
        assert_eq(nth ([1,2,3,4,5,6], 5), SOME 6),
        assert_eq(nth ([1,2,3,4,5,6], 6), NONE)
    ]);

    test("insert", [
        assert_eq(insert ([], 0, 1), [1]),
        assert_eq(insert ([5], 0, 1), [1,5]),
        assert_eq(insert ([5], 1, 1), [5,1]),
        assert_eq(insert ([1,2,3,4,5,6,7,8,9], 9, 5), [1,2,3,4,5,6,7,8,9,5])
    ]);

    test("delete", [
        assert_eq(delete ([], 5), []),
        assert_eq(delete ([5], 5), []),
        assert_eq(delete ([5,5,5,5,5,5], 5), []),
        assert_eq(delete ([1,2,3,4,5,6,7,8], 5), [1,2,3,4,6,7,8]),
        assert_eq(delete ([5,1,2,3,4,5,6,7,5,8], 5), [1,2,3,4,6,7,8])
    ]);

(* OPTIONAL test for noncompulsory function "append". *)
(*
    test("append", [
        assert_eq(append ([], 1), [1]),
        assert_eq(append ([5], 1), [5,1]),
        assert_eq(append ([1,2,3,4,5], 1), [1,2,3,4,5,1])
    ]);
*)

    test("reverse", [
        assert_eq(reverse [], []),
        assert_eq(reverse [1], [1]),
        assert_eq(reverse [1,2], [2,1]),
        assert_eq(reverse [1,2,3,4,5,6,7,8,9], [9,8,7,6,5,4,3,2,1]),
        assert_eq(reverse [1,2,3,4,3,2,1,5], [5,1,2,3,4,3,2,1])
    ]);

    test("palindrome", [
        assert_eq(palindrome [], true),
        assert_eq(palindrome [1], true),
        assert_eq(palindrome [1,1], true),
        assert_eq(palindrome [1,2], false),
        assert_eq(palindrome [1,2,1], true),
        assert_eq(palindrome [1,2,2,1], true),
        assert_eq(palindrome [1,2,3,2,1], true),
        assert_eq(palindrome [1,2,3,1,1], false),
        assert_eq(palindrome [1,2,3,4,5,6,7,6,5,4,3,2,1], true)
    ]);

    OS.Process.exit(OS.Process.success)
);
