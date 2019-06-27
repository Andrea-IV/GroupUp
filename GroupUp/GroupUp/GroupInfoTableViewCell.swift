//
//  GroupInfoTableViewCell.swift
//  GroupUp
//
//  Created by Yohann Capel on 25/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class GroupInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textView: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
