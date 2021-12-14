//
//  HomeViewController.swift
//  appTestApelsin
//
//  Created by user on 03/12/21.
//

import UIKit

enum HomeSection: Int, CaseIterable {
    case addCard = 0
    case mobilePayment
    case services
}

class HomeViewController: UIViewController {
    private var priceLabelTopConstraint: NSLayoutConstraint?
    private var priceLabelLeftConstraint: NSLayoutConstraint?
    
    private(set) lazy var backgroundImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "back1")
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var settings: PanModalController.Settings = {
        var settings = PanModalController.Settings()
        settings.distanceFull = 100
        settings.distancePartial = 264
        settings.tabBarHeight = tabBarController?.tabBar.frame.size.height ?? 0.0
        
        return settings
    }()
    
    private lazy var panController: PanModalControllerDelegate = {
        let controller = PanModalController(
            parentView: view,
            childView: containerVC.view,
            scrollView: containerVC.tableView,
            settings: settings
        )
        controller.bind(didScroll: didScroll(to:percentage:))
        
        return controller
    }()
    
    private lazy var containerVC: ContainerViewController = {
        return ContainerViewController()
    }()
    
    private lazy var searchBar: UISearchBar = {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var priceLabel: UILabel = {
        let view = UILabel()
        view.text = "0 UZS"
        view.textColor = .white
        view.font = .systemFont(ofSize: 40, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
        
    private func addNavBar(){
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(systemImageName: "bell", target: self, action: #selector(rightTapped)),
            UIBarButtonItem(systemImageName: "note.text", target: self, action: #selector(rightTapped)),
            UIBarButtonItem(systemImageName: "bag", target: self, action: #selector(rightTapped))
        ]
        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(systemImageName: "person", target: self, action: #selector(rightTapped))
        ]
        
        navigationItem.titleView = searchBar
    }
    
    // MARK: - Actions
    @objc func rightTapped() {}
    
    @objc func leftTapped() {}
}

extension HomeViewController {
    private func didScroll(to yPosition: CGFloat, percentage: CGFloat) {
        // Fade animation.
        searchBar.alpha = 1.0-percentage
        
        // Update font.
        var fontSize: CGFloat = 40 - (10 * percentage)
        fontSize = fontSize > 40 ? 40 : fontSize
        priceLabel.font = .systemFont(ofSize: fontSize, weight: .bold)
        
        // Update top constraint.
        var topConstant = yPosition - 44
        topConstant = topConstant > 210 ? 210 : topConstant
        topConstant = topConstant < 60 ? 60 : topConstant
        priceLabelTopConstraint?.constant = topConstant
        
        // Update left constraint.
        var leftConstant = 40 + (17 * percentage)
        leftConstant = leftConstant < 40 ? 40 : leftConstant
        priceLabelLeftConstraint?.constant = leftConstant
    }
}

extension HomeViewController {
    private func setup(){
        addNavBar()
        embedSubviews()
        setSubviewsConstraints()
        panController.build()
    }
    
    private func embedSubviews() {
        view.addSubview(backgroundImageView)
        view.addSubview(priceLabel)
    }
    
    private func setSubviewsConstraints() {
        setBackgrounImageViewConstraints()
        setPriceLabelConstraints()
    }
    
    private func setBackgrounImageViewConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setPriceLabelConstraints() {
        priceLabelLeftConstraint = priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        priceLabelLeftConstraint?.isActive = true
        
        priceLabelTopConstraint = priceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 210)
        priceLabelTopConstraint?.isActive = true
    }
}
