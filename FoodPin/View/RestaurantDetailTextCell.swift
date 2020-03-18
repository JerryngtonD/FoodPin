//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by Evgeny on 18.03.2020.
//  Copyright © 2020 DAVYDOV Evgeny. All rights reserved.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0 }
        }
}
