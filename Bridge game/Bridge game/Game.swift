//
//  Game.swift
//  Bridge game
//
//  Created by Giuseppe Diciolla on 13/05/21.
//

import Foundation

struct Game {
    var playedClicks: Int
    var totalClicks: Int
    var grid: [Int]
    init() {
        self.playedClicks = 0
        self.totalClicks = 10
        self.grid = [0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0,
                     0, 0, 0, 0, 0]
    }
}
