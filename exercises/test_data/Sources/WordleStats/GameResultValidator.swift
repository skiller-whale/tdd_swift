public enum GameResultValidator {
    public static func validateGameResult(_ result: GameResult?) -> ValidationResult {
        guard let result else {
            return .failure("Result must not be nil")
        }

        guard !result.playerName.isEmpty else {
            return .failure("playerName must be a non-empty string")
        }

        guard isValidWord(result.answer) else {
            return .failure("answer must be a 5-letter lowercase word")
        }

        guard !result.guesses.isEmpty else {
            return .failure("guesses must be a non-empty array")
        }

        for guess in result.guesses {
            guard isValidWord(guess) else {
                return .failure("Each guess must be a 5-letter lowercase word")
            }
        }

        guard isValidDate(result.date) else {
            return .failure("date must be a YYYY-MM-DD string")
        }

        let lastGuess = result.guesses.last!
        guard lastGuess == result.answer || result.guesses.count >= 6 else {
            return .failure("Game must be in a completed state (won or lost)")
        }

        return .success()
    }

    public static func summarizeGame(_ result: GameResult) -> String {
        let answer = result.answer.uppercased()
        let isWin = result.guesses.last == result.answer
        let attempts = isWin ? "\(result.guesses.count)" : "X"
        let status = isWin ? "✓" : "✗"
        return "\(result.playerName): \(answer) \(attempts)/6 \(status)"
    }

    private static func isValidWord(_ word: String) -> Bool {
        word.count == 5 && word.allSatisfy { $0 >= "a" && $0 <= "z" }
    }

    private static func isValidDate(_ date: String) -> Bool {
        let parts = date.split(separator: "-", maxSplits: 2)
        return parts.count == 3
            && parts[0].count == 4
            && parts[1].count == 2
            && parts[2].count == 2
            && parts.allSatisfy { $0.allSatisfy(\.isNumber) }
    }
}
