// The result of putting an order through the till: the amount to charge (including any
// delivery fee) and the loyalty points earned.
// Do not edit this struct.
public struct Receipt {
    public let total: Double
    public let loyaltyPoints: Int

    public init(total: Double, loyaltyPoints: Int) {
        self.total = total
        self.loyaltyPoints = loyaltyPoints
    }
}
