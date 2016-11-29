//
//  Created by Jason Larsen on 4/27/15.
//

import Foundation

infix operator |> { precedence 100 associativity left } // Forward pipe operator
infix operator |>> { precedence 100 associativity left } // Pipe into second argument
infix operator |>>> { precedence 100 associativity left } // Pipe into third argument
infix operator |< { precedence 100 associativity left } // Pipe into last argument

// MARK: First argument

public func |> <A,Z>(lhs: A, rhs: (A) -> Z) -> Z {
    return rhs(lhs)
}

public func |> <A,B,Z>(lhs: A, rhs: ((A, B) -> Z, B)) -> Z {
    return rhs.0(lhs, rhs.1)
}

public func |> <A,B,C,Z>(lhs: A, rhs: (((A, B, C) -> Z), B, C)) -> Z {
    return rhs.0(lhs, rhs.1, rhs.2)
}

public func |> <A,B,C,D,Z>(lhs: A, rhs: (((A, B, C, D) -> Z), B, C, D)) -> Z {
    return rhs.0(lhs, rhs.1, rhs.2, rhs.3)
}

public func |> <A,B,C,D,E,Z>(lhs: A, rhs: (((A, B, C, D, E) -> Z), B, C, D, E)) -> Z {
    return rhs.0(lhs, rhs.1, rhs.2, rhs.3, rhs.4)
}

public func |> <A,B,C,D,E,F,Z>(lhs: A, rhs: (((A, B, C, D, E, F) -> Z), B, C, D, E, F)) -> Z {
    return rhs.0(lhs, rhs.1, rhs.2, rhs.3, rhs.4, rhs.5)
}

// MARK: Second argument

public func |>> <A,B,Z>(lhs: B, rhs: ((A, B) -> Z, A)) -> Z {
    return rhs.0(rhs.1, lhs)
}

public func |>> <A,B,C,Z>(lhs: B, rhs: (((A, B, C) -> Z), A, C)) -> Z {
    return rhs.0(rhs.1, lhs, rhs.2)
}

public func |>> <A,B,C,D,Z>(lhs: B, rhs: (((A, B, C, D) -> Z), A, C, D)) -> Z {
    return rhs.0(rhs.1, lhs, rhs.2, rhs.3)
}

public func |>> <A,B,C,D,E,Z>(lhs: B, rhs: (((A, B, C, D, E) -> Z), A, C, D, E)) -> Z {
    return rhs.0(rhs.1, lhs, rhs.2, rhs.3, rhs.4)
}

public func |>> <A,B,C,D,E,F,Z>(lhs: B, rhs: (((A, B, C, D, E, F) -> Z), A, C, D, E, F)) -> Z {
    return rhs.0(rhs.1, lhs, rhs.2, rhs.3, rhs.4, rhs.5)
}

// MARK: Third argument

public func |>>> <A,B,C,Z>(lhs: C, rhs: (((A, B, C) -> Z), A, B)) -> Z {
    return rhs.0(rhs.1, rhs.2, lhs)
}

public func |>>> <A,B,C,D,Z>(lhs: C, rhs: (((A, B, C, D) -> Z), A, B, D)) -> Z {
    return rhs.0(rhs.1, rhs.2, lhs, rhs.3)
}

public func |>>> <A,B,C,D,E,Z>(lhs: C, rhs: (((A, B, C, D, E) -> Z), A, B, D, E)) -> Z {
    return rhs.0(rhs.1, rhs.2, lhs, rhs.3, rhs.4)
}

public func |>>> <A,B,C,D,E,F,Z>(lhs: C, rhs: (((A, B, C, D, E, F) -> Z), A, B, D, E, F)) -> Z {
    return rhs.0(rhs.1, rhs.2, lhs, rhs.3, rhs.4, rhs.5)
}

// MARK: Last Argument

public func |< <A,Z>(lhs: A, rhs: (A) -> Z) -> Z {
    return rhs(lhs)
}

public func |< <A,B,Z>(lhs: B, rhs: ((A, B) -> Z, A)) -> Z {
    return rhs.0(rhs.1, lhs)
}

public func |< <A,B,C,Z>(lhs: C, rhs: (((A, B, C) -> Z), A, B)) -> Z {
    return rhs.0(rhs.1, rhs.2, lhs)
}

public func |< <A,B,C,D,Z>(lhs: D, rhs: (((A, B, C, D) -> Z), A, B, C)) -> Z {
    return rhs.0(rhs.1, rhs.2, rhs.3, lhs)
}

public func |< <A,B,C,D,E,Z>(lhs: E, rhs: (((A, B, C, D, E) -> Z), A, B, C, D)) -> Z {
    return rhs.0(rhs.1, rhs.2, rhs.3, rhs.4, lhs)
}

public func |< <A,B,C,D,E,F,Z>(lhs: F, rhs: (((A, B, C, D, E, F) -> Z), A, B, C, D, E)) -> Z {
    return rhs.0(rhs.1, rhs.2, rhs.3, rhs.4, rhs.5, lhs)
}
