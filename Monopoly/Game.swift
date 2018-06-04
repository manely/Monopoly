//
//  Game.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

class Game {
    let board = Board()
    let players = [Player]()
    let dice = Dice()
    let numberOfPlayers: UInt8
    var currentPlayer: Player?
    var playersQueue = PlayerQueue()
    
    init(numberOfPlayers: UInt8) {
        assert(numberOfPlayers >= 2 && numberOfPlayers <= 8, "Game.init(\(numberOfPlayers)), numberOfPlayers should be between 2 and 8")
        self.numberOfPlayers = numberOfPlayers
    }
    
    func setUp() {
        // Setup players
        for index in 1...numberOfPlayers {
            
        }
        
        // Setup the board
        board.setUp()
    }
    
    func playRound() {
        // Take a player as the current player
        
        // Roll the dice
        dice.roll()
        
        // Move the player as the sum of dice face value
        currentPlayer?.move(offset: Int8(dice.faceValue))
    }
}
