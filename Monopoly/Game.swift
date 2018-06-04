//
//  Game.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

/// Represents the Monopoly game.
class Game {
    let board = Board()
    let dice = Dice()
    let numberOfPlayers: UInt8
    var pieces = [Piece]()
    var players = [Player]()
    var currentPlayer: Player?
    
    /// A `PlayerQueue` to manage the player turns, one after the other.
    ///
    /// This should be initialized after player turns is specified, e.g. by rolling the dice and based on the largest face value.
    var playersQueue = PlayerQueue()
    
    init(numberOfPlayers: UInt8) {
        assert(numberOfPlayers >= 2 && numberOfPlayers <= 8, "Game.init(\(numberOfPlayers)), numberOfPlayers should be between 2 and 8")
        self.numberOfPlayers = numberOfPlayers
    }
    
    /// Sets up the game by initializing players, and the board. Player turns must be set after setting up the game.
    ///
    /// TODO: After creating players and setting up the board, each player must choose a piece and then roll the dice to determine the turns.
    /// In a real game, choosing pieces and determining the turns must be separate processes than the initial setUp, but as we are modelling a simulation, we are doing it in this function.
    func setUp() {
        // Setup players
        for index in 1...numberOfPlayers {
            players.append(Player(id: index))
        }
        
        // Setup the board
        board.setUp()
        
        // Setup the pieces
        
        
        // Setting the players pieces
        
        // Setting the players turn
    
    }
    
    func playRound() {
        // Take a player as the current player
        
        // Roll the dice
        dice.roll()
        
        // Move the player as the sum of dice face value
        currentPlayer?.move(offset: Int8(dice.faceValue))
    }
    
    private func setUpPieces() {
        for index in 0...7 {
            pieces.append(Piece(id: UInt8(index + 1)))
        }
    }
}
