//
//  TravelGroup.swift
//  GroupUp
//
//  Created by etudiant on 25/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class TravelGroup: UITableViewCell {
    
    
    @IBOutlet weak var TravelImage: UIImageView!
    @IBOutlet weak var TravelLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //CellImage.image = UIImage(named: "blood");
        //CellLabel.text = "sauce";
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
