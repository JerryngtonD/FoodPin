//
//  RestaurauntDetailViewController.swift
//  FoodPin
//
//  Created by Evgeny on 16.03.2020.
//  Copyright © 2020 DAVYDOV Evgeny. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    @IBOutlet var restaurantImageView: UIImageView!
    var restaurantImageName = ""
    
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    @IBOutlet weak var restaurantLocationLabel: UILabel!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        restaurantImageView.image = UIImage(named: restaurant.image)
        restaurantNameLabel.text = restaurant.name
        restaurantTypeLabel.text = restaurant.type
        restaurantLocationLabel.text = restaurant.location
    }
}
