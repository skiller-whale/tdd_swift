# Mutation Testing: The Bun & Board Till

## The Story

Allison's bakery, **The Bun & Board**, has a new electronic till. It totals up an order, applies
the shop's discounts and delivery rules, and works out loyalty points for regulars.

`Sources/Till/Till.swift` implements the rules:

- Each line costs `quantity * unitPrice`.
- **Bulk discount:** 10% off a line when more than 10 of that item are bought.
- **Loyalty discount:** members get a further 5% off the whole order.
- **Delivery:** free when the discounted subtotal is £25.00 or more, otherwise £3.50 (an empty
  order is never charged for delivery).
- **Loyalty points:** 1 point per whole pound of the discounted subtotal, doubled for members.

`Tests/TillTests/TillTests.swift` already has a test suite that *looks* fairly thorough — and it is
fully green. But green tests with high coverage can still miss important behaviour. Your job is to
find those gaps using **mutation testing**.

## Your task

1. Pick a small change to `Till.swift` that should break its behaviour — a "mutation". For example,
   change a `>` to `>=`, tweak a constant, or delete a branch.
2. Run the tests. If they fail, good — the suite caught the mutation. If they still pass, you have
   found a gap.
3. When you find a surviving mutation, add or tighten a test until it fails for the mutated code.
4. Revert your mutation and check the suite is green again.
5. Repeat once or twice by hand.

## Run the tests

```bash
swift test
```

`swift test` has no built-in watch mode, so just re-run it after each change.

## Automated mutation testing

In Swift, the best-known automated mutation tool is [Muter](https://github.com/muter-mutation-testing/muter),
though it currently targets Xcode/macOS rather than the Linux toolchain used here. The hand
technique above works in any environment and is the skill worth practising — automated tools just
do the same thing for you at scale.
