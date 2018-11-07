(*
    Author: Gregor Kr.
    Date: 2018-10-29
    Version: 1.1

    DEPENDENCIES:
        * Matevz Fabjancic's awesome SML testing wrapper "sml-unittest",
            available here: https://github.com/MatevzFa/sml-unittest
    SETUP:
        1. place naloga2-test.sml, unittest.sml and naloga2.sml into the same directory
        2. change directory into the dir
        3. Run the command bellow

    USAGE:
        sml naloga2-test.sml
*)

(* The unittest.sml file should be in the same dir as this file. *)
use "unittest.sml";

(* Your homework file should be in the same dir as this file as well. *)
use "naloga2.sml";

val _ = (

    test("toInt", [
        assert_eq(toInt ZERO, 0),
        assert_eq(toInt (NEXT (ZERO)), 1),
        assert_eq(toInt (NEXT (NEXT (ZERO))), 2),
        assert_eq(toInt (NEXT (NEXT (NEXT (ZERO)))), 3),
        assert_eq(toInt (NEXT (NEXT (NEXT (NEXT (ZERO))))), 4)
    ]);

    test("add", [
        assert_eq(add (ZERO, ZERO), ZERO),
        assert_eq(add ((NEXT (ZERO)), ZERO), (NEXT (ZERO))),
        assert_eq(add ((NEXT (ZERO)), NEXT (ZERO)), (NEXT (NEXT (ZERO)))),
        assert_eq(add (ZERO, NEXT (ZERO)), (NEXT (ZERO))),
        assert_eq(add ((NEXT (ZERO)), NEXT (NEXT (ZERO))), (NEXT (NEXT (NEXT (ZERO))))),
        assert_eq(add (NEXT (NEXT (ZERO)), NEXT (ZERO)), (NEXT (NEXT (NEXT (ZERO))))),
        assert_eq(add (NEXT (NEXT (ZERO)), NEXT (NEXT (ZERO))), NEXT (NEXT (NEXT (NEXT (ZERO)))))
    ]);

    test("min", [
        assert_eq(min (LEAF 5), SOME 5),
        assert_eq(min (NODE (1, LEAF (5), LEAF (2))), SOME 1),
        assert_eq(min (NODE (5, LEAF (1), LEAF (2))), SOME 1),
        assert_eq(min (NODE (3, LEAF (5), LEAF (1))), SOME 1),
        assert_eq(min (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7))), SOME 1),
        assert_eq(min (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7))), SOME 1),
        assert_eq(min (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) )), SOME 1)
    ]);


    test("max", [
        assert_eq(max (LEAF 5), SOME 5),
        assert_eq(max (NODE (1, LEAF (5), LEAF (2))), SOME 5),
        assert_eq(max (NODE (5, LEAF (1), LEAF (2))), SOME 5),
        assert_eq(max (NODE (3, LEAF (1), LEAF (5))), SOME 5),
        assert_eq(max (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7))), SOME 7),
        assert_eq(max (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7))), SOME 9),
        assert_eq(max (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) )), SOME 50)
    ]);

    test("contains", [
        assert_eq(contains (LEAF 5, 5), true),
        assert_eq(contains (LEAF 5, 1), false),
        assert_eq(contains (NODE (1, LEAF (5), LEAF (2)), 2), true),
        assert_eq(contains (NODE (1, LEAF (5), LEAF (2)), 20), false),
        assert_eq(contains (NODE (5, LEAF (1), LEAF (2)), 1), true),
        assert_eq(contains (NODE (5, LEAF (1), LEAF (2)), 10), false),
        assert_eq(contains (NODE (3, LEAF (1), LEAF (5)), 3), true),
        assert_eq(contains (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7)), 7), true),
        assert_eq(contains (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7)), 4), true),
        assert_eq(contains (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7)), 14), false),
        assert_eq(contains (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7)), 9), true),
        assert_eq(contains (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) ), 50), true),
        assert_eq(contains (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) ), 21), true),
        assert_eq(contains (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) ), 150), false)
    ]);

    test("countLeaves", [
        assert_eq(countLeaves (LEAF 5), 1),
        assert_eq(countLeaves (NODE (1, LEAF (5), LEAF (2))), 2),
        assert_eq(countLeaves (NODE (5, LEAF (1), LEAF (2))), 2),
        assert_eq(countLeaves (NODE (3, LEAF (1), LEAF (5))), 2),
        assert_eq(countLeaves (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7))), 3),
        assert_eq(countLeaves (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7))), 3),
        assert_eq(countLeaves (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) )), 4)
    ]);

    test("countBranches",[
        assert_eq(countBranches (LEAF 5), 0),
        assert_eq(countBranches (NODE (1, LEAF (5), LEAF (2))), 1),
        assert_eq(countBranches (NODE (5, LEAF (1), LEAF (2))), 1),
        assert_eq(countBranches (NODE (3, LEAF (1), LEAF (5))), 1),
        assert_eq(countBranches (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7))), 2),
        assert_eq(countBranches (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7))), 2),
        assert_eq(countBranches (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) )), 3)
    ]);

    test("height", [
        assert_eq(height (LEAF 5), 1),
        assert_eq(height (NODE (1, LEAF (5), LEAF (2))), 2),
        assert_eq(height (NODE (5, LEAF (1), LEAF (2))), 2),
        assert_eq(height (NODE (3, LEAF (1), LEAF (5))), 2),
        assert_eq(height (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7))), 3),
        assert_eq(height (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7))), 3),
        assert_eq(height (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) )), 3)
    ]);

    test("toList", [
        assert_eq(toList (LEAF 5), [5]),
        assert_eq(toList (NODE (1, LEAF (5), LEAF (2))), [5,1,2]),
        assert_eq(toList (NODE (5, LEAF (1), LEAF (2))), [1,5,2]),
        assert_eq(toList (NODE (3, LEAF (1), LEAF (5))), [1,3,5]),
        assert_eq(toList (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7))), [5,1,4,3,7]),
        assert_eq(toList (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7))), [5,9,1,3,7]),
        assert_eq(toList (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) )), [5,9,21,3,1,31,50])
    ]);

    test("isBalanced", [
        assert_eq(isBalanced (LEAF 5), true),
        assert_eq(isBalanced (NODE (1, LEAF (5), LEAF (2))), true),
        assert_eq(isBalanced (NODE (5, LEAF (1), LEAF (2))), true),
        assert_eq(isBalanced (NODE (3, LEAF (1), LEAF (5))), true),
        assert_eq(isBalanced (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7))), true),
        assert_eq(isBalanced (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7))), true),
        assert_eq(isBalanced (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) )), true),
        assert_eq(isBalanced (NODE (3, NODE (9, NODE(5, NODE (5, NODE (5, NODE (5, LEAF(1), LEAF(3)), LEAF(2)), LEAF(1)), LEAF(1)), LEAF (1)), LEAF (7))), false)
    ]);

    test("isBST", [
        assert_eq(isBST (LEAF 5), true),
        assert_eq(isBST (NODE (1, LEAF (5), LEAF (2))), false),
        assert_eq(isBST (NODE (5, LEAF (1), LEAF (2))), false),
        assert_eq(isBST (NODE (3, LEAF (1), LEAF (5))), true),
        assert_eq(isBST (NODE (3, NODE (1, LEAF (5), LEAF (4)), LEAF (7))), false),
        assert_eq(isBST (NODE (3, NODE (9, LEAF (5), LEAF (1)), LEAF (7))), false),
        assert_eq(isBST (NODE (3, NODE (9, LEAF (5), LEAF (21)), NODE (31, LEAF (1), LEAF (50)) )), false),
        assert_eq(isBST (NODE (4, NODE (2, LEAF (1), LEAF (3)), NODE (6, LEAF (5), LEAF (7)) )), true),
        assert_eq(isBST (NODE (3, NODE (9, NODE(5, NODE (5, NODE (5, NODE (5, LEAF(1), LEAF(3)), LEAF(2)), LEAF(1)), LEAF(1)), LEAF (1)), LEAF (7))), false),
        assert_eq(isBST (NODE (50, NODE (40, NODE(30, NODE (25, NODE (15, NODE (10, LEAF(5), LEAF(13)), LEAF(20)), LEAF(29)), LEAF(35)), LEAF (41)), LEAF (70))), true)
    ]);

    OS.Process.exit(OS.Process.success)
);
