//
//  Queue.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

/// A simple queue structure for holding players according to their turn.
class PlayerQueue {
    var elements: [Player] = [] // To make a better performance, we can use an array slice
    
    func push(player: Player) {
        elements.append(player)
    }
    
    func pop() -> Player {
        assert(!elements.isEmpty, "The PlayerQueue is empty")
        return elements.removeFirst()
    }
    
    func first() -> Player? {
        assert(!elements.isEmpty, "The PlayerQueue is empty")
        return elements.first
    }
    
    func empty() -> Bool {
        return elements.isEmpty
    }
    
    func count() -> Int {
        return elements.count
    }
}
