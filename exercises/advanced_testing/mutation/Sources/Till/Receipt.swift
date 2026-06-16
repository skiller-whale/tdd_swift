public struct Receipt {
    public let total: Double
    public let loyaltyPoints: Int

    public init(total: Double, loyaltyPoints: Int) {
        self.total = total
        self.loyaltyPoints = loyaltyPoints
    }
}
