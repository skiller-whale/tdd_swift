public struct GameResult {
    public let playerName: String
    public let answer: String
    public let guesses: [String]
    public let date: String

    public init(playerName: String, answer: String, guesses: [String], date: String) {
        self.playerName = playerName
        self.answer = answer
        self.guesses = guesses
        self.date = date
    }
}
