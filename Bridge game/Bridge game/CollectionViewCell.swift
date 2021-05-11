//
//  CollectionViewCell.swift
//  Bridge game
//
//  Created by Giuseppe Diciolla on 11/05/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backV: UIView!
    @IBOutlet weak var cellLabel: UILabel!
    
    func changeColor(newColor: UIColor) {
        backV.backgroundColor = newColor
    }
}
