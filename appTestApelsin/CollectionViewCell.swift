//
//  CollectionViewCell.swift
//  appTestApelsin
//
//  Created by user on 03/12/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardLabel: UILabel!
    
    var items : Array<Item> = Array()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
}

