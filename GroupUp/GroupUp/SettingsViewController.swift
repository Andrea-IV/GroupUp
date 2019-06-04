//
//  SettingsViewController.swift
//  GroupUp
//
//  Created by etudiant on 04/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var distanceAlert: UILabel!
    @IBOutlet weak var lengthSharing: UITextField!
    
    let step: Float = 20;
    
    override func viewDidLoad() {
        super.viewDidLoad();

    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value/step) * step
        sender.value = roundedValue
        distanceAlert.text = "\(roundedValue) m";
    }
    
}
