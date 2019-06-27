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
    @IBOutlet weak var timeLenght: UIPickerView!
    
    var pickerData: [String] = [String]()
    let step: Float = 100;
    let file = "settings.txt"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //timeLenght.dataSource = pickerData;
        /*if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            //reading
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }else{
            
        }*/

        distanceAlert.text = String(0) + " m";
        for x in 0..<61 {
            pickerData.append("\(x) min");
        }
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        /*let roundedValue = round(sender.value/step) * step
        sender.value = roundedValue
        distanceAlert.text = "\(roundedValue) m";
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent(file)
            
            let distanceWrite = "Distance:\(String(describing: distanceAlert.text));"
            //writing
            do {
                try distanceWrite.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {/* error handling here */}
        }*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1;
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row];
    }
}
