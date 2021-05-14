//
//  GameManager.swift
//  Bridge game
//
//  Created by Giuseppe Diciolla on 13/05/21.
//

import Foundation
import UIKit

class GameManager {
    
    static let borderIndex = [0, 4, 5, 9, 10, 14, 15, 19, 20, 24]
    
    static func resetGame() -> Game {
        
        let newGame = Game()
        
        return newGame
    }
    
    static func cellPressed(cell: Int, collView: UICollectionView, game: inout  Game) {
        
        var index = cell
        while(index < 25){
            
            game.grid[index] = 1
            // if the cell under is blue stop
            if(index + 5 > 24 || game.grid[index + 5] == 1){
                break
            }
            
            // check if you are a border or not
            if(GameManager.borderIndex.contains(index)){
                game.grid[index] = 0
                index = index + 5
            } else {
                if(game.grid[index + 1] == 1 && game.grid[index + 1] == 1){
                    break
                } else {
                    game.grid[index] = 0
                    index = index + 5
                }
            }
        }

        collView.reloadData()
    }
}
