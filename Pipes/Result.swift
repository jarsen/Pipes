//
//  Created by Jason Larsen on 4/28/15.
//

import Foundation

public enum Result<T> {
    case ok(T)
    case error(ErrorProtocol)
    
    public func map<U>(_ f: (T)->U) -> Result<U> {
        switch self {
        case let .ok(x):
            return .ok(f(x))
        case let .error(e):
            return .error(e)
        }
    }
}

// First argument

public func |> <A,Z>(lhs: Result<A>, rhs: (A) -> Z) -> Result<Z> {
    return lhs.map(rhs)
}

public func |> <A,B,Z>(lhs: Result<A>, rhs: ((A, B) -> Z, B)) -> Result<Z> {
    return lhs.map { rhs.0($0, rhs.1) }
}

public func |> <A,B,C,Z>(lhs: Result<A>, rhs: (((A, B, C) -> Z), B, C)) -> Result<Z> {
    return lhs.map { rhs.0($0, rhs.1, rhs.2) }
}

public func |> <A,B,C,D,Z>(lhs: Result<A>, rhs: (((A, B, C, D) -> Z), B, C, D)) -> Result<Z> {
    return lhs.map { rhs.0($0, rhs.1, rhs.2, rhs.3) }
}

public func |> <A,B,C,D,E,Z>(lhs: Result<A>, rhs: (((A, B, C, D, E) -> Z), B, C, D, E)) -> Result<Z> {
    return lhs.map { rhs.0($0, rhs.1, rhs.2, rhs.3, rhs.4) }
}
