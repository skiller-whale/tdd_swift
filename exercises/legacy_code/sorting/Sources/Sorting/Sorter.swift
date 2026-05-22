public struct Sorter {
    public static func sort(_ list: [String]) -> [String] {
        list.sorted { a, b in
            let aNum = Int(a)
            let bNum = Int(b)

            switch (aNum, bNum) {
            case let (.some(x), .some(y)):
                return x < y
            default:
                return false
            }
        }
    }
}
