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
    
    var first: Player? {
        assert(!elements.isEmpty, "The PlayerQueue is empty")
        return elements.first
    }
    
    var empty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func push(player: Player) {
        elements.append(player)
    }
    
    func pop() -> Player {
        assert(!elements.isEmpty, "The PlayerQueue is empty")
        return elements.removeFirst()
    }
    
}
