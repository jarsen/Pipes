//
//  Created by Jason Larsen on 4/27/15.
//

import XCTest
import Pipes

class BackwardPipeTests : XCTestCase {
    func testPipeOperatorWorks() {
        let increment: (Int)->Int = { x in x + 1 }
        let value = increment <| 4
        expect(value) == 5
    }
    
    func testOrderOfOperations() {
        let increment: (Int)->Int = { x in x + 1 }
        let double: (Int)->Int = {x in x*2}
        
        var value = double <| 2 + 4
        expect(value) == 12

        value = double <| increment <| 2
        expect(value) == 6
    }
}
