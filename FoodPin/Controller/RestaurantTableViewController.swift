//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by DAVYDOV Evgeny on 05.03.2020.
//  Copyright © 2020 DAVYDOV Evgeny. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    let cellIdentidier = "restraurantCell"
    
    var restaurants:[RestaurantMO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Configure the navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor:
            UIColor(red: 231, green: 76, blue: 60),
            NSAttributedString.Key.font: customFont ]
        }
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentidier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name
      
        if let restaurantImage = restaurants[indexPath.row].image {
            cell.thumbnailImageView.image = UIImage(data: restaurantImage as Data)
            cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.width / 2.0
            cell.thumbnailImageView.clipsToBounds = true
        }
        
        cell.typeLabel.text = restaurants[indexPath.row].type
      
        cell.locationLabel.text = restaurants[indexPath.row].location
      
        cell.heartImageView.isHidden = !self.restaurants[indexPath.row].isVisited
        return cell
    }
  
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }

  
    //MARK: previous actions on didSelectCell
//  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let optionMenu = UIAlertController(title: nil, message: "What do you want to do ?", preferredStyle: .alert)
//
//    let checkInTitle = self.restaurantIsVisited[indexPath.row] ? "Undo Check in" : "Check in"
//    let checkInAction = UIAlertAction(title: checkInTitle, style: .default, handler: {(action:UIAlertAction!) -> Void in
//    let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//    self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
//    cell.heartImageView.isHidden = !self.restaurantIsVisited[indexPath.row]
//    })
//
//    let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)" , style: .default, handler: {(action:UIAlertAction!) -> Void in
//      let alertMessage =    UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//      alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//      self.present(alertMessage, animated: true, completion: nil)
//    })
//
//    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//    optionMenu.addAction(cancelAction)
//    optionMenu.addAction(callAction)
//    optionMenu.addAction(checkInAction)
//
//
//    present(optionMenu, animated: true, completion: nil)
//
//    tableView.deselectRow(at: indexPath, animated: false)
//  }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action, sourceView, completionHandler) in
            // Delete the row from the data source
            self.restaurants.remove(at: indexPath.row)

            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        deleteAction.backgroundColor = UIColor(red: 231, green: 76, blue: 60)
        deleteAction.image = UIImage(systemName: "trash")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") {
             (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row] .name!
            let activityController: UIActivityViewController
            
          if let restaurantImage = self.restaurants[indexPath.row].image,
            let imageToShare = UIImage(data: restaurantImage as Data) {
            activityController = UIActivityViewController(activityItems: [ defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        shareAction.backgroundColor = UIColor(red: 254, green: 149 , blue: 38)
        shareAction.image = UIImage(systemName: "square.and.arrow.up")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }

    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkAction = UIContextualAction(style: .normal, title: "Check-In") {
               (action, sourceView, completionHandler) in
          
        let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
        self.restaurants[indexPath.row].isVisited = self.restaurants[indexPath.row] .isVisited ? false : true
        cell.heartImageView.isHidden = !self.restaurants[indexPath.row].isVisited
        completionHandler(true)
        }
        
         
        let checkInIcon = restaurants[indexPath.row].isVisited ? "arrow.uturn.left" : "checkmark"
        checkAction.backgroundColor = UIColor(red: 38, green: 162, blue: 78)
        checkAction.image = UIImage(systemName: checkInIcon)
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkAction])

        return swipeConfiguration
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
}
