//
//  Board.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class Board {
    var squares = [Square]()
    
    init() {
        self.setUp()
    }
    
    func setUp() {
        for index in 0...39 {
            squares.append(Square(id: UInt8(index)))
        }
    }
}

