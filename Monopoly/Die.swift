//
//  Die.swift
//  Monopoly
//
//  Created by Mani Hamedani on 6/4/18.
//  Copyright © 2018 Manely. All rights reserved.
//

import Foundation

enum DiceFaceValue: UInt8 {
    case one = 1
    case two
    case three
    case four
    case five
    case six
}

class Die {
    var faceValue: UInt8 = 1
    
    func roll() {
        faceValue = UInt8(arc4random_uniform(6)) + 1
    }
}

class Dice {
    let die1 = Die()
    let die2 = Die()

    var faceValue: UInt8 {
        return die1.faceValue + die2.faceValue
    }
    
    func roll() {
        die1.roll()
        die2.roll()
    }
}
