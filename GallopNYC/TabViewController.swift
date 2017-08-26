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
    @IBOutlet weak var dropDownArrowBtn: UIButton!
    @IBOutlet weak var statusBtn: UIButton!
    
    var homeViewController: UIViewController!
    var volunteerViewController: UIViewController!
    var scheduleViewController: UIViewController!
    var donateViewController: UIViewController!
    var programsViewController: UIViewController!
    var statusViewController: UIViewController!
    var contactViewController: UIViewController!
    
    var allViewControllers: [UIViewController]!
    
    var selectedMenuItem: Int = 0
    
    override func viewDidLoad() {
        let storyboard = UIStoryboard(name:"Main" , bundle: nil)
        
        homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeScene")
        volunteerViewController = storyboard.instantiateViewController(withIdentifier: "VolunteerScene")
        scheduleViewController = storyboard.instantiateViewController(withIdentifier: "ScheduleScene")
        donateViewController = storyboard.instantiateViewController(withIdentifier: "DonateScene")
        programsViewController = storyboard.instantiateViewController(withIdentifier: "ProgramsScene")
        statusViewController = storyboard.instantiateViewController(withIdentifier: "StatusScene")
        contactViewController = storyboard.instantiateViewController(withIdentifier: "ContactScene")
        
        allViewControllers = [homeViewController,volunteerViewController,scheduleViewController,donateViewController,programsViewController,statusViewController,contactViewController]
        
        menuButtons[selectedMenuItem].isSelected = true
        
        didPressMenu(menuButtons[selectedMenuItem])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didPressMenu(_ sender: UIButton) {
        //let previousMenuItem = selectedMenuItem
        
        statusBtn.isHidden = true
        dropDownArrowBtn.isSelected = false
        
        let previousViewController = allViewControllers[selectedMenuItem]
        
        selectedMenuItem = sender.tag
        let selectedViewController = allViewControllers[selectedMenuItem]
        
        for i in 0...6 {
            menuButtons[i].isSelected = false
        }
        //menuButtons[previousMenuItem].isSelected = false
        
        previousViewController.willMove(toParentViewController: nil)
        previousViewController.view.removeFromSuperview()
        previousViewController.removeFromParentViewController()
        
        sender.isSelected = true
        addChildViewController(selectedViewController)
        selectedViewController.view.frame = contentView.bounds
        contentView.addSubview(selectedViewController.view)
        selectedViewController.didMove(toParentViewController: self)
        
        if sender.tag == 5 {
            statusBtn.isHidden = true
            dropDownArrowBtn.isSelected = false
        }
    }
    
    @IBAction func dropDownPressed(_ sender: UIButton) {
        contentView.bringSubview(toFront: statusBtn)
        if(dropDownArrowBtn.isSelected) {
            statusBtn.isHidden = true
            dropDownArrowBtn.isSelected = false
        } else {
            statusBtn.isHidden = false
            dropDownArrowBtn.isSelected = true
        }
    }
}

