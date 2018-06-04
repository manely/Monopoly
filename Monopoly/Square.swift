//
//  Square.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

/// Represents a square and used to model the squares around the board game. 
class Square {
    var identifier: UInt8 = 0
    var title: String {
        return "Square " + String(self.identifier)
    }
    
    init(id: UInt8) {
        self.identifier = id
    }
}
