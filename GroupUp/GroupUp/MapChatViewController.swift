//
//  FirstViewController.swift
//  GroupUp
//
//  Created by etudiant on 03/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class MapChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var groups: [Group] = []
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var travelGroupTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menu.layer.shadowOpacity = 1;
        menu.layer.shadowRadius = 6;
        travelGroupTable.dataSource=self
        travelGroupTable.delegate=self
        
        let path = Bundle.main.path(forResource: "groups", ofType: "json")
        let url = URL(fileURLWithPath: path as! String)
        let data = try! Data(contentsOf: url)
        groups = try! JSONDecoder().decode([Group].self, from: data)
        
        print(groups)
    }
    
    
    @IBAction func openMenu(_ sender: Any) {
        if leadingConstraint.constant == -200{
            menuButton.imageView?.image = UIImage(named:"closeMenu");
            leadingConstraint.constant = 0;
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded();
            });
        }else{
            menuButton.imageView?.image = UIImage(named:"openMenu");
            leadingConstraint.constant = -200;
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded();
            });
        }
    }
    
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


struct Group: Codable {
    var id: Int
    var label: String
    var image: String
    var latitude: String
    var longitude: String
}
