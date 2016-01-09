//
//  ClubPageViewController.swift
//  Club Hub
//
//  Created by AJ Yoo on 12/27/15.
//  Copyright © 2015 BlueHammer. All rights reserved.
//

import UIKit

class ClubPageViewController: UIViewController {
    
    // MARK: Properties
    
    var club: Club?
    var index: Int = 0
    
    // MARK: Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var coverPhotoImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the outlets.
        if let club = club {
            nameLabel.text = club.name
            coverPhotoImageView.image = club.backgroundImage
            logoImageView.image = club.logo
        }
    }

}
