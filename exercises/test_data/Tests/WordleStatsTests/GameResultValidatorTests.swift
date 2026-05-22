@testable import WordleStats
import Testing

@Suite struct GameResultValidatorTests {
    @Test func validateGameResult_AcceptsAValidGameResult() {
        let result = GameResult(
            playerName: "Alice",
            answer: "whale",
            guesses: ["crane", "slate", "whale"],
            date: "2026-02-01"
        )

        let validation = GameResultValidator.validateGameResult(result)

        #expect(validation.valid)
    }

    @Test func validateGameResult_RejectsNil() {
        let validation = GameResultValidator.validateGameResult(nil)

        #expect(!validation.valid)
        #expect(validation.reason == "Result must not be nil")
    }

    @Test func validateGameResult_RejectsResultWithMissingPlayerName() {
        let result = GameResult(
            playerName: "",
            answer: "whale",
            guesses: ["crane", "slate", "whale"],
            date: "2026-02-01"
        )

        let validation = GameResultValidator.validateGameResult(result)

        #expect(!validation.valid)
        #expect(validation.reason == "playerName must be a non-empty string")
    }

    @Test func validateGameResult_RejectsResultWithMissingAnswer() {
        let result = GameResult(
            playerName: "Alice",
            answer: "",
            guesses: ["crane", "slate", "whale"],
            date: "2026-02-01"
        )

        let validation = GameResultValidator.validateGameResult(result)

        #expect(!validation.valid)
        #expect(validation.reason == "answer must be a 5-letter lowercase word")
    }

    @Test(arguments: ["whales", "WHALE", "wh4le", "whal", ""])
    func validateGameResult_RejectsResultWithAnswerOfWrongFormat(invalidAnswer: String) {
        let result = GameResult(
            playerName: "Alice",
            answer: invalidAnswer,
            guesses: ["crane", "slate", "whale"],
            date: "2026-02-01"
        )

        let validation = GameResultValidator.validateGameResult(result)

        #expect(!validation.valid)
        #expect(validation.reason == "answer must be a 5-letter lowercase word")
    }

    @Test func validateGameResult_RejectsResultWithMissingGuesses() {
        let result = GameResult(
            playerName: "Alice",
            answer: "whale",
            guesses: [],
            date: "2026-02-01"
        )

        let validation = GameResultValidator.validateGameResult(result)

        #expect(!validation.valid)
        #expect(validation.reason == "guesses must be a non-empty array")
    }

    @Test func validateGameResult_RejectsResultWithInvalidDateFormat() {
        let result = GameResult(
            playerName: "Alice",
            answer: "whale",
            guesses: ["crane", "slate", "whale"],
            date: "02-01-2026"
        )

        let validation = GameResultValidator.validateGameResult(result)

        #expect(!validation.valid)
        #expect(validation.reason == "date must be a YYYY-MM-DD string")
    }

    @Test func validateGameResult_RejectsResultThatIsNotInCompletedState() {
        let result = GameResult(
            playerName: "Alice",
            answer: "whale",
            guesses: ["crane", "slate"],
            date: "2026-02-01"
        )

        let validation = GameResultValidator.validateGameResult(result)

        #expect(!validation.valid)
        #expect(validation.reason == "Game must be in a completed state (won or lost)")
    }

    @Test(arguments: [
        ("Alice", "whale", ["whale"], "Alice: WHALE 1/6 ✓"),
        ("Bob", "flint", ["crane", "slate", "flint"], "Bob: FLINT 3/6 ✓"),
        ("Charlie", "crane", ["stilt", "plumb", "vigor", "kayak", "monks", "crane"], "Charlie: CRANE 6/6 ✓"),
    ])
    func summarizeGame_FormatsWinningGameCorrectly(
        playerName: String, answer: String, guesses: [String], expected: String
    ) {
        let result = GameResult(playerName: playerName, answer: answer, guesses: guesses, date: "2026-02-01")

        let summary = GameResultValidator.summarizeGame(result)

        #expect(summary == expected)
    }

    @Test(arguments: ["Alice", "Bob", "Charlie"])
    func summarizeGame_FormatsLosingGameCorrectly(playerName: String) {
        let result = GameResult(
            playerName: playerName,
            answer: "whale",
            guesses: ["crane", "slate", "flame", "blame", "frame", "grape"],
            date: "2026-02-01"
        )

        let summary = GameResultValidator.summarizeGame(result)

        #expect(summary == "\(playerName): WHALE X/6 ✗")
    }
}
