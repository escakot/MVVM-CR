//
//  MenuItemCell.swift
//  MVVM-CR
//
//  Created by Errol Cheong on 2022-03-14.
//

import UIKit

class MenuItemCell: UITableViewCell {
    
    var data: MenuItemViewData? {
        didSet {
            self.imageView?.image = data?.image
            self.textLabel?.text = data?.title
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
