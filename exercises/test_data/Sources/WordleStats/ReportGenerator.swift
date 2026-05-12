import Foundation

public enum ReportGenerator {
    public static func generatePlayerReport(_ data: PlayerReportData) -> String {
        [
            "=== \(data.playerName) ===",
            "ID: \(data.playerId)",
            "Email: \(data.email)",
            "",
            "--- Stats ---",
            "Games Played: \(data.gamesPlayed)",
            "Games Won: \(data.gamesWon)",
            "Win Rate: \(String(format: "%.1f", data.winRate * 100))%",
            "",
            "--- Performance ---",
            "Average Attempts: \(String(format: "%.1f", data.averageAttempts))",
            "Fastest Win: \(data.fastestWin) guess(es)",
            "",
            "--- Activity ---",
            "First Played: \(data.firstPlayed)",
            "Last Played: \(data.lastPlayed)",
            "",
            "--- Ranking ---",
            "Rank: #\(data.rank)",
            "Percentile: Top \(data.percentile)%",
            "",
            "--- Achievements ---",
            formatAchievements(data.achievements),
        ].joined(separator: "\n")
    }

    private static func formatAchievements(_ achievements: [String]) -> String {
        guard !achievements.isEmpty else { return "No achievements yet." }
        return achievements.map { "🏆 \($0)" }.joined(separator: "\n")
    }
}
