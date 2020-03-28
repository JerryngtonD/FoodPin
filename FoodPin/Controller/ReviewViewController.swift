//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Evgeny on 28.03.2020.
//  Copyright © 2020 DAVYDOV Evgeny. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var backgroundImageView: UIImageView!
    
    //Mark:
    //    rateButtons[0] // Love button
    //    rateButtons[1] // Cool button
    //    rateButtons[2] // Happy button
    //    rateButtons[3] // Sad button
    //    rateButtons[4] // Angry button
    @IBOutlet var rateButtons: [UIButton]!
    
    var restaurant = Restaurant()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)
        
         // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(blurEffectView)
        
        // Make the button invisible
        for rateButton in rateButtons {
            rateButton.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
            UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations:
            {
                self.rateButtons[0].alpha = 1.0
            }, completion: nil)

            UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations:
              {
                  self.rateButtons[1].alpha = 1.0
              }, completion: nil)

            UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations:
               {
                   self.rateButtons[2].alpha = 1.0
               }, completion: nil)

            UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations:
                {
                    self.rateButtons[3].alpha = 1.0
                }, completion: nil)

            UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations:
                {
                    self.rateButtons[4].alpha = 1.0
                }, completion: nil)
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
