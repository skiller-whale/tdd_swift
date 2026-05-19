@testable import Shop
import Testing

@Suite struct ShopTests {
    @Suite struct NormalItems {
        @Test func decreasesSellInBy1EachDay() {
            let item = Item(name: "Bread", sellIn: 5, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.sellIn == 4)
        }

        @Test func decreasesQualityBy1BeforeTheSellByDate() {
            let item = Item(name: "Bread", sellIn: 5, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 19)
        }

        @Test func decreasesQualityBy2OnTheSellByDate() {
            let item = Item(name: "Bread", sellIn: 0, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 18)
        }

        @Test func decreasesQualityBy2EachDayAfterTheSellByDate() {
            let item = Item(name: "Bread", sellIn: -3, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 18)
        }

        @Test func continuesToDecreaseSellInWhenQualityIs0() {
            let item = Item(name: "Bread", sellIn: 5, quality: 0)
            Shop(items: [item]).updateQuality()
            #expect(item.sellIn == 4)
        }

        @Test func qualityNeverDropsBelow0BeforeTheSellByDate() {
            let item = Item(name: "Bread", sellIn: 5, quality: 0)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 0)
        }

        @Test func qualityNeverDropsBelow0OnTheSellByDate() {
            let item = Item(name: "Bread", sellIn: 0, quality: 1)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 0)
        }

        @Test func qualityNeverDropsBelow0AfterTheSellByDate() {
            let item = Item(name: "Bread", sellIn: -1, quality: 1)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 0)
        }

        @Test func degradesCorrectlyOverMultipleDaysSpanningTheSellByDate() {
            let item = Item(name: "Bread", sellIn: 2, quality: 10)
            let shop = Shop(items: [item])
            shop.updateQuality() // sellIn 1, quality 9
            shop.updateQuality() // sellIn 0, quality 8
            shop.updateQuality() // sellIn -1, quality 6
            shop.updateQuality() // sellIn -2, quality 4
            #expect(item.quality == 4)
            #expect(item.sellIn == -2)
        }
    }

    @Suite struct FruitCake {
        @Test func decreasesSellInBy1() {
            let item = Item(name: "Fruit Cake", sellIn: 5, quality: 10)
            Shop(items: [item]).updateQuality()
            #expect(item.sellIn == 4)
        }

        @Test func increasesQualityBy1BeforeTheSellByDate() {
            let item = Item(name: "Fruit Cake", sellIn: 5, quality: 10)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 11)
        }

        @Test func increasesQualityBy2OnTheSellByDate() {
            let item = Item(name: "Fruit Cake", sellIn: 0, quality: 10)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 12)
        }

        @Test func increasesQualityBy2AfterTheSellByDate() {
            let item = Item(name: "Fruit Cake", sellIn: -2, quality: 10)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 12)
        }

        @Test func qualityNeverExceeds50() {
            let item = Item(name: "Fruit Cake", sellIn: 5, quality: 50)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 50)
        }

        @Test func qualityIsCappedAt50BeforeTheSellByDate() {
            let item = Item(name: "Fruit Cake", sellIn: 5, quality: 49)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 50)
        }

        @Test func qualityIsCappedAt50AfterTheSellByDate() {
            let item = Item(name: "Fruit Cake", sellIn: -1, quality: 49)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 50)
        }

        @Test func increasesQualityOverManyDaysSpanningTheSellByDate() {
            let item = Item(name: "Fruit Cake", sellIn: 2, quality: 40)
            let shop = Shop(items: [item])
            shop.updateQuality() // +1, sellIn 1, quality 41
            shop.updateQuality() // +1, sellIn 0, quality 42
            shop.updateQuality() // +2, sellIn -1, quality 44
            shop.updateQuality() // +2, sellIn -2, quality 46
            #expect(item.quality == 46)
        }
    }

    @Suite struct SourdoughStarter {
        @Test func neverChangesQuality() {
            let item = Item(name: "Sourdough Starter", sellIn: 0, quality: 80)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 80)
        }

        @Test func neverChangesTheSellInDate() {
            let item = Item(name: "Sourdough Starter", sellIn: 0, quality: 80)
            Shop(items: [item]).updateQuality()
            #expect(item.sellIn == 0)
        }

        @Test func remainsCompletelyUnchangedAfterManyDays() {
            let item = Item(name: "Sourdough Starter", sellIn: 0, quality: 80)
            let shop = Shop(items: [item])
            for _ in 0..<30 {
                shop.updateQuality()
            }
            #expect(item.quality == 80)
            #expect(item.sellIn == 0)
        }
    }

    @Suite struct WeddingCake {
        @Test func decreasesSellInBy1() {
            let item = Item(name: "Wedding Cake", sellIn: 15, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.sellIn == 14)
        }

        @Test func increasesQualityBy1WithMoreThan10DaysRemaining() {
            let item = Item(name: "Wedding Cake", sellIn: 15, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 21)
        }

        @Test func increasesQualityBy1WithExactly11DaysRemaining() {
            let item = Item(name: "Wedding Cake", sellIn: 11, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 21)
        }

        @Test func increasesQualityBy2WithExactly10DaysRemaining() {
            let item = Item(name: "Wedding Cake", sellIn: 10, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 22)
        }

        @Test func increasesQualityBy2With6DaysRemaining() {
            let item = Item(name: "Wedding Cake", sellIn: 6, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 22)
        }

        @Test func increasesQualityBy3WithExactly5DaysRemaining() {
            let item = Item(name: "Wedding Cake", sellIn: 5, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 23)
        }

        @Test func increasesQualityBy3With1DayRemaining() {
            let item = Item(name: "Wedding Cake", sellIn: 1, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 23)
        }

        @Test func dropsQualityTo0OnTheSellByDate() {
            let item = Item(name: "Wedding Cake", sellIn: 0, quality: 20)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 0)
        }

        @Test func qualityStays0AfterTheSellByDate() {
            let item = Item(name: "Wedding Cake", sellIn: -1, quality: 0)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 0)
        }

        @Test func sellInContinuesToDecreaseAfterTheSellByDate() {
            let item = Item(name: "Wedding Cake", sellIn: -1, quality: 0)
            Shop(items: [item]).updateQuality()
            #expect(item.sellIn == -2)
        }

        @Test func qualityNeverExceeds50() {
            let item = Item(name: "Wedding Cake", sellIn: 5, quality: 50)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 50)
        }

        @Test func qualityIsCappedAt50WithHighRateIncreases() {
            let item = Item(name: "Wedding Cake", sellIn: 5, quality: 48)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 50)
        }

        @Test func qualityIsCappedAt50WithModerateRateIncreases() {
            let item = Item(name: "Wedding Cake", sellIn: 10, quality: 49)
            Shop(items: [item]).updateQuality()
            #expect(item.quality == 50)
        }

        @Test func simulatesAFullRunUpToTheWedding() {
            let item = Item(name: "Wedding Cake", sellIn: 15, quality: 5)
            let shop = Shop(items: [item])

            // Days 15-11: +1/day for 5 days = +5
            for _ in 0..<5 { shop.updateQuality() }
            #expect(item.quality == 10)
            #expect(item.sellIn == 10)

            // Days 10-6: +2/day for 5 days = +10
            for _ in 0..<5 { shop.updateQuality() }
            #expect(item.quality == 20)
            #expect(item.sellIn == 5)

            // Days 5-1: +3/day for 5 days = +15
            for _ in 0..<5 { shop.updateQuality() }
            #expect(item.quality == 35)
            #expect(item.sellIn == 0)

            // Day 0: quality drops to 0
            shop.updateQuality()
            #expect(item.quality == 0)
            #expect(item.sellIn == -1)
        }
    }

    @Suite struct MultipleItems {
        @Test func updatesAllItemsInASingleCall() {
            let bread = Item(name: "Bread", sellIn: 3, quality: 10)
            let fruitCake = Item(name: "Fruit Cake", sellIn: 3, quality: 10)
            let sourdough = Item(name: "Sourdough Starter", sellIn: 0, quality: 80)
            let weddingCake = Item(name: "Wedding Cake", sellIn: 8, quality: 20)

            Shop(items: [bread, fruitCake, sourdough, weddingCake]).updateQuality()

            #expect(bread.quality == 9)
            #expect(fruitCake.quality == 11)
            #expect(sourdough.quality == 80)
            #expect(weddingCake.quality == 22)
        }
    }

    @Suite struct ReturnValue {
        @Test func returnsTheItemsArray() {
            let item = Item(name: "Bread", sellIn: 5, quality: 10)
            let shop = Shop(items: [item])
            let result = shop.updateQuality()
            #expect(result.count == 1)
            #expect(result[0] === item)
        }
    }
}
