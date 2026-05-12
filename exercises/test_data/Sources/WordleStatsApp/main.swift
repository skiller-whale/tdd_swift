import Foundation
import WordleStats

private struct GameResultCodable: Decodable {
    let playerName: String
    let answer: String
    let guesses: [String]
    let date: String
}

guard let data = try? Data(contentsOf: URL(fileURLWithPath: "data/sample-results.json")),
      let decoded = try? JSONDecoder().decode([GameResultCodable].self, from: data)
else {
    print("Could not load sample-results.json")
    exit(1)
}

let gameResults = decoded.map {
    GameResult(playerName: $0.playerName, answer: $0.answer, guesses: $0.guesses, date: $0.date)
}

let playerNames = Array(Set(gameResults.map { $0.playerName })).sorted()

for playerName in playerNames {
    let playerGames = gameResults.filter { $0.playerName == playerName }
    let stats = PlayerStats.calculatePlayerStats(playerGames)
    let fastestWin = playerGames
        .filter { $0.guesses.last == $0.answer }
        .map { $0.guesses.count }
        .min() ?? 0
    let reportData = PlayerReportData(
        playerId: playerName.lowercased(),
        email: "\(playerName.lowercased())@example.com",
        playerName: playerName,
        gamesPlayed: stats.gamesPlayed,
        gamesWon: stats.gamesWon,
        winRate: stats.winRate,
        averageAttempts: stats.averageAttempts,
        fastestWin: fastestWin,
        firstPlayed: playerGames.map { $0.date }.min() ?? "",
        lastPlayed: playerGames.map { $0.date }.max() ?? "",
        rank: 0,
        percentile: 0,
        achievements: []
    )
    print(ReportGenerator.generatePlayerReport(reportData))
    print()
}
