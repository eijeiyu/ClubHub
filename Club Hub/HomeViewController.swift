//
//  HomeViewController.swift
//  Club Hub
//
//  Created by AJ Yoo on 1/7/16.
//  Copyright © 2016 BlueHammer. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController, UITabBarControllerDelegate {

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegates.
        delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITabBarControllerDelegate
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if let searchClubViewController = viewController as? SearchClubViewController {
            // TODO: Remove this test data.
            let club1 = Club(name: "ESUC", logo: UIImage(named: "esuc")!, backgroundImage: UIImage(named: "meal1"))
            let club2 = Club(name: "Backwards ESUC", logo: UIImage(named: "meal1")!, backgroundImage: UIImage(named: "esuc"))
            searchClubViewController.clubs = [club1!, club2!]
            return true
        }
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
