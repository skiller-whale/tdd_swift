@testable import WordleStats
import Testing

@Suite struct PlayerStatsTests {
    @Test func calculatePlayerStats_Returns0sForEmptyArray() {
        let stats = PlayerStats.calculatePlayerStats([])

        #expect(stats.gamesPlayed == 0)
        #expect(stats.gamesWon == 0)
    }

    @Test func calculatePlayerStats_CountsGamesPlayedAndWonCorrectly() {
        let games = [
            GameResult(
                playerName: "Alice",
                answer: "whale",
                guesses: ["whale"],
                date: "2026-02-01"
            ),
            GameResult(
                playerName: "Alice",
                answer: "crane",
                guesses: ["stilt", "plumb", "vigor", "kayak", "monks", "brand"],
                date: "2026-02-02"
            ),
        ]

        let stats = PlayerStats.calculatePlayerStats(games)

        #expect(stats.gamesPlayed == 2)
        #expect(stats.gamesWon == 1)
    }

    @Test func calculatePlayerStats_Returns1WhenAllGamesAreWon() {
        let games = [
            GameResult(
                playerName: "Alice",
                answer: "whale",
                guesses: ["whale"],
                date: "2026-02-01"
            ),
            GameResult(
                playerName: "Alice",
                answer: "crane",
                guesses: ["crane"],
                date: "2026-02-02"
            ),
        ]

        let stats = PlayerStats.calculatePlayerStats(games)

        #expect(stats.winRate == 1.0)
    }

    @Test func calculatePlayerStats_ReturnsCorrectRatioForMixOfWinsAndLosses() {
        let games = [
            GameResult(
                playerName: "Alice",
                answer: "whale",
                guesses: ["whale"],
                date: "2026-02-01"
            ),
            GameResult(
                playerName: "Alice",
                answer: "crane",
                guesses: ["stilt", "plumb", "vigor", "kayak", "monks", "brand"],
                date: "2026-02-02"
            ),
            GameResult(
                playerName: "Alice",
                answer: "flint",
                guesses: ["flint"],
                date: "2026-02-03"
            ),
        ]

        let stats = PlayerStats.calculatePlayerStats(games)

        #expect(abs(stats.winRate - 2.0 / 3.0) < 0.00001)
    }

    @Test func calculatePlayerStats_Returns0AverageAttemptsWhenThereAreNoWins() {
        let games = [
            GameResult(
                playerName: "Alice",
                answer: "whale",
                guesses: ["stilt", "plumb", "vigor", "kayak", "monks", "brand"],
                date: "2026-02-01"
            ),
        ]

        let stats = PlayerStats.calculatePlayerStats(games)

        #expect(stats.averageAttempts == 0.0)
    }

    @Test func calculatePlayerStats_CalculatesMeanAttemptsForWinningGames() {
        let games = [
            GameResult(
                playerName: "Alice",
                answer: "whale",
                guesses: ["crane", "slate", "whale"],
                date: "2026-02-01"
            ),
            GameResult(
                playerName: "Alice",
                answer: "crane",
                guesses: ["stilt", "plumb", "vigor", "kayak", "monks", "brand"],
                date: "2026-02-02"
            ),
            GameResult(
                playerName: "Alice",
                answer: "flint",
                guesses: ["flint"],
                date: "2026-02-03"
            ),
        ]

        let stats = PlayerStats.calculatePlayerStats(games)

        #expect(stats.averageAttempts == (3 + 1) / 2.0)
    }

    @Test func calculatePlayerStats_IgnoresLostGamesWhenCalculatingAverage() {
        let games = [
            GameResult(
                playerName: "Alice",
                answer: "whale",
                guesses: ["stilt", "plumb", "vigor", "kayak", "monks", "brand"],
                date: "2026-02-01"
            ),
        ]

        let stats = PlayerStats.calculatePlayerStats(games)

        #expect(stats.averageAttempts == 0.0)
    }
}
