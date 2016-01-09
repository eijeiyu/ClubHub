//
//  Club.swift
//  Club Hub
//
//  Created by AJ Yoo on 12/27/15.
//  Copyright © 2015 BlueHammer. All rights reserved.
//

import UIKit

class Club {
    
    // MARK: Properties
    var name: String = ""
    var logo: UIImage
    var backgroundImage: UIImage?
    
    // MARK: Initialization
    init?(name: String, logo: UIImage, backgroundImage: UIImage?) {
        self.name = name
        self.logo = logo
        self.backgroundImage = backgroundImage
        if name.isEmpty {
            return nil
        }
    }
    
}
