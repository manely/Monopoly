//
//  Piece.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class Piece {
    let name: String
    weak var square: Square?
    
    init(name: String) {
        self.name = name
    }
    
    func move() {
    }
}
