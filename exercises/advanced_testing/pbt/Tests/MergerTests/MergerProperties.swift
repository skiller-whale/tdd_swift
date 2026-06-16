import PropertyBased
import Testing
@testable import Merger

@Suite struct MergerProperties {

    // A generator for a sorted list of small integers, so we always feed `merge` valid (sorted) input.
    let sortedList = Gen.int(in: 0...100).array(of: 0...20).map { $0.sorted() }

    // Property: The merged output should always be in non-decreasing order.
    //
    // This currently passes.
    @Test func mergedOutputIsSorted() async {
        await propertyCheck(input: sortedList, sortedList) { a, b in
            let merged = merge(a, b)
            #expect(merged == merged.sorted())
        }
    }

    // TODO: the merged list should contain every element from both inputs, so its length should
    // equal a.count + b.count.
    // Add an #expect that checks that, then run `swift test`.
    @Test func mergePreservesLength() async {
        await propertyCheck(input: sortedList, sortedList) { a, b in
            let merged = merge(a, b)
            // TODO: #expect something about merged.count
        }
    }

    // TODO: the merged list should contain exactly the same elements as the two inputs combined.
    // Sorting both sides and comparing is one easy way to check this.
    // Add the #expect and run the tests.
    @Test func mergePreservesAllElements() async {
        await propertyCheck(input: sortedList, sortedList) { a, b in
            let merged = merge(a, b)
            // TODO: #expect merged holds the same elements as a and b combined
        }
    }
}
