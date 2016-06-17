//
//  Dictionary+Helpers.swift
//  Pipes
//
//  Created by Jason Larsen on 6/16/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation

//
// MARK: Dictionary Stuff
//

///// Update the value stored in the dictionary for the given key, or, if they
///// key does not exist, add a new key-value pair to the dictionary.
/////
///// Returns the new dictionary, and the value that was replaced, or `nil` if a new key-value pair
///// was added.
//public func updateValue<T,U>(_ dictionary: [T:U], value: U, forKey key: T) -> ([T:U], oldValue: U?) {
//    var dictionary = dictionary
//    let result = dictionary.updateValue(value, forKey: key)
//    return (dictionary, result)
//}
//
///// Update the value stored in the dictionary for the given key, or, if they
///// key does not exist, add a new key-value pair to the dictionary.
/////
///// Returns the new dictionary, and the value that was replaced, or `nil` if a new key-value pair
///// was added.
//public func updateValue<T,U>(_ value: U, forKey key: T, _ dictionary: [T:U]) -> ([T:U], oldValue: U?) {
//    return updateValue(dictionary, value, forKey: key)
//}
//
///// Returns the `Index` for the given key, or `nil` if the key is not
///// present in the dictionary.
//public func getValue<T,U>(_ dictionary: [T:U], forKey key: T) -> U? {
//    return dictionary[key]
//}
//
///// Returns the `Index` for the given key, or `nil` if the key is not
///// present in the dictionary.
//public func getValue<T,U>(forKey key: T, _ dictionary: [T:U]) -> U? {
//    return dictionary[key]
//}
//
///// Puts the given `value` under `key` in `dictionary` unless `key` already exists.
//public func putNewValue<T,U>(_ dictionary: [T:U], value: U, forKey key: T) -> [T:U] {
//    var dictionary = dictionary
//    if let _ = dictionary[key] {
//        return dictionary
//    }
//    else {
//        dictionary[key] = value
//        return dictionary
//    }
//}
//
///// Puts the given `value` under `key` in `dictionary` unless `key` already exists.
//public func putNewValue<T,U>(_ value: U, forKey key: T, _ dictionary: [T:U]) -> [T:U] {
//    return putNewValue(dictionary, value, forKey: key)
//}
//
///// Remove a given key and the associated value from the dictionary.
///// Returns the updated dictionary and value that was removed, or `nil` if the key was not present
///// in the dictionary.
//public func removeValueForKey<T,U>(_ dictionary: [T:U], key: T) -> ([T:U], removed: U?) {
//    var dictionary = dictionary
//    let result = dictionary.removeValue(forKey: key)
//    return (dictionary, result)
//}
//
///// Remove a given key and the associated value from the dictionary.
///// Returns the updated dictionary and value that was removed, or `nil` if the key was not present
///// in the dictionary.
//public func removeValueForKey<T,U>(_ key: T, _ dictionary: [T:U]) -> ([T:U], removed: U?) {
//    return removeValueForKey(dictionary, key)
//}
