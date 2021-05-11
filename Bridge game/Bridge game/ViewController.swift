//
//  ViewController.swift
//  Bridge game
//
//  Created by Giuseppe Diciolla on 11/05/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let cells = ["1", "2", "3", "4", "5",
                 "6", "7", "8", "9", "10",
                 "11", "12", "13", "14", "15",
                 "16", "17", "18", "19", "20",
                 "21", "22", "23", "24", "25"]
    
    var gridSituation = [0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0,
                         0, 0, 0, 0, 0, ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text = cells[indexPath.item]
        if(gridSituation[indexPath.item] == 1) {
            cell.backV.backgroundColor = UIColor.blue
        }
        else {
            cell.backV.backgroundColor = UIColor.gray
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        gridSituation[indexPath.item] = 1
        collectionView.reloadData()
        
        print("pressed on \(indexPath.item + 1)")
        print(gridSituation)
    }
}

