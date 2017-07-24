//
//  ContactViewController.swift
//  GallopNYC
//
//  Created by Sahana Sanjeeva on 2/15/17.
//  Copyright © 2017 GallopNYC. All rights reserved.
//

import UIKit
import MapKit

class ContactViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
 
    @IBAction func sunriseMapPress(_ sender: UIButton) {
        directionButtonPress(coordinate: CLLocationCoordinate2DMake(40.671080, -73.851160), nameTag: "Gallop Sunrise Stables")
    }
    
    @IBAction func forestHillsMapPress(_ sender: UIButton) {
        directionButtonPress(coordinate: CLLocationCoordinate2DMake(40.708190, -73.853800), nameTag: "Gallop Forest Hills")
    }
    
    @IBAction func prospectMapPress(_ sender: UIButton) {
        directionButtonPress(coordinate: CLLocationCoordinate2DMake(40.648688, -73.971310), nameTag: "Gallop Prospect Park")
    }
    
    @IBAction func jamaicaBayMapPress(_ sender: UIButton) {
        directionButtonPress(coordinate: CLLocationCoordinate2DMake(40.607533, -73.897240), nameTag: "Gallop Jamaica Bay")
    }
    
    @IBAction func pelhamBayMapPress(_ sender: UIButton) {
        directionButtonPress(coordinate: CLLocationCoordinate2DMake(40.866065, -73.813946), nameTag: "Gallop Pelham Bay Park")
    }
    
    @IBAction func vanCprtlandMapPress(_ sender: UIButton) {
        directionButtonPress(coordinate: CLLocationCoordinate2DMake(40.902394, -73.894286), nameTag: "Gallop Van Cortland Park")
    }
    
    func directionButtonPress(coordinate: CLLocationCoordinate2D, nameTag: String) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        let placeMark = MKPlacemark(coordinate: coordinate)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: coordinateRegion.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: coordinateRegion.span)]
        
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = nameTag
        mapItem.openInMaps(launchOptions: options)
    }
}

@IBDesignable extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
}
