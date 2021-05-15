//
//  GameManager.swift
//  Bridge game
//
//  Created by Giuseppe Diciolla on 13/05/21.
//

import Foundation
import UIKit

class GameManager {
    
    static let borderLeft = [0, 5, 10, 15, 20]
    static let borderRight = [4, 9, 14, 19, 24]
    
    static func isBorder(index: Int) -> Bool {
        if(GameManager.borderLeft.contains(index) || GameManager.borderRight.contains(index)){
            return true
        } else {
            return false
        }
    }
    
    static func resetGame() -> Game {
        
        let newGame = Game()
        
        return newGame
    }
    
    static func cellPressed(cell: Int, collView: UICollectionView, game: inout  Game) {
        
        var index = cell % 5
        print(index)
        while(index < 25){
            
            game.grid[index] = 1
            // if the cell under is blue stop
            if(index + 5 < 25 && game.grid[index + 5] == 1){
                game.cellVal[index] = game.cellVal[index + 5] + 5
                break
            }
            
            if(index + 5 > 24){
                game.cellVal[index] = 5
                break
            }
            
            // check if you are a border or not
            if(GameManager.isBorder(index: index)){
                game.grid[index] = 0
                index = index + 5
            } else {
                if(game.grid[index - 1] == 1 && game.grid[index + 1] == 1){
                    game.cellVal[index] = 5
                    var ind = index + 5
                    while(ind < 24){
                        if(game.cellVal[ind] == 0){
                            game.cellVal[ind] = 10
                        }
                        ind += 5
                    }
                    break
                } else {
                    game.grid[index] = 0
                    index = index + 5
                }
            }
        }
        collView.reloadData()
    }
    
    static func updateClicks(game: inout Game, clickLabel: inout UILabel){
        clickLabel.text = "\(game.totalClicks - game.playedClicks)"
    }
    
    static func getGameResult(game: Game, viewC: UIViewController, resetAction: UIAlertAction? = nil){
        
        let points = game.cellVal
        var totalpoints = 0
        
        for point in points {
            totalpoints += point
        }
        
        // create the alert
        let alert = UIAlertController(title: "", message: "\nDon't stop now, try to do better!", preferredStyle: .alert)
        //alert.view.backgroundColor = UIColor.white
        let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Marker Felt Wide", size: 29)!, NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleString = NSAttributedString(string: "Your score is: \(totalpoints)", attributes: titleAttributes)
        alert.setValue(titleString, forKey: "attributedTitle")


        // add the actions (buttons)
        if (resetAction != nil){
            alert.addAction(resetAction!)
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // show the alert
        viewC.present(alert, animated: true, completion: nil)
    }
}
