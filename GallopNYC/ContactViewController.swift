//
//  ContactViewController.swift
//  GallopNYC
//
//  Created by Sahana Sanjeeva on 2/15/17.
//  Copyright © 2017 GallopNYC. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //@IBOutlet var subjectTextField: UITextField!
    //@IBOutlet var subjectPickerView: UIPickerView!
    
    var subjectDropContents = ["Volunteering", "Press Inquiries", "Riding", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //subjectPickerView.delegate = self
        //subjectPickerView.dataSource = self
        
        //subjectPickerView.isHidden = true
        //subjectTextField.text = subjectDropContents[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return subjectDropContents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return subjectDropContents[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //subjectTextField.text = subjectDropContents[row]
        //subjectPickerView.isHidden = true
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
