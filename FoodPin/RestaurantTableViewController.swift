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
  
   var restaurants:[Restaurant] = [
    Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),
    Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image:"homei", isVisited: false),
    Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
    Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
    Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
    Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "HongKong", image: "forkeerestaurant", isVisited: false),
    Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
    Restaurant(name: "Bourke Street Backery", type: "Chocolate", location:"Sydney", image: "bourkestreetbakery", isVisited: false),
    Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
    Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
    Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),
    Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),
    Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isVisited: false),
    Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "NewYork", image: "wafflewolf", isVisited: false),
    Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
    Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
    Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false),
    Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isVisited: false),
    Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited: false),
    Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),
    Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "Lond on", image: "caskpubkitchen", isVisited: false)
    ]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
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
      
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.width / 2.0
        cell.thumbnailImageView.clipsToBounds = true
      
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
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0 , blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(systemName: "trash")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") {
             (action, sourceView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
            activityController = UIActivityViewController(activityItems: [ defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0 , blue: 38.0/255.0, alpha: 1.0)
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
        checkAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
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
}
