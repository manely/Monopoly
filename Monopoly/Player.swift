//
//  Player.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

/// Represents a player in the Monopoly game. 
class Player {
    let identifier: UInt8
    var piece: Piece?
    
    private(set) var name: String {
        get {
            return "Player " + String(identifier)
        }
        set {
        }
    }
    

    init(id: UInt8) {
        self.identifier = id
    }
    
//    init(name: String) {
//    }
    
    func move(offset: Int8) {
        piece?.move()
    }
}
