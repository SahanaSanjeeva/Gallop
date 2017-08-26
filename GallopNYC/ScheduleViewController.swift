//
//  ScheduleViewController.swift
//  GallopNYC
//
//  Created by Sahana Sanjeeva on 8/2/17.
//  Copyright © 2017 GallopNYC. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    @IBOutlet weak var calendarWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://calendar.google.com/calendar/embed?src=gallopnyc.org_c0d5i9ae8sguq3nl7nuu5pad9g%40group.calendar.google.com&ctz=America/New_York")!
        let urlRequest = URLRequest (url: url)
        
        calendarWebView.loadRequest(urlRequest)
    }
    
}
