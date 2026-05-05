import Testing

@Suite struct ExampleTests {
    @Test func comparesValuesAndCollections() {
        let values = [2, 4, 6]
        #expect(values[2] == 6)
        #expect(values == [2, 4, 6])
    }

    @Test func checksContainmentAndBooleans() {
        let values = [2, 4, 6]
        #expect(values.contains(4))
        #expect(!values.isEmpty)
    }

    @Suite struct ErrorCases {
        @Test func checksFailures() {
            #expect(throws: ValidationError.self) {
                throw ValidationError()
            }
        }
    }
}

private struct ValidationError: Error {}
