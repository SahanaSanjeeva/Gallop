//
//  TabViewController.swift
//  GallopNYC
//
//  Created by Sahana Sanjeeva on 2/14/17.
//  Copyright © 2017 GallopNYC. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!

    @IBOutlet var menuButtons: [UIButton]!
    
    var homeViewController: UIViewController!
    var scheduleViewController: UIViewController!
    var donateViewController: UIViewController!
    var programsViewController: UIViewController!
    var contactViewController: UIViewController!
    
    var allViewControllers: [UIViewController]!
    
    var selectedMenuItem: Int = 0
    
    override func viewDidLoad() {
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeScene")
        scheduleViewController = storyboard.instantiateViewController(withIdentifier: "ScheduleScene")
        donateViewController = storyboard.instantiateViewController(withIdentifier: "DonateScene")
        programsViewController = storyboard.instantiateViewController(withIdentifier: "ProgramsScene")
        contactViewController = storyboard.instantiateViewController(withIdentifier: "ContactScene")
        
        allViewControllers = [homeViewController,scheduleViewController,donateViewController,programsViewController,contactViewController]
        
        menuButtons[selectedMenuItem].isSelected = true
        didPressMenu(menuButtons[selectedMenuItem])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didPressMenu(_ sender: UIButton) {
        let previousMenuItem = selectedMenuItem
        let previousViewController = allViewControllers[selectedMenuItem]
        
        selectedMenuItem = sender.tag
        let selectedViewController = allViewControllers[selectedMenuItem]
        
        menuButtons[previousMenuItem].isSelected = false
        
        previousViewController.willMove(toParentViewController: nil)
        previousViewController.view.removeFromSuperview()
        previousViewController.removeFromParentViewController()
        
        sender.isSelected = true
        addChildViewController(selectedViewController)
        selectedViewController.view.frame = contentView.bounds
        contentView.addSubview(selectedViewController.view)
        selectedViewController.didMove(toParentViewController: self)
    }
    
}

