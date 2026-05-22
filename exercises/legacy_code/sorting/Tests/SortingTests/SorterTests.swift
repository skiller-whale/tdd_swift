@testable import Sorting
import Testing

@Suite struct SorterTests {
    @Test func givenNumericStringsTheSmallerComesFirst() {
        #expect(Sorter.sort(["2", "1"]) == ["1", "2"])
    }
}
