//
//  CollectionViewCell.swift
//  appTestApelsin
//
//  Created by user on 03/12/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cardLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with item: Item) {
        cardLabel.text = item.label
    }
}
