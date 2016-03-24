//
//  Created by Jason Larsen on 4/27/15.
//

import Foundation

import XCTest
import Pipes
import Result

enum TestError: ErrorType {
    case NotEven
}

class FowardPipeTests : XCTestCase {
    func testFirstArgumentPipe() {
        let f: (Int, Int, Int) -> Int = { x, _, _ in x }
        let value = 1 |> (f, 2, 3)
        XCTAssertEqual(value, 1)
    }
    
    func testSecondArgumentPipe() {
        let f: (Int, Int, Int) -> Int = { _, x, _ in x }
        let value = 2 |>> (f, 1, 3)
        XCTAssertEqual(value, 2)
    }
    
    func testThirdArgument() {
        let f: (Int, Int, Int) -> Int = { $2 }
        let value = 3 |>>> (f, 1, 2)
        XCTAssertEqual(value, 3)
    }
    
    func testLastArgumentPipe() {
        let f1: (Int) -> Int = { $0 }
        let f2: (Int, Int) -> Int = { $1 }
        let f3: (Int, Int, Int) -> Int = { $2 }
        let f4: (Int, Int, Int, Int) -> Int = { $3 }
        
        XCTAssertEqual(1 |< f1, 1)
        XCTAssertEqual(2 |< (f2, 1), 2)
        XCTAssertEqual(3 |< (f3, 1, 2), 3)
        XCTAssertEqual(4 |< (f4, 1, 2, 3), 4)
    }
    
    func testOrderOfOperations() {
        let increment: Int->Int = { x in x + 1 }
        let double: Int->Int = {x in x*2}
        
        var value = 2 + 4 |> double
        XCTAssertEqual(value, 12)
        
        value = 2
            |> increment
            |> double
        XCTAssertEqual(value, 6)
    }
    
    func testResultPipe() {
        let even: Int -> Result<Int, TestError> = { x in
            if x % 2 == 0 {
                return .Success(x)
            }
            else {
                return .Failure(TestError.NotEven)
            }
        }
        
        var result = 2 |> even
        switch result {
        case let .Success(value):
            XCTAssertEqual(value, 2)
        case .Failure:
            XCTFail("should not have failed")
        }
        
        result = 3 |> even
        switch result {
        case .Success:
            XCTFail("pipe should have short circuited")
        case .Failure:
            break
        }
    }

}
