[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

# Pipes

This is a Swift µframework that adds forward and back pipe operators.

# Use

The simplest pipe allows you to apply the left hand side of the expression as the first argument in the function on the left.

```Swift
func increment(int: Int) -> Int {
    return int + 1
}

2 |> increment
```

Using the `.` operator is the most common and clean way in most cases to chain together function calls.

``` Swift
let isEven: Int->Bool = { x in x % 2 == 0 }
[1,2,3,4,5].filter(isEven).map({$0 * 3}).reduce(0, combine: +)
```

However, the above example does not generalize to sequences, as the functions to operate on sequences are not members of `Sequence` the way they are members of `Array`. So, in order to do the above you must do:

 ```Swift
reduce(map(filter([1,2,3,4,5], isEven), {$0 * 3}), 0, +)
```

Having tons of nested functions is difficult to read and reason about. The forward pipe operator offers a solution to this:
 
 ```Swift
[1,2,3,4,5]
    |> (filter, isEven)
    |> (map, {$0 * 3})
    |> (reduce, 0, +)
```

Futhermore, the pipeline operator even allows you to work simply with `Optional`s and `Result`s!
 
```Swift
// searches elements for 6, and then checks to see if the index is even
[2, 4, 6, 8, 10]
    |> (find, 6)
    |> isEven
```


In this example, we are able to use the `find()` function, which returns an `Optional`, and we immediately pipe it into isEven, which does not take an optional. This is similar to how you might use of the `foo?.bar()` in Swift. It also works with `Result`s!

### Variations

The standard forward pipe operator applies the left hand side as the first argument in the function on the right hand side. However, there may be cases in which you wish to apply the left hand side in a different position. Algebraic supplies 3 helper pipe operators

* `|>>` applies the left hand side as the second argument
* `|>>>` applies the left hand side as the third argument
* `|<` applies the left hand side as the last argument

# Integration
