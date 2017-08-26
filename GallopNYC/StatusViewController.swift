//
//  StatusViewController.swift
//  GallopNYC
//
//  Created by Sahana Sanjeeva on 8/2/17.
//  Copyright © 2017 GallopNYC. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var statusTableData = ["Status of today's classes"]
    var statusColorIndicator = ["neutral"]
    
    let cellReuseIdentifier = "cell"
    //let cellSpacingHeight: CGFloat = 10

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.statusTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        statusTableView.delegate = self
        statusTableView.dataSource = self
        
        dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
        
        var className = String()
        var status = String()
        
        let fileData = Bundle.main.path(forResource: "statusdatasource", ofType: "txt")
        
        do {
            let content = try String(contentsOfFile: fileData!)
            let readings = content.components(separatedBy: CharacterSet.newlines)
            
            for line in readings {
               let clientData = line.components(separatedBy: ",")
                className = clientData[0]
                status = clientData[1]
                print("Class Name ---", className, "-- Its status --", status)
                statusTableData.append(className)
                statusColorIndicator.append(status)
            }
        } catch {
            print("File couldn't be decoded!!!")
        }
        self.statusTableView.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return statusTableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.statusTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        let row = indexPath.row
        cell.textLabel?.text = statusTableData[row]
        
        if statusColorIndicator[row] == "yes" {
            cell.backgroundColor = UIColor.green
        } else if statusColorIndicator[row] == "cancelled" {
            cell.backgroundColor = UIColor.red
        } else if statusColorIndicator[row] == "pending" {
            cell.backgroundColor = UIColor.yellow
        }  else if statusColorIndicator[row] == "no" {
            cell.backgroundColor = UIColor.gray
        } else {
            cell.backgroundColor = UIColor.white
        }
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        return cell
    }
}
