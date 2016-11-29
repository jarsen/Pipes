//
//  Created by Jason Larsen on 4/28/15.
//

import Foundation

// First argument

public func |> <A,Z>(lhs: A?, rhs: (A) -> Z) -> Z? {
    return lhs.map(rhs)
}

public func |> <A,B,Z>(lhs: A?, rhs: ((A, B) -> Z, B)) -> Z? {
    return lhs.map { rhs.0($0, rhs.1) }
}

public func |> <A,B,C,Z>(lhs: A?, rhs: (((A, B, C) -> Z), B, C)) -> Z? {
    return lhs.map { rhs.0($0, rhs.1, rhs.2) }
}

public func |> <A,B,C,D,Z>(lhs: A?, rhs: (((A, B, C, D) -> Z), B, C, D)) -> Z? {
    return lhs.map { rhs.0($0, rhs.1, rhs.2, rhs.3) }
}

public func |> <A,B,C,D,E,Z>(lhs: A?, rhs: (((A, B, C, D, E) -> Z), B, C, D, E)) -> Z? {
    return lhs.map { rhs.0($0, rhs.1, rhs.2, rhs.3, rhs.4) }
}
