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
    
    @IBOutlet var closeButton: UIButton!
    
    var restaurant: RestaurantMO!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurantImage = restaurant.image {
            backgroundImageView.image = UIImage(data: restaurantImage as Data)
        }
        
         // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        let moveUpTransform = CGAffineTransform.init(translationX: 0, y: -600)
        
        // Make the button invisible
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        closeButton.transform = moveUpTransform
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for index in 0...4 {
            UIView.animate(withDuration: 0.4, delay: (0.1 + 0.05 * Double(index)), options: [], animations: {
                self.rateButtons[index].alpha = 1.0
                self.rateButtons[index].transform = .identity
            }, completion: nil)
        }
        
        // Animate the close button
        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
           self.closeButton.transform = .identity
        }, completion: nil)
            
            /*
            UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
                self.rateButtons[0].alpha = 1.0
                self.rateButtons[0].transform = .identity
            }, completion: nil)

            UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {
                self.rateButtons[1].alpha = 1.0
                self.rateButtons[1].transform = .identity
            }, completion: nil)

            UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
                self.rateButtons[2].alpha = 1.0
                self.rateButtons[2].transform = .identity
            }, completion: nil)

            UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
                self.rateButtons[3].alpha = 1.0
                self.rateButtons[3].transform = .identity
            }, completion: nil)

            UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
                self.rateButtons[4].alpha = 1.0
                self.rateButtons[4].transform = .identity
            }, completion: nil)
            */
            
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
