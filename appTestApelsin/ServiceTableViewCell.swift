//
//  ServiceTableViewCell.swift
//  appTestApelsin
//
//  Created by user on 04/12/21.
//

import UIKit

class ServiceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionViewCell: UICollectionView!
    
    var items: Array<Item> = Array()
    let numbersOfColumns: CGFloat = 2
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionViewCell.delegate = self
        collectionViewCell.dataSource = self
        initViews()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    func initViews(){
        self.collectionViewCell.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        if let flowLayout = collectionViewCell?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screemSize: CGRect = UIScreen.main.bounds
            let cellWidth = screemSize.width / numbersOfColumns - 70
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            flowLayout.scrollDirection = .horizontal
            flowLayout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        items.append(Item(label: "Visa CARD"))
        items.append(Item(label: "Visa CARD"))
        items.append(Item(label: "Visa CARD"))
        items.append(Item(label: "Visa CARD"))
        items.append(Item(label: "Visa CARD"))
        items.append(Item(label: "Visa CARD"))
        items.append(Item(label: "Visa CARD"))
        items.append(Item(label: "Visa CARD"))
    }
}


extension ServiceTableViewCell:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionViewCell.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! CollectionViewCell
        cell.cardLabel.text = item.label
        
        return cell
    }
    
    
}
