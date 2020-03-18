//
//  RestaurantDetailIconTextCell.swift
//  FoodPin
//
//  Created by Evgeny on 18.03.2020.
//  Copyright © 2020 DAVYDOV Evgeny. All rights reserved.
//

import UIKit

class RestaurantDetailIconTextCell : UITableViewCell {
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var shortTextLabel: UILabel! {
        didSet {
            shortTextLabel.numberOfLines = 0
        }
    }
}
