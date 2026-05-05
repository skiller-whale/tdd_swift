import WordleCheat

let app = WordleApp(wordFilePath: "words.json")
let args = Array(CommandLine.arguments.dropFirst())
for line in app.run(args) {
    print(line)
}
