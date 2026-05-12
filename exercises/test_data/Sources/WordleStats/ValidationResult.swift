public struct ValidationResult {
    public let valid: Bool
    public let reason: String?

    public static func success() -> ValidationResult {
        ValidationResult(valid: true, reason: nil)
    }

    public static func failure(_ reason: String) -> ValidationResult {
        ValidationResult(valid: false, reason: reason)
    }
}
