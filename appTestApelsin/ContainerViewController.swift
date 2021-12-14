//
//  ContainerViewController.swift
//  appTestApelsin
//
//  Created by user on 07/12/21.
//

import UIKit

class ContainerViewController: UIViewController {
    private let sections: [HomeSection] = [.addCard, .mobilePayment, .services, .services, .services]
    
    private(set) lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .systemGroupedBackground
        view.registerNib(ServiceTableViewCell.self)
        view.registerNib(MobilePaymentTableViewCell.self)
        view.registerNib(AddFavouriteCardTableViewCell.self)
        view.separatorStyle = .none
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
    }
    
    func setup() {
        embedSubviews()
        setSubviewsConstraints()
    }
    
    func embedSubviews() {
        view.addSubview(tableView)
    }
    
    func setSubviewsConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ContainerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.row] {
        case .addCard:
            let cell: AddFavouriteCardTableViewCell = tableView.reusableCell(for: indexPath)
            return cell
            
        case .mobilePayment:
            let cell: MobilePaymentTableViewCell = tableView.reusableCell(for: indexPath)
            return cell
            
        case .services:
            let cell: ServiceTableViewCell = tableView.reusableCell(for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


