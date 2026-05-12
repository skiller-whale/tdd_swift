public enum PlayerStats {
    public static func calculatePlayerStats(_ gameResults: [GameResult]) -> PlayerStatsData {
        guard !gameResults.isEmpty else {
            return PlayerStatsData(gamesPlayed: 0, gamesWon: 0, winRate: 0.0, averageAttempts: 0.0)
        }

        let gamesPlayed = gameResults.count
        let winningGames = gameResults.filter(isGameWon)
        let gamesWon = winningGames.count
        let winRate = Double(gamesWon) / Double(gamesPlayed)
        let averageAttempts = calculateAverageAttempts(winningGames)

        return PlayerStatsData(
            gamesPlayed: gamesPlayed,
            gamesWon: gamesWon,
            winRate: winRate,
            averageAttempts: averageAttempts
        )
    }

    private static func calculateAverageAttempts(_ winningGames: [GameResult]) -> Double {
        guard !winningGames.isEmpty else { return 0.0 }
        let totalAttempts = winningGames.reduce(0) { $0 + $1.guesses.count }
        return Double(totalAttempts) / Double(winningGames.count)
    }

    private static func isGameWon(_ result: GameResult) -> Bool {
        result.guesses.last == result.answer
    }
}
