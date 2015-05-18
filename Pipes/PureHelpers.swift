//
//  Created by Jason Larsen on 5/18/15.
//

import Foundation

//
// MARK: Sequence
//

public func map<S: SequenceType, T>(f: S.Generator.Element->T)(seq: S) -> [T] {
    return map(seq, f)
}

public func filter<S: SequenceType>(f: S.Generator.Element->Bool)(seq: S) -> [S.Generator.Element] {
    return filter(seq, f)
}

public func reduce<S : SequenceType, U>(initial: U, @noescape f: (U, S.Generator.Element) -> U)(seq: S) -> U {
    return reduce(seq, initial, f)
}

//
// MARK: ExtensibleCollectionType
//

public func extend<S: SequenceType, C: ExtensibleCollectionType where S.Generator.Element == C.Generator.Element>(var collection: C, newElements: S) -> C {
    collection.extend(newElements)
    return collection
}

public func extend<S: SequenceType, C: ExtensibleCollectionType where S.Generator.Element == C.Generator.Element>(newElements: S)(collection: C) -> C {
    return extend(collection, newElements)
}

public func append<C: ExtensibleCollectionType>(var collection: C, newElement: C.Generator.Element) -> C {
    collection.append(newElement)
    return collection
}

public func append<C: ExtensibleCollectionType>(newElement: C.Generator.Element)(collection: C) -> C {
    return append(collection, newElement)
}

//
// MARK: RangeReplaceableCollectionType
//

public func replaceRange<R: RangeReplaceableCollectionType, C : CollectionType where C.Generator.Element == R.Generator.Element>(var collection: R, subRange: Range<R.Index>, with newElements: C) -> R {
    collection.replaceRange(subRange, with: newElements)
    return collection
}

public func replaceRange<R: RangeReplaceableCollectionType, C : CollectionType where C.Generator.Element == R.Generator.Element>(subRange: Range<R.Index>, with newElements: C)(collection: R) -> R {
    return replaceRange(collection, subRange, with: newElements)
}

public func insert<R: RangeReplaceableCollectionType>(var collection: R, newElement: R.Generator.Element, atIndex i: R.Index) -> R {
    collection.insert(newElement, atIndex: i)
    return collection
}

public func insert<R: RangeReplaceableCollectionType>(newElement: R.Generator.Element, atIndex i: R.Index)(collection: R) -> R {
    return insert(collection, newElement, atIndex: i)
}

public func splice<R: RangeReplaceableCollectionType, S : CollectionType where S.Generator.Element == R.Generator.Element>(var collection: R, newElements: S, atIndex i: R.Index) -> R {
    collection.splice(newElements, atIndex: i)
    return collection
}

public func splice<R: RangeReplaceableCollectionType, S : CollectionType where S.Generator.Element == R.Generator.Element>(newElements: S, atIndex i: R.Index)(collection: R) -> R {
    return splice(collection, newElements, atIndex: i)
}

public func removeAtIndex<R: RangeReplaceableCollectionType>(var collection: R, i: R.Index) -> (R, R.Generator.Element) {
    let element = collection.removeAtIndex(i)
    return (collection, element)
}

public func removeAtIndex<R: RangeReplaceableCollectionType>(i: R.Index)(collection: R) -> (R, R.Generator.Element) {
    return removeAtIndex(collection, i)
}

public func removeRange<R: RangeReplaceableCollectionType>(var collection: R, subRange: Range<R.Index>) -> R {
    collection.removeRange(subRange)
    return collection
}

public func removeRange<R: RangeReplaceableCollectionType>(subRange: Range<R.Index>)(collection: R) -> R {
    return removeRange(collection, subRange)
}

//
// MARK: MutableCollectionType
//

public func replace<C: MutableCollectionType>(var collection: C, newElement: C.Generator.Element, atIndex i: C.Index) -> C {
    collection[i] = newElement
    return collection
}

public func replace<C: MutableCollectionType>(newElement: C.Generator.Element, atIndex i: C.Index)(collection: C) -> C {
    return replace(collection, newElement, atIndex: i)
}

//
// MARK: Dictionary Stuff
//

public func updateValue<T,U>(var dictionary: [T:U], value: U, forKey key: T) -> ([T:U], U?) {
    let result = dictionary.updateValue(value, forKey: key)
    return (dictionary, result)
}

public func updateValue<T,U>(value: U, forKey key: T)(dictionary: [T:U]) -> ([T:U], U?) {
    return updateValue(dictionary, value, forKey: key)
}

public func getValue<T,U>(dictionary: [T:U], forKey key: T) -> U? {
    return dictionary[key]
}

public func getValue<T,U>(forKey key: T)(dictionary: [T:U]) -> U? {
    return dictionary[key]
}

public func putValue<T,U>(var dictionary: [T:U], value: U, forKey key: T) -> [T:U] {
    dictionary[key] = value
    return dictionary
}

public func putValue<T,U>(value: U, forKey key: T)(var dictionary: [T:U]) -> [T:U] {
    dictionary[key] = value
    return dictionary
}

public func putNewValue<T,U>(var dictionary: [T:U], value: U, forKey key: T) -> [T:U] {
    if let _ = dictionary[key] {
        return dictionary
    }
    else {
        dictionary[key] = value
        return dictionary
    }
}

public func putNewValue<T,U>(value: U, forKey key: T)(dictionary: [T:U]) -> [T:U] {
    return putNewValue(dictionary, value, forKey: key)
}
