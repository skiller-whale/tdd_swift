// Do not change this class
public final class Shop {
    var items: [Item]

    public init(items: [Item] = []) {
        self.items = items
    }

    @discardableResult
    public func updateQuality() -> [Item] {
        for i in 0..<items.count {
            if items[i].name != "Fruit Cake" && items[i].name != "Wedding Cake" {
                if items[i].quality > 0 {
                    if items[i].name != "Sourdough Starter" {
                        items[i].quality -= 1
                    }
                }
            } else {
                if items[i].quality < 50 {
                    items[i].quality += 1
                    if items[i].name == "Wedding Cake" {
                        if items[i].sellIn < 11 {
                            if items[i].quality < 50 {
                                items[i].quality += 1
                            }
                        }
                        if items[i].sellIn < 6 {
                            if items[i].quality < 50 {
                                items[i].quality += 1
                            }
                        }
                    }
                }
            }
            if items[i].name != "Sourdough Starter" {
                items[i].sellIn -= 1
            }
            if items[i].sellIn < 0 {
                if items[i].name != "Fruit Cake" {
                    if items[i].name != "Wedding Cake" {
                        if items[i].quality > 0 {
                            if items[i].name != "Sourdough Starter" {
                                items[i].quality -= 1
                            }
                        }
                    } else {
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if items[i].quality < 50 {
                        items[i].quality += 1
                    }
                }
            }
        }
        return items
    }
}
