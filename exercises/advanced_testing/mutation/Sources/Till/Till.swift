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
