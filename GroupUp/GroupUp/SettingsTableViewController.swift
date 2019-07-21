//
//  SettingsTableViewController.swift
//  GroupUp
//
//  Created by etudiant on 25/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var distanceAlert: UILabel!
    @IBOutlet weak var selected: UILabel!
    @IBOutlet weak var sliderTime: UISlider!
    
    let step: Float = 100;
    let fileDistance = "distance.txt"
    let fileTime = "time.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            
            let fileURL = dir.appendingPathComponent(fileTime)
            
            //reading
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                
                let start = text.index(text.startIndex, offsetBy: 5)
                let range = start..<text.endIndex
                
                sliderTime.value = Float(text[range]) ?? 1
                selected.text = text[range] + " min";
            }
            catch {/* error handling here */}
        }else{
            selected.text = String(1) + " min";
        }
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(fileDistance)
            
            //reading
            do {
                let text = try String(contentsOf: fileURL, encoding: .utf8)
                
                let start = text.index(text.startIndex, offsetBy: 9)
                let range = start..<text.endIndex
                
                slider.value = Float(text[range]) ?? 1
                distanceAlert.text = text[range] + " m";
            }
            catch {/* error handling here */}
        }else{
            distanceAlert.text = String(0) + " m";
        }
        
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value/step) * step
        sender.value = roundedValue
        distanceAlert.text = "\(roundedValue) m";
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(fileDistance)
            
            let distanceWrite = "Distance:\(String(describing: sender.value))"
            //writing
            do {
                try distanceWrite.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
    
    @IBAction func sliderTimeValueChanged(_ sender: UISlider) {
        let roundedValue = round(sender.value)
        sender.value = roundedValue
        selected.text = "\(sender.value) min";
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(fileTime)
            
            let selectedWrite = "Time:\(String(describing: sender.value))"
            //writing
            do {
                try selectedWrite.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
}
