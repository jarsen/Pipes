//
//  Array+Helpers.swift
//  Pipes
//
//  Created by Jason Larsen on 6/16/16.
//  Copyright © 2016 Jason Larsen. All rights reserved.
//

import Foundation

extension Array {
    
    static func append(_ newElement: Element) -> ([Element]) -> [Element] {
        return { array in
            var a = array
            a.append(newElement)
            return a
        }
    }
    
    static func append(contentsOf newElements: [Element]) -> ([Element]) -> [Element] {
        return { array in
            var a = array
            a.append(contentsOf: newElements)
            return a
        }
    }
    
}
