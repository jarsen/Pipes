//
//  Created by Jason Larsen on 4/28/15.
//

import Foundation
import Result

// First argument

public func |> <A,Z,Error>(lhs: Result<A, Error>, rhs: A -> Z) -> Result<Z, Error> {
    return lhs.map(rhs)
}

public func |> <A,B,Z,Error>(lhs: Result<A, Error>, rhs: ((A, B) -> Z, B)) -> Result<Z, Error> {
    return lhs.map { rhs.0($0, rhs.1) }
}

public func |> <A,B,C,Z,Error>(lhs: Result<A, Error>, rhs: (((A, B, C) -> Z), B, C)) -> Result<Z, Error> {
    return lhs.map { rhs.0($0, rhs.1, rhs.2) }
}

public func |> <A,B,C,D,Z,Error>(lhs: Result<A, Error>, rhs: (((A, B, C, D) -> Z), B, C, D)) -> Result<Z, Error> {
    return lhs.map { rhs.0($0, rhs.1, rhs.2, rhs.3) }
}

public func |> <A,B,C,D,E,Z,Error>(lhs: Result<A, Error>, rhs: (((A, B, C, D, E) -> Z), B, C, D, E)) -> Result<Z, Error> {
    return lhs.map { rhs.0($0, rhs.1, rhs.2, rhs.3, rhs.4) }
}