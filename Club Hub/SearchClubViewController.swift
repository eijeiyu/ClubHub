//
//  ClubViewController.swift
//  Club Hub
//
//  Created by AJ Yoo on 12/18/15.
//  Copyright © 2015 BlueHammer. All rights reserved.
//

import UIKit

class SearchClubViewController: UIViewController, UIPageViewControllerDataSource {

    // MARK: Properties
    
    var clubs: [Club] = [] // Assume sorted alphabetically by name
    
    // MARK: Outlets
    
    @IBOutlet weak var informationControl: UISegmentedControl!
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var eventsView: UIView!
    @IBOutlet weak var contactView: UIView!
    @IBOutlet weak var clubPageView: UIView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show the About content first.
        aboutView.hidden = false
        eventsView.hidden = true
        contactView.hidden = true
    }
    
    // MARK: Actions
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch informationControl.selectedSegmentIndex {
        case 0:
            // Show the About content.
            aboutView.hidden = false
            eventsView.hidden = true
            contactView.hidden = true
        case 1:
            // Show the Events content.
            aboutView.hidden = true
            eventsView.hidden = false
            contactView.hidden = true
        case 2:
            // Show the Contact content.
            aboutView.hidden = true
            eventsView.hidden = true
            contactView.hidden = false
        default:
            break
        }
    }
    
    // MARK: UIPageViewControllerDataSource
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let currentClubPageViewController = viewController as! ClubPageViewController
        let index = currentClubPageViewController.index
        if index < clubs.count - 1 {
            return createClubPageViewController(index + 1)
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let currentClubPageViewController = viewController as! ClubPageViewController
        let index = currentClubPageViewController.index
        if index > 0 {
            return createClubPageViewController(index - 1)
        }
        return nil
    }
    
    private func createClubPageViewController(index: Int) -> ClubPageViewController? {
        if clubs.isEmpty {
            return nil
        }
        let club = clubs[index]
        let clubPageViewController = storyboard?.instantiateViewControllerWithIdentifier("ClubPageViewController") as? ClubPageViewController
        clubPageViewController?.club = club
        clubPageViewController?.index = index
        return clubPageViewController
    }
    
    // TODO: This is currently test data.
    private func fetchClubData() {
        let club1 = Club(name: "ESUC", logo: UIImage(named: "esuc")!, backgroundImage: UIImage(named: "meal1"))
        let club2 = Club(name: "Backwards ESUC", logo: UIImage(named: "meal1")!, backgroundImage: UIImage(named: "esuc"))
        clubs = [club1!, club2!]
    }

    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segue.identifier
        if identifier == "embeddedPageViewSegue" {
            if let pageViewController = segue.destinationViewController as? UIPageViewController {
                pageViewController.dataSource = self
                fetchClubData()
                pageViewController.setViewControllers([createClubPageViewController(0)!], direction: .Forward, animated: true, completion: { (finished) -> Void in
                    // TODO: Update the about, events, and contacts tabs corresponding to the current club
                })
            }
        }
    }

}
