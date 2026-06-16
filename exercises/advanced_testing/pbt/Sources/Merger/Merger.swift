// Merges two already-sorted lists of integers into a single sorted list.
public func merge(_ a: [Int], _ b: [Int]) -> [Int] {
    var result: [Int] = []
    var i = 0
    var j = 0
    while i < a.count && j < b.count {
        if a[i] <= b[j] {
            result.append(a[i])
            i += 1
        } else {
            result.append(b[j])
            j += 1
        }
    }
    return result
}
