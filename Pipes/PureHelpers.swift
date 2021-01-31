//
//  Created by Jason Larsen on 5/18/15.
//

import Foundation

//
// MARK: Sequence
//

/*public func map<S: SequenceType, T>(f: S.Generator.Element->T, seq: S) -> [T] {
    return map(seq, f)
}*/

public func filter<S: SequenceType>(f: S.Generator.Element->Bool, seq: S) -> [S.Generator.Element] {
    return seq.filter(f)
}

public func reduce<S : SequenceType, U>(initial: U, @noescape f: (U, S.Generator.Element) -> U, seq: S) -> U {
    return seq.reduce(initial, combine: f)
}

//
// MARK: ExtensibleCollectionType
//

public func extend<S: SequenceType, C: RangeReplaceableCollectionType where S.Generator.Element == C.Generator.Element>( collection: C, newElements: S) -> C {
    var c = collection
    c.appendContentsOf(newElements)
    return c
}

public func extend<S: SequenceType, C: RangeReplaceableCollectionType where S.Generator.Element == C.Generator.Element>(newElements: S, collection: C) -> C {
    return extend(collection, newElements: newElements)
}

public func append<C: RangeReplaceableCollectionType>( collection: C, newElement: C.Generator.Element) -> C {
    var c = collection
    c.append(newElement)
    return c
}

public func append<C: RangeReplaceableCollectionType>(newElement: C.Generator.Element, collection: C) -> C {
    return append(collection, newElement: newElement)
}

//
// MARK: RangeReplaceableCollectionType
//

public func replaceRange<R: RangeReplaceableCollectionType, C : CollectionType where C.Generator.Element == R.Generator.Element>( collection: R, subRange: Range<R.Index>, with newElements: C) -> R {
    var c = collection
    c.replaceRange(subRange, with: newElements)
    return c
}

public func replaceRange<R: RangeReplaceableCollectionType, C : CollectionType where C.Generator.Element == R.Generator.Element>(subRange: Range<R.Index>, with newElements: C, collection: R) -> R {
    return replaceRange(collection, subRange: subRange, with: newElements)
}

public func insert<R: RangeReplaceableCollectionType>( collection: R, newElement: R.Generator.Element, atIndex i: R.Index) -> R {
    var c = collection
    c.insert(newElement, atIndex: i)
    return c
}

public func insert<R: RangeReplaceableCollectionType>(newElement: R.Generator.Element, atIndex i: R.Index, collection: R) -> R {
    return insert(collection, newElement: newElement, atIndex: i)
}

public func splice<R: RangeReplaceableCollectionType, S : CollectionType where S.Generator.Element == R.Generator.Element>( collection: R, newElements: S, atIndex i: R.Index) -> R {
    var c = collection
    c.insertContentsOf(newElements, at: i)
    return c
}

public func splice<R: RangeReplaceableCollectionType, S : CollectionType where S.Generator.Element == R.Generator.Element>(newElements: S, atIndex i: R.Index, collection: R) -> R {
    return splice(collection, newElements: newElements, atIndex: i)
}

public func removeAtIndex<R: RangeReplaceableCollectionType>( collection: R, i: R.Index) -> (R, R.Generator.Element) {
    var c = collection
    let element = c.removeAtIndex(i)
    return (c, element)
}

public func removeAtIndex<R: RangeReplaceableCollectionType>(i: R.Index, collection: R) -> (R, R.Generator.Element) {
    return removeAtIndex(collection, i: i)
}

public func removeRange<R: RangeReplaceableCollectionType>( collection: R, subRange: Range<R.Index>) -> R {
    var c = collection
    c.removeRange(subRange)
    return c
}

public func removeRange<R: RangeReplaceableCollectionType>(subRange: Range<R.Index>, collection: R) -> R {
    return removeRange(collection, subRange: subRange)
}

//
// MARK: MutableCollectionType
//

public func replace<C: MutableCollectionType>( collection: C, newElement: C.Generator.Element, atIndex i: C.Index) -> C {
    var c = collection
    c[i] = newElement
    return c
}

public func replace<C: MutableCollectionType>(newElement: C.Generator.Element, atIndex i: C.Index, collection: C) -> C {
    return replace(collection, newElement: newElement, atIndex: i)
}

//
// MARK: Dictionary Stuff
//

/// Update the value stored in the dictionary for the given key, or, if they
/// key does not exist, add a new key-value pair to the dictionary.
///
/// Returns the new dictionary, and the value that was replaced, or `nil` if a new key-value pair
/// was added.
public func updateValue<T,U>( dictionary: [T:U], value: U, forKey key: T) -> ([T:U], oldValue: U?) {
    var d = dictionary
    let result = d.updateValue(value, forKey: key)
    return (dictionary, result)
}

/// Update the value stored in the dictionary for the given key, or, if they
/// key does not exist, add a new key-value pair to the dictionary.
///
/// Returns the new dictionary, and the value that was replaced, or `nil` if a new key-value pair
/// was added.
public func updateValue<T,U>(value: U, forKey key: T, dictionary: [T:U]) -> ([T:U], oldValue: U?) {
    return updateValue(dictionary, value: value, forKey: key)
}

/// Returns the `Index` for the given key, or `nil` if the key is not
/// present in the dictionary.
public func getValue<T,U>(dictionary: [T:U], forKey key: T) -> U? {
    return dictionary[key]
}

/// Returns the `Index` for the given key, or `nil` if the key is not
/// present in the dictionary.
public func getValue<T,U>(forKey key: T, dictionary: [T:U]) -> U? {
    return dictionary[key]
}

/// Puts the given `value` under `key` in `dictionary` unless `key` already exists.
public func putNewValue<T,U>( dictionary: [T:U], value: U, forKey key: T) -> [T:U] {
    if let _ = dictionary[key] {
        return dictionary
    }
    else {
        var d = dictionary
        d[key] = value
        return d
    }
}

/// Puts the given `value` under `key` in `dictionary` unless `key` already exists.
public func putNewValue<T,U>(value: U, forKey key: T, dictionary: [T:U]) -> [T:U] {
    return putNewValue(dictionary, value: value, forKey: key)
}

/// Remove a given key and the associated value from the dictionary.
/// Returns the updated dictionary and value that was removed, or `nil` if the key was not present
/// in the dictionary.
public func removeValueForKey<T,U>( dictionary: [T:U], key: T) -> ([T:U], removed: U?) {
    var d = dictionary
    let result = d.removeValueForKey(key)
    return (d, result)
}

/// Remove a given key and the associated value from the dictionary.
/// Returns the updated dictionary and value that was removed, or `nil` if the key was not present
/// in the dictionary.
public func removeValueForKey<T,U>(key: T, dictionary: [T:U]) -> ([T:U], removed: U?) {
    return removeValueForKey(dictionary, key: key)
}