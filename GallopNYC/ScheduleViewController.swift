//
//  VolunteerViewController.swift
//  GallopNYC
//
//  Created by Sahana Sanjeeva on 2/10/17.
//  Copyright © 2017 GallopNYC. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func openUrl(urlStr:String!) {
        let url = URL(string: urlStr)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                print("Open url : \(success)")
            })
        } else {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    @IBAction func pressedSignUp(_ sender: UIButton) {
        openUrl(urlStr: "https://volunteer.gallopnyc.org/HOC__Volunteer_Registration_Page")
    }
    
    @IBAction func didPressSearch(_ sender: AnyObject) {
        openUrl(urlStr: "https://volunteer.gallopnyc.org/HOC__Volunteer_Opportunity_Search_Page")
    }
}

