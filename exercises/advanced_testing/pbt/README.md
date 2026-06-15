# Property-Based Testing: Merging Sorted Lists

## The Story

`merge` takes two already-sorted lists of integers and merges them into a single sorted list — the
same merge step at the heart of merge sort.

It has a bug. Rather than hunting for it with hand-picked examples, you will describe the
**properties** a correct merge must always have, and let
[PropertyBased](https://github.com/x-sheep/swift-property-based) generate hundreds of inputs trying
to break them. When a property fails, PropertyBased **shrinks** the failure to the smallest
counter-example it can find, and prints a seed you can use to replay it.

## Your task

Open `Tests/MergerTests/MergerProperties.swift`. It contains:

- A worked property, `mergedOutputIsSorted`, which already passes — note that a buggy merge can
  still produce sorted output, so this property alone is not enough.
- Two `TODO` properties for you to complete:
  - `mergePreservesLength` — the merged list should be as long as both inputs combined.
  - `mergePreservesAllElements` — the merged list should contain exactly the same elements.

Complete the two properties, run the tests, and read the shrunk minimal counter-example. Then fix
`merge` in `Sources/Merger/Merger.swift` until every property holds.

## Run the tests

```bash
swift test
```

`swift test` has no built-in watch mode, so just re-run it after each change.
