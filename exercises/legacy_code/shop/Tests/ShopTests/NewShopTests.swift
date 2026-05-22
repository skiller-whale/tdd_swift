@testable import Shop
import Testing

@Suite struct NewShopTests {
    @Test func sourdoughStarterNeverDecreasesInQuality() {
        let item = Item(name: "Sourdough Starter", sellIn: 5, quality: 80)
        NewShop(items: [item]).updateQuality()
        #expect(item.quality == 80)
    }

    @Test func sourdoughStarterNeverChangesItsSellInDate() {
        let item = Item(name: "Sourdough Starter", sellIn: 5, quality: 80)
        NewShop(items: [item]).updateQuality()
        #expect(item.sellIn == 5)
    }
}
