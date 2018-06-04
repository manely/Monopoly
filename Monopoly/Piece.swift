//
//  Piece.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class Piece {
    let identifier: UInt8
    let name: String
    weak var square: Square?
    
    convenience init(id: UInt8) {
        self.init(id: id, name: "Piece " + String(id))
    }
    
    init(id: UInt8, name: String) {
        self.identifier = id
        self.name = name
    }
    
    func move(offset offsetValue: Int) {
        self.square?.board?.offset(square: &square!, by: offsetValue)
    }
}
