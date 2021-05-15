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
        
        game = GameManager.resetGame()
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collView = collectionView
        return numberOfSquares
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text = ("\(game.cellVal[indexPath.item])")
        if(game.grid[indexPath.item] == 1) {
            cell.backV.backgroundColor = UIColor.blue
        }
        else {
            cell.backV.backgroundColor = UIColor.gray
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if (game.playedClicks < 10) {
            game.playedClicks += 1
            GameManager.updateClicks(game: &game, clickLabel: &avariableClicksLabel)
            GameManager.cellPressed(cell: indexPath.item, collView: collectionView, game: &game)
        }
        
        if (game.playedClicks == 10){
            GameManager.getGameResult(game: game, viewC: self, resetAction: UIAlertAction(title: "New Game", style: .default) { (action) in
                self.resetGameAction()
            })
        }
        
        print("pressed on \(indexPath.item + 1)")
        print(game.grid)
    }
    
    @IBAction func resetGame(_ sender: Any) {
        
        resetGameAction()
    }
    
    func resetGameAction() {
        game = GameManager.resetGame()
        GameManager.updateClicks(game: &game, clickLabel: &avariableClicksLabel)
        
        collView?.reloadData()
    }
}

