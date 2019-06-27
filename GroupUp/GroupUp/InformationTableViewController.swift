//
//  SecondViewController.swift
//  GroupUp
//
//  Created by etudiant on 03/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class InformationTableViewController: UITableViewController {

    let name = ["test", "toto"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch section {
        case 0:
            return 2
        case 1:
            return name.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : GroupInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! GroupInfoTableViewCell
        
        if indexPath.section  == 0 {
            if indexPath.row == 0 {
                cell.textView.text = "Group 1"
            } else if indexPath.row == 1 {
                cell.label.text = "Location duration (min)"
                cell.textView.text = "180"
            }
        } else if indexPath.section == 1 {
        
        }
        
        return cell
    }
}

struct User: Codable {
    var id: Int
    var username: String
    var email: String
    var admin: Int
    var localized: Int
}
