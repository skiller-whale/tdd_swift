// A single line on a customer's order: how many of a product, and its unit price.
// Do not edit this struct.
public struct LineItem {
    public let name: String
    public let quantity: Int
    public let unitPrice: Double

    public init(name: String, quantity: Int, unitPrice: Double) {
        self.name = name
        self.quantity = quantity
        self.unitPrice = unitPrice
    }
}
