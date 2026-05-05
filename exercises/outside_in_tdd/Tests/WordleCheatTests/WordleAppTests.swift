import Testing
@testable import WordleCheat

@Suite struct WordleAppTests {
    @Test func runReturnsEmptyListForNow() {
        let app = WordleApp(wordFilePath: "words.txt")
        let result = app.run(["_____", "FTH", "ISYCA"])
        #expect(result.isEmpty)
    }
}
