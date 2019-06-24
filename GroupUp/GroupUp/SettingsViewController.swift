//
//  SettingsViewController.swift
//  GroupUp
//
//  Created by etudiant on 24/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var distanceAlert: UILabel!
    @IBOutlet weak var settingsTable: UITableView!
    
    let step: Float = 100;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        distanceAlert.text = String(0) + " m";
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
         let roundedValue = round(sender.value/step) * step
         sender.value = roundedValue
         distanceAlert.text = "\(roundedValue) m";
    }
    

}

