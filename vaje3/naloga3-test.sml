(*
    Author: Gregor Kr.
    Date: 2018-11-08
    Version: 1.1

    SETUP:
        1. Place naloga3.sml (your excersie solution in the same dir as naloga3-test.sml
        2. Run the command bellow

    USAGE:
        sml naloga3-test.sml
*)

(* The unittest.sml file should be in the project root dir. *)
use "../unittest.sml";

(* Your homework file should be in the same dir as this file. *)
use "naloga3.sml";

(* Some random functions which are going to be used for testing *)
fun isFive (x) = x = 5;
fun isGreaterThanZero x = x > 0;

val _ = (

    test("sorted", [
        assert_eq (sorted ([]), true),
        assert_eq (sorted ([0]), true),
        assert_eq (sorted [1,2], true),
        assert_eq (sorted [1,2,3], true),
        assert_eq (sorted [1,4,8,10,100], true),
        assert_eq (sorted [1,4,8,10,100,8], false),
        assert_eq (sorted [9,8], false)
    ]);

    test("zip",[
        assert_eq (zip ([], []), []),
        assert_eq (zip ([1], [1]), [(1,1)]),
        assert_eq (zip ([ZERO], [ZERO]), [(ZERO, ZERO)]),
        assert_eq (zip ([ZERO], [ZERO, ZERO]), [(ZERO, ZERO)]),
        assert_eq (zip ([NEXT (ZERO)], [NEXT (ZERO)]), [(NEXT (ZERO), NEXT (ZERO))]),
        assert_eq (zip ([NEXT (ZERO)], [ZERO]), [(NEXT (ZERO), ZERO)]),
        assert_eq (zip ([NEXT (ZERO)], [ZERO]), [(NEXT (ZERO), ZERO)]),
        assert_eq (zip ([NEXT (ZERO), ZERO], [ZERO]), [(NEXT (ZERO), ZERO)]),
        assert_eq (zip ([1,2,3], [4,5,6]), [(1,4), (2,5), (3,6)]),
        assert_eq (zip ([1,2,3], [4,5,6, 99]), [(1,4), (2,5), (3,6)]),
        assert_eq (zip ([1,2,3,99], [4,5,6]), [(1,4), (2,5), (3,6)])
    ]);

    test("reverse", [
        assert_eq (reverse [], []),
        assert_eq (reverse [1], [1]),
        assert_eq (reverse [1,2], [2,1]),
        assert_eq (reverse [1,2,3], [3,2,1]),
        assert_eq (reverse [1,5,6,7,10], [10,7,6,5,1]),
        (* Check to see if implementation actually uses tail recurssion. *)
        assert_eq (reverse [10,25,94,36,88,17,0,20,98,18,31,94,94,67,21,38,41,60,58,90,78,81,77,95,16,59,73,0,48,18,69,78,17,91,45,46,44,19,77,65,10,18,37,76,50,37,45,77,19,93,21,40,17,25,46,59,37,26,84,11,46,97,83,87,4,93,83,28,93,100,72,87,2,92,29,66,14,100,86,1,68,83,77,42,95,97,94,75,78,83,18,27,15,17,25,93,86,28,94,17], [17,94,28,86,93,25,17,15,27,18,83,78,75,94,97,95,42,77,83,68,1,86,100,14,66,29,92,2,87,72,100,93,28,83,93,4,87,83,97,46,11,84,26,37,59,46,25,17,40,21,93,19,77,45,37,50,76,37,18,10,65,77,19,44,46,45,91,17,78,69,18,48,0,73,59,16,95,77,81,78,90,58,60,41,38,21,67,94,94,31,18,98,20,0,17,88,36,94,25,10])
    ]);

    test("toNatural", [
        raises (toNatural, ~5, PreviousOfZero),
        raises (toNatural, ~1, PreviousOfZero),
        assert_eq (toNatural 0, ZERO),
        assert_eq (toNatural 1, NEXT (ZERO)),
        assert_eq (toNatural 2, NEXT (NEXT (ZERO))),
        assert_eq (toNatural 3, NEXT (NEXT (NEXT (ZERO))))
    ]);

    test("isEven", [
        assert_eq (isEven ZERO, true),
        assert_eq (isEven (NEXT (ZERO)), false),
        assert_eq (isEven (NEXT (NEXT (ZERO))), true),
        assert_eq (isEven (NEXT (NEXT (NEXT (ZERO)))), false),
        assert_eq (isEven (NEXT (NEXT (NEXT (NEXT (ZERO))))), true)
    ]);

    test("isOdd", [
        assert_eq (isOdd ZERO, false),
        assert_eq (isOdd (NEXT (ZERO)), true),
        assert_eq (isOdd (NEXT (NEXT (ZERO))), false),
        assert_eq (isOdd (NEXT (NEXT (NEXT (ZERO)))), true),
        assert_eq (isOdd (NEXT (NEXT (NEXT (NEXT (ZERO))))), false)
    ]);

    test("previous", [
        raises (previous, ZERO, PreviousOfZero),
        assert_eq (previous (NEXT (ZERO)), ZERO),
        assert_eq (previous (NEXT (NEXT (ZERO))), NEXT (ZERO)),
        assert_eq (previous (NEXT (NEXT (NEXT (ZERO)))), NEXT (NEXT (ZERO))),
        assert_eq (previous (NEXT (NEXT (NEXT (NEXT (ZERO))))), NEXT (NEXT (NEXT (ZERO))))
    ]);

    test("subtract", [
        raises (subtract, (ZERO, NEXT (ZERO)), PreviousOfZero),
        raises (subtract, (ZERO, NEXT (NEXT (ZERO))), PreviousOfZero),
        raises (subtract, (NEXT (ZERO), NEXT (NEXT (ZERO))), PreviousOfZero),
        assert_eq (subtract (NEXT (NEXT (ZERO)), NEXT (NEXT (ZERO))), ZERO),
        assert_eq (subtract (NEXT (ZERO), ZERO), NEXT (ZERO)),
        assert_eq (subtract (NEXT (NEXT (ZERO)), ZERO), NEXT (NEXT (ZERO))),
        assert_eq (subtract (NEXT (NEXT (NEXT (ZERO))), ZERO), NEXT (NEXT (NEXT (ZERO)))),
        assert_eq (subtract (NEXT (NEXT (NEXT (ZERO))), NEXT (ZERO)), NEXT (NEXT (ZERO))),
        assert_eq (subtract (NEXT (NEXT (NEXT (ZERO))), NEXT (NEXT (ZERO))), NEXT (ZERO)),
        assert_eq (subtract (NEXT (NEXT (NEXT (ZERO))), NEXT (NEXT (NEXT (ZERO)))), ZERO),
        assert_eq (subtract (NEXT (NEXT (NEXT (NEXT (ZERO)))), NEXT (NEXT (ZERO))), NEXT (NEXT (ZERO)))
    ]);

    test("any", [
        assert_eq (any (isFive, []), false),
        assert_eq (any (isFive, [1,2,3,4]), false),
        assert_eq (any (isFive, [1,2,3,4,5]), true),
        assert_eq (any ((fn x => x = 10), [10]), true)
    ]);

    test("all", [
        assert_eq (all (isGreaterThanZero, []), true),
        assert_eq (all (isGreaterThanZero, [~1]), false),
        assert_eq (all (isGreaterThanZero, [1,2,3,4]), true),
        assert_eq (all (isGreaterThanZero, [1,2,3,4, ~9]), false)
    ]);

    OS.Process.exit(OS.Process.success)
);
