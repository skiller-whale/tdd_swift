import PropertyBased
import Testing
@testable import Merger

// Property-based tests for `merge`.
//
// Instead of hand-picking examples, we describe properties that should hold for *every* pair of
// sorted inputs, and let PropertyBased generate hundreds of cases trying to break them. When a
// property fails, PropertyBased shrinks the failure to the smallest counter-example it can find,
// and prints a seed you can use to replay it — read both carefully.
@Suite struct MergerProperties {

    // A generator for a sorted list of small integers, so we always feed `merge` valid (sorted) input.
    let sortedList = Gen.int(in: 0...100).array(of: 0...20).map { $0.sorted() }

    // A worked example: the merged output should always be in non-decreasing order.
    //
    // Notice this property PASSES even though `merge` has a bug. One property on its own is rarely
    // enough — the properties you add below tell a fuller story.
    @Test func mergedOutputIsSorted() async {
        await propertyCheck(input: sortedList, sortedList) { a, b in
            let merged = merge(a, b)
            #expect(merged == merged.sorted())
        }
    }

    // TODO: the merged list should contain every element from both inputs, so its length should
    // equal a.count + b.count. Add an #expect that checks that, then run `swift test` and read the
    // shrunk counter-example.
    @Test func mergePreservesLength() async {
        await propertyCheck(input: sortedList, sortedList) { a, b in
            let merged = merge(a, b)
            // TODO: #expect something about merged.count
        }
    }

    // TODO: the merged list should contain exactly the same elements as the two inputs combined
    // (the same "multiset" — same values, same number of each). Sorting both sides and comparing
    // is one easy way to check this. Add the #expect, run the tests, and read the shrunk case.
    @Test func mergePreservesAllElements() async {
        await propertyCheck(input: sortedList, sortedList) { a, b in
            let merged = merge(a, b)
            // TODO: #expect merged holds the same elements as a and b combined
        }
    }
}
