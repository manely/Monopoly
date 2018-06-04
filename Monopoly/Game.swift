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
    let numberOfPlayers: Int
    var pieces = [Piece]()
    var players = [Player]()
    var currentPlayer: Player?
    
    /// A `PlayerQueue` to manage the player turns, one after the other.
    ///
    /// This should be initialized after player turns is specified, e.g. by rolling the dice and based on the largest face value.
    var playersQueue = PlayerQueue()
    
    init(numberOfPlayers: Int) {
        assert(numberOfPlayers >= 2 && numberOfPlayers <= 8, "Game.init(\(numberOfPlayers)), numberOfPlayers should be between 2 and 8")
        self.numberOfPlayers = numberOfPlayers
    }
    
    /// Sets up the game by initializing players, and the board. Player turns must be set after setting up the game.
    ///
    /// TODO: After creating players and setting up the board, each player must choose a piece and then roll the dice to determine the turns.
    /// In a real game, choosing pieces and determining the turns must be separate processes than the initial setUp, but as we are modelling a simulation, we are doing it in this function.
    func setUp() {
        // Setup the board
        board.setUp()
        
        // Setup the pieces
        self.setUpPieces()
        
        // Setup players and their pieces
        // TODO: Currently the player 1 has piece 1, player 2 has piece 2, and ... . This can later be changed to consider the player's choice.
        for index in 1...numberOfPlayers {
            players.append(Player(id: UInt8(index), piece: pieces[index - 1]))
        }
        
        // Setting the players turn
        // TODO: The following line just fills the players queue. It has nothing to do with determining the order of playing for each player.
        fillPlayersQueue()
        
        // Put each playes piece on the Go square
        // FIXME: This makes the `Game` dependent on `Square`, which is not good. Find a better solution!
        for player in players {
            player.piece?.square = board.squares[0]
        }
    }
    
    func playRound() {
        for _ in 1...numberOfPlayers {
            // Take a player as the current player
            currentPlayer = playersQueue.pop()
            
            // Roll the dice
            dice.roll()
            
            // Move the player as the sum of dice face value
            currentPlayer?.move(offset: Int8(dice.faceValue))
        }
        
        // TODO: The current design using `PlayerQueue` enforces to fill the queue after or before each round, as we need to pop the player from queue. We can use a circular data structure to remove this need, e.g. a circular linked-list.
        fillPlayersQueue()
    }
    
    private func setUpPieces() {
        for index in 0...7 {
            pieces.append(Piece(id: UInt8(index + 1)))
        }
    }
    
    private func fillPlayersQueue() {
        // TODO: Currently the players are added to the queue based on their index. Later it can be changed to determine the turns based on the dice face values.
        // Also, note that there are two copies of the same players array; i.e. `PlayerQueue` is useless and we can directly use the `players` array. But I prefer to write the `playRound()` method based on the `PlayerQueue`, so as there is no need to change it later.
        // The `PlayerQueue` can be optimized by using `ArraySlice`.
        for player in players {
            playersQueue.push(player: player)
        }
    }
}
