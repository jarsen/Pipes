//
//  Created by Jason Larsen on 4/27/15.
//

import Foundation

infix operator <| { precedence 100 associativity right }

public func <|<A,Z>(lhs: (A)->Z, rhs: A) -> Z {
    return lhs(rhs)
}
