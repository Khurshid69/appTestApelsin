//
//  HomeViewController.swift
//  appTestApelsin
//
//  Created by user on 03/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let numbersOfColumns: CGFloat = 2
    var items : Array<Item> = Array()
    var itemsOfTable : Array<PostTable> = [
        PostTable(title: "One"),
        PostTable(title: "Two"),
        PostTable(title: "Three"),
        PostTable(title: "Four"),
        PostTable(title: "Five"),
    ]
    private let cellIdentifier = "TableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    
    func initViews(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        addNavBar()
        
        
      
        
    }
    
    func addNavBar(){
        let bell = UIImage(systemName: "bell")?.withTintColor(.white)
        let note = UIImage(systemName: "note.text")?.withTintColor(.white)
        let bag = UIImage(systemName: "bag")?.withTintColor(.white)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: bell,
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(rightTapped)),
                                              UIBarButtonItem(image: note,
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(rightTapped)),
                                              UIBarButtonItem(image: bag,
                                                              style: .plain,
                                                              target: self,
                                                              action: #selector(rightTapped))
                                              
        ]
        let person = UIImage(systemName: "person")
        navigationItem.leftBarButtonItems = [UIBarButtonItem(image: person,
                                                             style: .plain,
                                                             target: self,
                                                             action: #selector(leftTapped)),
                                             
        ]
        
        let searchBar = UISearchBar()
        self.navigationItem.titleView = searchBar
    }
    
    @objc func rightTapped(){
        
    }
    @objc func leftTapped(){
        
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsOfTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item2 = itemsOfTable[indexPath.row]
        print(item2)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        
        
        let cellCard = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! AddFavouriteCardTableViewCell
        let cellMobile = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MobilePaymentTableViewCell
        let cellService = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ServiceTableViewCell
        
        if indexPath.row == 0 {
            AddFavouriteCardTableViewCell()
        }else if indexPath.row == 1 {
            MobilePaymentTableViewCell()
        }else{
            ServiceTableViewCell()
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}






