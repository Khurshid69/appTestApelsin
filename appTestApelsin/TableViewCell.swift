//
//  TableViewCell.swift
//  appTestApelsin
//
//  Created by user on 03/12/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Calling datas
    var items : Array<Item> = [
        Item(label: "CollectionView Item"),
        Item(label: "CollectionView Item"),
        Item(label: "CollectionView Item"),
        Item(label: "CollectionView Item"),
        Item(label: "CollectionView Item")
    ]
    let numbersOfColumns: CGFloat = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        initViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func initViews(){
        
        
        
        
        
        
        
        
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            let screemSize: CGRect = UIScreen.main.bounds
            let cellWidth = screemSize.width / numbersOfColumns - 70
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    func configure(with items: [Item]) {
        self.items = items
        collectionView.reloadData()
    }
}

//MARK: - Extension is for CollectionViewCell
extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)as! CollectionViewCell
        cell.configure(with: item)
        
        return cell
    }
}
