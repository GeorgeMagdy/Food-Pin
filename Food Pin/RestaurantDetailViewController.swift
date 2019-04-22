//
//  RestaurantDetailViewController.swift
//  Food Pin
//
//  Created by George on 2/22/19.
//  Copyright © 2019 GeorgeMagdy. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var restaurant:Restaurant!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var restaurantImageView: UIImageView!
    
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = restaurant.name
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 0.2)
        restaurantImageView.image = UIImage(named: restaurant.image)
        
        tableView.estimatedRowHeight = 36
        tableView.rowHeight = UITableView.automaticDimension
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showMap))
        mapView.addGestureRecognizer(tapGesture)
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location) { (placemarks, error) in
            if error != nil {
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                if let location = placemark.location {
                let annotation = MKPointAnnotation()
                annotation.coordinate = location.coordinate
                self.mapView.addAnnotation(annotation)
                let region =
                    MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                }
                
            }
        }
    }
   
    @objc func showMap()-> Void {
        performSegue(withIdentifier: "showMap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurant
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
            return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:
                indexPath) as! RestaurantDetailTableViewCell
            // Configure the cell...
            switch indexPath.row {
            case 0:
                cell.fieldLabel.text = "Name"
                cell.valueLabel.text = restaurant.name
            case 1:
                cell.fieldLabel.text = "Type"
                cell.valueLabel.text = restaurant.type
            case 2:
                cell.fieldLabel.text = "Location"
                cell.valueLabel.text = restaurant.location
            case 3:
                cell.fieldLabel.text = "Been here"
                cell.valueLabel.text = (restaurant.isVisited) ? "Yes, I've been here before" : "No"
            default:
                cell.fieldLabel.text = ""
                cell.valueLabel.text = ""
            }
            cell.backgroundColor = UIColor.clear
            return cell
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        }
    
}
