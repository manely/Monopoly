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
    static let initialCashValue = 1300 // Reducing 200 at the beginning, as the `Game` places this instance on the Go square and cash is increased to 1500, which is the desired initial cash value.
    let identifier: UInt8
    let name: String
    var piece: Piece?
    var cash: Int {
        didSet {
            print("The player \(identifier)'s cash is now: \(cash)")
        }
    }
    
    var netWorth: Int {
        // TODO: Currently, there is no property and buying or selling process. So, the net worth of a player is its cash.
        return self.cash
    }
    
    convenience init(id: UInt8) {
        self.init(id: id, name: "Player " + String(id))
    }

    init(id: UInt8, name: String) {
        self.identifier = id
        self.name = name
        self.cash = Player.initialCashValue
        self.piece = Piece(id: id, name: name, player: self)
    }
    
    func takeTurn(moveOffset value: Int) {
        print("\(self.name) is moving from \(String(describing: self.piece?.square?.title))")
        piece?.move(offset: value)
        print("\(self.name) has moved to \(String(describing: self.piece?.square?.title))")
    }
}
