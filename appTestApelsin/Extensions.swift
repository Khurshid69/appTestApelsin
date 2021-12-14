//
//  Extensions.swift
//  appTestApelsin
//
//  Created by user on 04/12/21.
//

import UIKit

extension UITableView {
    func registerNib<Cell: UITableViewCell>(_ cell: Cell.Type) {
        register(UINib(nibName: String(describing: cell), bundle: nil), forCellReuseIdentifier: cell.identifer)
    }

    func reusableCell<Cell: UITableViewCell>(for indexPath: IndexPath) -> Cell {
        dequeueReusableCell(withIdentifier: Cell.identifer, for: indexPath) as! Cell
    }
}

extension UITableViewCell {
    static var identifer: String {
        String(describing: self)
    }
}

extension UIBarButtonItem {
    convenience init(systemImageName: String, tintColor: UIColor = .white, target: Any?, action: Selector?) {
        let image = UIImage(systemName: systemImageName)?.withTintColor(.white)
        self.init(image: image, style: .plain, target: target, action: action)
    }
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
    }
}
