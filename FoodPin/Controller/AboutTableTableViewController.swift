//
//  AboutTableTableViewController.swift
//  FoodPin
//
//  Created by Evgeny on 16.04.2020.
//  Copyright © 2020 DAVYDOV Evgeny. All rights reserved.
//

import UIKit

class AboutTableTableViewController: UITableViewController {
    var sectionTitles = ["Feedback", "Follow Us"]
    var sectionContent = [
        [
            (image: "store", text: "Rate us on App Store", link:"https://www.apple.com/ios/app-store/"),
            (image: "chat", text: "Tell us your feedback", link : "http://www.appcoda.com/contact")
        ],
        [
            (image: "twitter", text: "Twitter", link: "https:// twitter.com/appcodamobile"),
            (image: "facebook", text: "Facebook", link: "https: //facebook.com/appcodamobile"),
            (image: "instagram", text: "Instagram", link: "http s://www.instagram.com/appcodadotcom")
        ]
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Configure navigation bar appearance
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor(red: 231, green: 76, blue: 60), NSAttributedString.Key.font: customFont
            ]
        }
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return sectionContent[section].count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath)
    // Configure the cell...
        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let link = sectionContent[indexPath.section][indexPath.row].link
        switch indexPath.section {
            // Leave us feedback section case 0:
        case 0:
            if indexPath.row == 0 {
                if let url = URL(string: link) {
                    UIApplication.shared.open(url) }
                }
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }

}
