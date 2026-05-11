@testable import WordleStats
import Testing

@Suite struct ReportGeneratorTests {
    @Test func generatePlayerReport_IncludesPlayersDisplayNameAsHeader() {
        let playerStats = PlayerReportData(
            playerId: "123",
            email: "test@example.com",
            playerName: "TestPlayer",
            gamesPlayed: 50,
            gamesWon: 25,
            winRate: 0.5,
            averageAttempts: 3.5,
            fastestWin: 2,
            firstPlayed: "2024-01-01",
            lastPlayed: "2024-06-01",
            rank: 10,
            percentile: 90,
            achievements: []
        )

        let report = ReportGenerator.generatePlayerReport(playerStats)

        #expect(report.contains("=== TestPlayer ==="))
    }

    @Test func generatePlayerReport_IncludesPlayersIdAndEmail() {
        let playerStats = PlayerReportData(
            playerId: "123",
            email: "test@example.com",
            playerName: "TestPlayer",
            gamesPlayed: 50,
            gamesWon: 25,
            winRate: 0.5,
            averageAttempts: 3.5,
            fastestWin: 2,
            firstPlayed: "2024-01-01",
            lastPlayed: "2024-06-01",
            rank: 10,
            percentile: 90,
            achievements: []
        )

        let report = ReportGenerator.generatePlayerReport(playerStats)

        #expect(report.contains("ID: 123"))
        #expect(report.contains("Email: test@example.com"))
    }

    @Test func generatePlayerReport_IncludesStatsSectionWithGamesPlayedAndWinRate() {
        let playerStats = PlayerReportData(
            playerId: "123",
            email: "test@example.com",
            playerName: "TestPlayer",
            gamesPlayed: 50,
            gamesWon: 25,
            winRate: 0.5,
            averageAttempts: 3.5,
            fastestWin: 2,
            firstPlayed: "2024-01-01",
            lastPlayed: "2024-06-01",
            rank: 10,
            percentile: 90,
            achievements: []
        )

        let report = ReportGenerator.generatePlayerReport(playerStats)

        #expect(report.contains("--- Stats ---"))
        #expect(report.contains("Games Played: 50"))
        #expect(report.contains("Games Won: 25"))
        #expect(report.contains("Win Rate: 50.0%"))
    }

    @Test func generatePlayerReport_IncludesPerformanceSectionWithAverageAttemptsAndFastestWin() {
        let playerStats = PlayerReportData(
            playerId: "123",
            email: "test@example.com",
            playerName: "TestPlayer",
            gamesPlayed: 50,
            gamesWon: 25,
            winRate: 0.5,
            averageAttempts: 3.5,
            fastestWin: 2,
            firstPlayed: "2024-01-01",
            lastPlayed: "2024-06-01",
            rank: 10,
            percentile: 90,
            achievements: []
        )

        let report = ReportGenerator.generatePlayerReport(playerStats)

        #expect(report.contains("--- Performance ---"))
        #expect(report.contains("Average Attempts: 3.5"))
        #expect(report.contains("Fastest Win: 2 guess(es)"))
    }

    @Test func generatePlayerReport_IncludesActivitySectionWithFirstAndLastPlayedDates() {
        let playerStats = PlayerReportData(
            playerId: "123",
            email: "test@example.com",
            playerName: "TestPlayer",
            gamesPlayed: 50,
            gamesWon: 25,
            winRate: 0.5,
            averageAttempts: 3.5,
            fastestWin: 2,
            firstPlayed: "2024-01-01",
            lastPlayed: "2024-06-01",
            rank: 10,
            percentile: 90,
            achievements: []
        )

        let report = ReportGenerator.generatePlayerReport(playerStats)

        #expect(report.contains("--- Activity ---"))
        #expect(report.contains("First Played: 2024-01-01"))
        #expect(report.contains("Last Played: 2024-06-01"))
    }

    @Test func generatePlayerReport_IncludesRankingSectionWithRankAndPercentile() {
        let playerStats = PlayerReportData(
            playerId: "123",
            email: "test@example.com",
            playerName: "TestPlayer",
            gamesPlayed: 50,
            gamesWon: 25,
            winRate: 0.5,
            averageAttempts: 3.5,
            fastestWin: 2,
            firstPlayed: "2024-01-01",
            lastPlayed: "2024-06-01",
            rank: 10,
            percentile: 90,
            achievements: []
        )

        let report = ReportGenerator.generatePlayerReport(playerStats)

        #expect(report.contains("--- Ranking ---"))
        #expect(report.contains("Rank: #10"))
        #expect(report.contains("Percentile: Top 90%"))
    }

    @Test func generatePlayerReport_IncludesAchievementsSection() {
        let playerStats = PlayerReportData(
            playerId: "123",
            email: "test@example.com",
            playerName: "TestPlayer",
            gamesPlayed: 50,
            gamesWon: 25,
            winRate: 0.5,
            averageAttempts: 3.5,
            fastestWin: 2,
            firstPlayed: "2024-01-01",
            lastPlayed: "2024-06-01",
            rank: 10,
            percentile: 90,
            achievements: []
        )

        let report = ReportGenerator.generatePlayerReport(playerStats)

        #expect(report.contains("--- Achievements ---"))
        #expect(report.contains("No achievements yet."))
    }

    @Test func generatePlayerReport_FormatsEachAchievementWithTrophyEmoji() {
        let playerStats = PlayerReportData(
            playerId: "123",
            email: "test@example.com",
            playerName: "TestPlayer",
            gamesPlayed: 50,
            gamesWon: 25,
            winRate: 0.5,
            averageAttempts: 3.5,
            fastestWin: 2,
            firstPlayed: "2024-01-01",
            lastPlayed: "2024-06-01",
            rank: 10,
            percentile: 90,
            achievements: ["First Win", "10-Game Streak"]
        )

        let report = ReportGenerator.generatePlayerReport(playerStats)

        #expect(report.contains("🏆 First Win"))
        #expect(report.contains("🏆 10-Game Streak"))
    }
}
