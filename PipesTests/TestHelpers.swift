//
//  Created by Jason Larsen on 4/27/15.
//

import XCTest

func expect<T: Equatable>(_ value: T, file: String = #file, line: Int = #line) -> (T, String, Int) {
    return (value, file, line)
}

func ==<T: Equatable>(lhs: (T, String, Int), rhs: T) {
    if lhs.0 != rhs {
        XCTFail("Expected \(rhs), but got \(lhs.0) instead", file: lhs.1, line: UInt(lhs.2))
    }
}

func !=<T: Equatable>(lhs: (T, String, Int), rhs: T) {
    if lhs.0 == rhs {
        XCTFail("Expected \(rhs), but got \(lhs.0) instead", file: lhs.1, line: UInt(lhs.2))
    }
}
