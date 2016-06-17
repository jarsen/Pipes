//
//  Created by Jason Larsen on 5/18/15.
//

import Foundation

//
// MARK: Sequence
//

public func map<S: Sequence, T>(_ f: (S.Iterator.Element)->T, _ seq: S) -> [T] {
    return map(seq, f)
}

public func filter<S: Sequence>(_ f: (S.Iterator.Element)->Bool, _ seq: S) -> [S.Iterator.Element] {
    return filter(seq, f)
}

public func reduce<S : Sequence, U>(_ initial: U, @noescape f: (U, S.Iterator.Element) -> U, _ seq: S) -> U {
    return reduce(seq, initial, f)
}

//
// MARK: ExtensibleCollectionType
//

public func extend<S: Sequence, C: ExtensibleCollectionType where S.Iterator.Element == C.Generator.Element>(_ collection: C, newElements: S) -> C {
    var collection = collection
    collection.extend(newElements)
    return collection
}

public func extend<S: Sequence, C: ExtensibleCollectionType where S.Iterator.Element == C.Generator.Element>(_ newElements: S, _ collection: C) -> C {
    return extend(collection, newElements)
}

public func append<C: ExtensibleCollectionType>(_ collection: C, newElement: C.Generator.Element) -> C {
    var collection = collection
    collection.append(newElement)
    return collection
}

public func append<C: ExtensibleCollectionType>(_ newElement: C.Generator.Element, _ collection: C) -> C {
    return append(collection, newElement)
}

//
// MARK: RangeReplaceableCollectionType
//

public func replaceRange<R: RangeReplaceableCollection, C : Collection where C.Iterator.Element == R.Iterator.Element>(_ collection: R, subRange: Range<R.Index>, with newElements: C) -> R {
    var collection = collection
    collection.replaceSubrange(subRange, with: newElements)
    return collection
}

public func replaceRange<R: RangeReplaceableCollection, C : Collection where C.Iterator.Element == R.Iterator.Element>(_ subRange: Range<R.Index>, with newElements: C, _ collection: R) -> R {
    return replaceRange(collection, subRange, with: newElements)
}

public func insert<R: RangeReplaceableCollection>(_ collection: R, newElement: R.Iterator.Element, atIndex i: R.Index) -> R {
    var collection = collection
    collection.insert(newElement, at: i)
    return collection
}

public func insert<R: RangeReplaceableCollection>(_ newElement: R.Iterator.Element, atIndex i: R.Index, _ collection: R) -> R {
    return insert(collection, newElement, atIndex: i)
}

public func splice<R: RangeReplaceableCollection, S : Collection where S.Iterator.Element == R.Iterator.Element>(_ collection: R, newElements: S, atIndex i: R.Index) -> R {
    var collection = collection
    collection.splice(newElements, atIndex: i)
    return collection
}

public func splice<R: RangeReplaceableCollection, S : Collection where S.Iterator.Element == R.Iterator.Element>(_ newElements: S, atIndex i: R.Index, _ collection: R) -> R {
    return splice(collection, newElements, atIndex: i)
}

public func removeAtIndex<R: RangeReplaceableCollection>(_ collection: R, i: R.Index) -> (R, R.Iterator.Element) {
    var collection = collection
    let element = collection.remove(at: i)
    return (collection, element)
}

public func removeAtIndex<R: RangeReplaceableCollection>(_ i: R.Index, _ collection: R) -> (R, R.Iterator.Element) {
    return removeAtIndex(collection, i)
}

public func removeRange<R: RangeReplaceableCollection>(_ collection: R, subRange: Range<R.Index>) -> R {
    var collection = collection
    collection.removeSubrange(subRange)
    return collection
}

public func removeRange<R: RangeReplaceableCollection>(_ subRange: Range<R.Index>, _ collection: R) -> R {
    return removeRange(collection, subRange)
}

//
// MARK: MutableCollectionType
//

public func replace<C: MutableCollection>(_ collection: C, newElement: C.Iterator.Element, atIndex i: C.Index) -> C {
    var collection = collection
    collection[i] = newElement
    return collection
}

public func replace<C: MutableCollection>(_ newElement: C.Iterator.Element, atIndex i: C.Index, _ collection: C) -> C {
    return replace(collection, newElement, atIndex: i)
}

//
// MARK: Dictionary Stuff
//

/// Update the value stored in the dictionary for the given key, or, if they
/// key does not exist, add a new key-value pair to the dictionary.
///
/// Returns the new dictionary, and the value that was replaced, or `nil` if a new key-value pair
/// was added.
public func updateValue<T,U>(_ dictionary: [T:U], value: U, forKey key: T) -> ([T:U], oldValue: U?) {
    var dictionary = dictionary
    let result = dictionary.updateValue(value, forKey: key)
    return (dictionary, result)
}

/// Update the value stored in the dictionary for the given key, or, if they
/// key does not exist, add a new key-value pair to the dictionary.
///
/// Returns the new dictionary, and the value that was replaced, or `nil` if a new key-value pair
/// was added.
public func updateValue<T,U>(_ value: U, forKey key: T, _ dictionary: [T:U]) -> ([T:U], oldValue: U?) {
    return updateValue(dictionary, value, forKey: key)
}

/// Returns the `Index` for the given key, or `nil` if the key is not
/// present in the dictionary.
public func getValue<T,U>(_ dictionary: [T:U], forKey key: T) -> U? {
    return dictionary[key]
}

/// Returns the `Index` for the given key, or `nil` if the key is not
/// present in the dictionary.
public func getValue<T,U>(forKey key: T, _ dictionary: [T:U]) -> U? {
    return dictionary[key]
}

/// Puts the given `value` under `key` in `dictionary` unless `key` already exists.
public func putNewValue<T,U>(_ dictionary: [T:U], value: U, forKey key: T) -> [T:U] {
    var dictionary = dictionary
    if let _ = dictionary[key] {
        return dictionary
    }
    else {
        dictionary[key] = value
        return dictionary
    }
}

/// Puts the given `value` under `key` in `dictionary` unless `key` already exists.
public func putNewValue<T,U>(_ value: U, forKey key: T, _ dictionary: [T:U]) -> [T:U] {
    return putNewValue(dictionary, value, forKey: key)
}

/// Remove a given key and the associated value from the dictionary.
/// Returns the updated dictionary and value that was removed, or `nil` if the key was not present
/// in the dictionary.
public func removeValueForKey<T,U>(_ dictionary: [T:U], key: T) -> ([T:U], removed: U?) {
    var dictionary = dictionary
    let result = dictionary.removeValue(forKey: key)
    return (dictionary, result)
}

/// Remove a given key and the associated value from the dictionary.
/// Returns the updated dictionary and value that was removed, or `nil` if the key was not present
/// in the dictionary.
public func removeValueForKey<T,U>(_ key: T, _ dictionary: [T:U]) -> ([T:U], removed: U?) {
    return removeValueForKey(dictionary, key)
}
