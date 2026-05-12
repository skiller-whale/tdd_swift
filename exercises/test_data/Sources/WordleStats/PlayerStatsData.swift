public struct PlayerStatsData {
    public let gamesPlayed: Int
    public let gamesWon: Int
    public let winRate: Double
    public let averageAttempts: Double

    public init(gamesPlayed: Int, gamesWon: Int, winRate: Double, averageAttempts: Double) {
        self.gamesPlayed = gamesPlayed
        self.gamesWon = gamesWon
        self.winRate = winRate
        self.averageAttempts = averageAttempts
    }
}
