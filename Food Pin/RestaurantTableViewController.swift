//
//  RestaurantTableViewController.swift
//  Food Pin
//
//  Created by George on 2/11/19.
//  Copyright © 2019 GeorgeMagdy. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F,72 Po Hing Fong, Sheung Wan, Hong Kong", image:
            "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", image:
            "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong",image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location:
            "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong",  image: "cafeloisl.jpg", isVisited: false),
            Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", image:
            "petiteoyster.jpg", isVisited: false),
            Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop JK.,200 Hollywood Road, SOHO, Sheung Wan, Hong Kong",
                image: "forkeerestaurant.jpg", isVisited: false),
            Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong",image: "posatelier.jpg",
                isVisited: false),
            Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", image:
                "bourkestreetbakery.jpg", isVisited: false),
            Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", image:
                "haighschocolate.jpg", isVisited: false),
            Restaurant(name: "Palomino Espresso", type: "American / Seafood", location:
                "Shop 1 61 York St Sydney New South Wales", image:
                "palominoespresso.jpg", isVisited: false),
            Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", image: "upstate.jpg", isVisited: false),
                Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", image: "traif.jpg", isVisited:
                false),
                Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch",
                           location: "445 Graham Ave Brooklyn, NY 11211", image:
                    "grahamavenuemeats.jpg", isVisited: false),
                Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", image: "wafflewolf.jpg",
                    isVisited: false),
                Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", image: "fiveleaves.jpg",
                    isVisited: false),
                Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", image:
                    "cafelore.jpg", isVisited: false),
                Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003",image: "confessional.jpg", isVisited:
                    false),
                Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", image: "barrafina.jpg",
                isVisited: false),
                Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom",  image: "donostia.jpg",
                    isVisited: false),
                Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", image: "royaloak.jpg",
                    isVisited: false),
                Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", image:
                    "caskpubkitchen.jpg", isVisited: false)
    ]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
          navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style:
            .plain, target: nil, action: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableView.automaticDimension
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        if restaurants[indexPath.row].isVisited {
            cell.accessoryType = .checkmark
        }else {
            cell.accessoryType = .none
        }
        
        return cell
    }
 
    /*override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            restaurantNames.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
        }
        //tableView.reloadData()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }*/
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action, indexpath) in
            let defaultText = "Just checking in at " +
                self.restaurants[indexPath.row].name
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexpath) in
            self.restaurants.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        return [shareAction, deleteAction]
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indethPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indethPath.row]
            }
        }
    }
   /* override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        present(optionMenu, animated: true, completion: nil)
        
        let callActionHandler = { (action : UIAlertAction! ) in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        let checkInAction = UIAlertAction(title: "Check in", style: .default) { (UIAlertAction) in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .checkmark
                self.restaurantIsVisited[indexPath.row] = true
            }
        optionMenu.addAction(checkInAction)
        tableView.deselectRow(at: indexPath, animated: false)
    }*/
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
