// The till for The Bun & Board bakery. It totals up an order, applies the shop's
// discounts and delivery rules, and works out how many loyalty points the customer earns.
//
// During the exercise you will deliberately 'mutate' this struct to test your tests,
// then revert your changes. The behaviour it is supposed to have is:
//
//   * Each line costs quantity * unitPrice.
//   * Bulk discount: 10% off a line when more than 10 of that item are bought.
//   * Loyalty discount: members get a further 5% off the whole order.
//   * Delivery: free when the discounted subtotal is 25.00 or more, otherwise 3.50.
//     An empty order (subtotal of 0.00) is never charged for delivery.
//   * Loyalty points: 1 point per whole pound of the discounted subtotal, doubled for members.
//   * The charged total is rounded to the nearest penny.
public struct Till {

    private static let bulkThreshold = 10
    private static let bulkDiscount = 0.10
    private static let memberDiscount = 0.05
    private static let freeDeliveryThreshold = 25.0
    private static let deliveryFee = 3.50

    public init() {}

    public func checkout(_ items: [LineItem], member: Bool) -> Receipt {
        var subtotal = 0.0
        for item in items {
            var lineTotal = Double(item.quantity) * item.unitPrice
            if item.quantity > Self.bulkThreshold {
                lineTotal -= lineTotal * Self.bulkDiscount
            }
            subtotal += lineTotal
        }

        if member {
            subtotal -= subtotal * Self.memberDiscount
        }

        var delivery = Self.deliveryFee
        if subtotal >= Self.freeDeliveryThreshold {
            delivery = 0.0
        }
        if subtotal == 0.0 {
            delivery = 0.0
        }

        var points = Int(subtotal)
        if member {
            points *= 2
        }

        let total = Self.round(subtotal + delivery)
        return Receipt(total: total, loyaltyPoints: points)
    }

    private static func round(_ amount: Double) -> Double {
        (amount * 100.0).rounded() / 100.0
    }
}
