//
//  TravelGroupTableViewController.swift
//  GroupUp
//
//  Created by etudiant on 27/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class TravelGroupTableViewController: UITableView {

    
    var groups: [Group] = []
    
    
    func viewDidLoad() {
        //super.viewDidLoad()

        let path = Bundle.main.path(forResource: "groups", ofType: "json")
        let url = URL(fileURLWithPath: path as! String)
        let data = try! Data(contentsOf: url)
        groups = try! JSONDecoder().decode([Group].self, from: data)
        
        print(groups)
    }

    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch section {
        case 0:
            return groups.count
        default:
            return 0
        }
    }


        
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell : TravelGroup = tableView.dequeueReusableCell(withIdentifier: "travelCell", for: indexPath) as! TravelGroup
        
        
        
            cell.TravelImage.image = UIImage(named: groups[indexPath.row].image)
            cell.TravelLabel.text = groups[indexPath.row].label
            
            return cell
        }

    

}
