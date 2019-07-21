//
//  FirstViewController.swift
//  GroupUp
//
//  Created by etudiant on 03/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit
import MapKit

class MapChatViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var theMap: MKMapView!
    @IBOutlet weak var menuButton: UIButton!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menu.layer.shadowOpacity = 1;
        menu.layer.shadowRadius = 6;
        
        theMap.showsUserLocation = true;
        
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        //Zoom to user location
        
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            theMap.setRegion(viewRegion, animated: false)
        }
        
        self.locationManager = locationManager
        
        DispatchQueue.main.async {
            self.locationManager.startUpdatingLocation()
        }
    }
    
    
    @IBAction func openMenu(_ sender: Any) {
        if leadingConstraint.constant == -150{
            menuButton.imageView?.image = UIImage(named:"closeMenu");
            leadingConstraint.constant = 0;
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded();
            });
        }else{
            menuButton.imageView?.image = UIImage(named:"openMenu");
            leadingConstraint.constant = -150;
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded();
            });
        }
        
        theMap.showsUserLocation = true;
        
        if let userLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegion(center: userLocation, latitudinalMeters: 200, longitudinalMeters: 200)
            theMap.setRegion(viewRegion, animated: false)
        }
    }
    
}

