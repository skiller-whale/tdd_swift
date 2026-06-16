@testable import Till
import Testing

@Suite struct TillTests {

    let till = Till()

    @Test func emptyOrderChargesNothingAndEarnsNoPoints() {
        let receipt = till.checkout([], member: false)
        #expect((receipt.total - 0.0).magnitude < 0.001)
        #expect(receipt.loyaltyPoints == 0)
    }

    @Test func smallOrderHasDeliveryFeeAdded() {
        let receipt = till.checkout([LineItem(name: "Croissant", quantity: 3, unitPrice: 2.00)], member: false)
        #expect((receipt.total - 9.50).magnitude < 0.001)
        #expect(receipt.loyaltyPoints == 6)
    }

    @Test func bulkDiscountAppliedWhenBuyingPlentyOfAnItem() {
        let receipt = till.checkout([LineItem(name: "Roll", quantity: 20, unitPrice: 1.00)], member: false)
        #expect((receipt.total - 21.50).magnitude < 0.001)
        #expect(receipt.loyaltyPoints == 18)
    }

    @Test func noBulkDiscountForAModestQuantity() {
        let receipt = till.checkout([LineItem(name: "Roll", quantity: 8, unitPrice: 1.00)], member: false)
        #expect((receipt.total - 11.50).magnitude < 0.001)
        #expect(receipt.loyaltyPoints == 8)
    }

    @Test func membersGetAnExtraDiscountOffTheWholeOrder() {
        let receipt = till.checkout([LineItem(name: "Cake", quantity: 1, unitPrice: 20.00)], member: true)
        #expect((receipt.total - 22.50).magnitude < 0.001)
    }

    @Test func largeOrderShipsForFree() {
        let receipt = till.checkout([LineItem(name: "Cake", quantity: 2, unitPrice: 15.00)], member: false)
        #expect((receipt.total - 30.00).magnitude < 0.001)
        #expect(receipt.loyaltyPoints == 30)
    }

    @Test func multipleLinesAreSummedWithBulkDiscountPerLine() {
        let receipt = till.checkout(
            [
                LineItem(name: "Croissant", quantity: 2, unitPrice: 2.00),
                LineItem(name: "Roll", quantity: 12, unitPrice: 1.00),
            ],
            member: false
        )
        #expect((receipt.total - 18.30).magnitude < 0.001)
        #expect(receipt.loyaltyPoints == 14)
    }
}
