//
//  SecondViewController.swift
//  GroupUp
//
//  Created by etudiant on 03/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class InformationTableViewController: UITableViewController {


    var users: [User] =  []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let path = Bundle.main.url(forResource: "users", withExtension: "json")! else { return }
        let path = Bundle.main.path(forResource: "users", ofType: "json")
        let url = URL(fileURLWithPath: path as! String!)
        let data = try! Data(contentsOf: url)
        users = try! JSONDecoder().decode([User].self, from: data)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch section {
        case 0:
            return 2
        case 1:
            return users.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = UITableViewCell()
        
        if indexPath.section  == 0 {
            let temp : GroupInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! GroupInfoTableViewCell
            if indexPath.row == 0 {
                temp.textView.text = "Group 1"
            } else if indexPath.row == 1 {
                temp.label.text = "Location duration (min)"
                temp.textView.text = "180"
            }
            cell = temp
        } else if indexPath.section == 1 {
            let temp : UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserTableViewCell
            
            temp.username.text = users[indexPath.row].username
            temp.email.text = users[indexPath.row].email
            cell = temp
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
