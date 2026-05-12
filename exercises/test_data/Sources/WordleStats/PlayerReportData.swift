public struct PlayerReportData {
    public let playerId: String
    public let email: String
    public let playerName: String
    public let gamesPlayed: Int
    public let gamesWon: Int
    public let winRate: Double
    public let averageAttempts: Double
    public let fastestWin: Int
    public let firstPlayed: String
    public let lastPlayed: String
    public let rank: Int
    public let percentile: Int
    public let achievements: [String]

    public init(
        playerId: String,
        email: String,
        playerName: String,
        gamesPlayed: Int,
        gamesWon: Int,
        winRate: Double,
        averageAttempts: Double,
        fastestWin: Int,
        firstPlayed: String,
        lastPlayed: String,
        rank: Int,
        percentile: Int,
        achievements: [String]
    ) {
        self.playerId = playerId
        self.email = email
        self.playerName = playerName
        self.gamesPlayed = gamesPlayed
        self.gamesWon = gamesWon
        self.winRate = winRate
        self.averageAttempts = averageAttempts
        self.fastestWin = fastestWin
        self.firstPlayed = firstPlayed
        self.lastPlayed = lastPlayed
        self.rank = rank
        self.percentile = percentile
        self.achievements = achievements
    }
}
