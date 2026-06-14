public final class NewShop {
    var items: [Item]

    public init(items: [Item] = []) {
        self.items = items
    }

    @discardableResult
    public func updateQuality() -> [Item] {
        for item in items {
            if item.name == "Sourdough Starter" {
                // Legendary: quality and sellIn never change
            } else {
                OldShop(items: [item]).updateQuality()
            }
        }
        return items
    }
}
