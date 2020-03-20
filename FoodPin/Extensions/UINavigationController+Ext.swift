//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by Evgeny on 20.03.2020.
//  Copyright © 2020 DAVYDOV Evgeny. All rights reserved.
//

import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
