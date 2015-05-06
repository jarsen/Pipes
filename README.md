# Pipes [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

This is a Swift µframework that adds forward and back pipe operators.

The forward pipe operator allows you to apply the left hand side of the expression as the first argument in the function on the left.

```Swift
func increment(x: Int) -> Int {
    return x + 1
}

2 |> increment // returns 3
```

Typically, using the `.` operator is the most common and clean way in most cases to chain together instance method calls.

``` Swift
let isEven: Int->Bool = { x in x % 2 == 0 }
[1,2,3,4,5].filter(isEven).map({$0 * 3}).reduce(0, combine: +)
```

However, the above example does not generalize to sequences, as the functions to operate on sequences are not members of `Sequence` the way they are members of `Array`. So, in order to do the above you must do:

 ```Swift
reduce(map(filter([1,2,3,4,5], isEven), {$0 * 3}), 0, +)
```

This is not the most readable code. The forward pipe operator offers a solution:
 
 ```Swift
[1,2,3,4,5]
    |> (filter, isEven)
    |> (map, {$0 * 3})
    |> (reduce, 0, +)
```

## Optionals

Futhermore, the pipeline operator even allows you to work simply with `Optional`s and `Result`s!
 
```Swift
// searches elements for 6, and then checks to see if the index is even
let foo = [2, 4, 6, 8, 10]
    |> (find, 6)
    |> isEven
    
// without the pipe operator
let foo: Bool?
if let x = find([2, 4, 6, 8, 10], 6) {
    foo = isEven(x)
}
else {
    foo = nil
}
```

In this example, we are able to use the `find()` function, which returns an `Optional`, and immediately pipe it into isEven, which _does not_ take an optional. If one of the functions in the chain ever returns `nil`, the whole thing will short circuit and the result of the expression will be `nil`.

## Results

The forward pipe also works seamlessly with `Result`s! The expression will short circuit as soon as something returns a `Failure` case. Otherwise, it will continue to apply the associated value of the `Success` into the next function.

```swift
func escapeInput(string: String) -> String { ... }

func parseFile(fileName: String) -> Result<String> { ... }

func processText(string: String) -> String { ... }

inputFileName
    |> escapeInput
    |> readFile
    |> processText
```

## Variations

The standard forward pipe operator applies the left hand side as the first argument in the function on the right hand side. However, there may be cases in which you wish to apply the left hand side in a different position. Algebraic supplies 3 helper pipe operators

* `|>>` applies the left hand side as the second argument
* `|>>>` applies the left hand side as the third argument
* `|<` applies the left hand side as the last argument

# Integration
