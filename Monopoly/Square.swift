//
//  Square.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

/// An abstract base class which epresents a square and used to model the squares around the board game. 
class Square {
    var identifier: Int = 0
    weak var board: Board?
    var players: [Player?] = []
    
    var title: String {
        return "Square " + String(self.identifier)
    }
    
    init(id: Int, board: Board) {
        self.identifier = id
        self.board = board
    }
    
    func place(player: Player) {
        assert(players.count < 8, "Square.place(piece:), can not add more than 8 pieces on a square.") // For the sake of defensive programming
        player.square?.remove(player: player)
        self.players.append(player)
        player.square = self
    }
    
    func remove(player: Player) {
        let index = self.players.index(where: { $0 == player })
        assert(index != nil, "Square.remove(player: \(player), the player is not on the current square.") // For the sake of defensive programming
        if let index = index {
            self.players.remove(at: index)
            player.square = nil
        }
    }
}
