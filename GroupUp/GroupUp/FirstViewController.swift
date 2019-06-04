//
//  FirstViewController.swift
//  GroupUp
//
//  Created by etudiant on 03/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu.layer.shadowOpacity = 1;
        menu.layer.shadowRadius = 6;
    }

    @IBAction func openMenu(_ sender: Any) {
        if leadingConstraint.constant == -150{
            menuButton.imageView?.image = UIImage(named:"closeMenu");
            leadingConstraint.constant = 0;
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded();
            });
        }else{
            menuButton.imageView?.image = UIImage(named:"openMenu");
            leadingConstraint.constant = -150;
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded();
            });
        }
    }
    
}

