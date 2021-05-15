//
//  ViewController.swift
//  Bridge game
//
//  Created by Giuseppe Diciolla on 11/05/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var avariableClicksLabel: UILabel!
    
    var collView: UICollectionView? = nil
    var game = Game()
    let numberOfSquares = 25

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collView = collectionView
        return numberOfSquares
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        if(game.playedClicks == 10){
            cell.cellLabel.text = ("\(game.cellVal[indexPath.item])")
        } else {
            cell.cellLabel.text = ("")
        }
        if(game.grid[indexPath.item] == 1) {
            cell.backV.backgroundColor = UIColor(red: 76/255, green: 86/255, blue: 105/255, alpha: 1)
        }
        else {
            cell.backV.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (game.playedClicks < 10) {
            GameManager.cellPressed(cell: indexPath.item, collView: collectionView, game: &game)
            GameManager.updateClicks(game: &game, clickLabel: &avariableClicksLabel)
        }
        
        if (game.playedClicks == 10){
            GameManager.getGameResult(game: game, viewC: self, resetAction: UIAlertAction(title: "New Game", style: .default) { (action) in self.resetGameAction()
            })
        }
        
        print("pressed on \(indexPath.item + 1)")
        print(game.grid)
    }
    
    @IBAction func resetGame(_ sender: Any) {
        
        resetGameAction()
        
        print(game.grid)
        print(game.cellVal)
    }
    
    func resetGameAction() {
        self.game = GameManager.resetGame()
        GameManager.updateClicks(game: &game, clickLabel: &avariableClicksLabel)
        
        self.collView?.reloadData()
    }
}

