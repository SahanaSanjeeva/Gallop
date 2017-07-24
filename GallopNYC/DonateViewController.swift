//
//  DonateViewController.swift
//  GallopNYC
//
//  Created by Sahana Sanjeeva on 2/15/17.
//  Copyright © 2017 GallopNYC. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController, UITextFieldDelegate, PayPalPaymentDelegate {
    
    @IBOutlet var donateAmountTxt: UITextField!
    
    var environment:String = PayPalEnvironmentNoNetwork {
        willSet(newEnvironment) {
            if (newEnvironment != environment) {
                PayPalMobile.preconnect(withEnvironment: newEnvironment)
            }
        }
    }
    
    var resultText = ""
    var payPalConfig = PayPalConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.donateAmountTxt.delegate = self
        
        // Set up payPalConfig
        payPalConfig.acceptCreditCards = false
        payPalConfig.merchantName = "GallopNYC"
        payPalConfig.merchantPrivacyPolicyURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/privacy-full")
        payPalConfig.merchantUserAgreementURL = URL(string: "https://www.paypal.com/webapps/mpp/ua/useragreement-full")
        
        payPalConfig.languageOrLocale = Locale.preferredLanguages[0]
        
        payPalConfig.payPalShippingAddressOption = .none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func payPalPaymentDidCancel(_ paymentViewController: PayPalPaymentViewController) {
        print("PayPal Payment Cancelled")
        resultText = ""
        //successView.isHidden = true
        paymentViewController.dismiss(animated: true, completion: nil)
    }
    
    func payPalPaymentViewController(_ paymentViewController: PayPalPaymentViewController, didComplete completedPayment: PayPalPayment) {
        print("PayPal Payment Success !")
        paymentViewController.dismiss(animated: true, completion: { () -> Void in
            // send completed confirmaion to your server
            print("Here is your proof of payment:\n\n\(completedPayment.confirmation)\n\nSend this to your server for confirmation and fulfillment.")
            
            self.resultText = completedPayment.description
            //self.showSuccess()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    /*func showSuccess() {
        successView.isHidden = false
        successView.alpha = 1.0
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationDelay(2.0)
        successView.alpha = 0.0
        UIView.commitAnimations()
    }*/
    
    @IBAction func donatePressed(_ sender: Any) {
        let amtDonatedTxt = donateAmountTxt.text!
        if (!(amtDonatedTxt.isEmpty) && ((Int(amtDonatedTxt) != nil) || (Float(amtDonatedTxt) != nil))) {
            resultText = ""
            
            let item1 = PayPalItem(name: "Donate Amount", withQuantity: 1, withPrice: NSDecimalNumber(string: donateAmountTxt.text), withCurrency: "USD", withSku: "donate")
            
            let items = [item1]
            let subtotal = PayPalItem.totalPrice(forItems: items)
            
            let shipping = NSDecimalNumber(string: "0")
            let tax = NSDecimalNumber(string: "0")
            let paymentDetails = PayPalPaymentDetails(subtotal: subtotal, withShipping: shipping, withTax: tax)
            
            let total = subtotal.adding(shipping).adding(tax)
            
            let payment = PayPalPayment(amount: total, currencyCode: "USD", shortDescription: "GallopNYC Donation Amount", intent: .authorize)
            
            payment.items = items
            payment.paymentDetails = paymentDetails
            
            if (payment.processable) {
                let paymentViewController = PayPalPaymentViewController(payment: payment, configuration: payPalConfig, delegate: self)
                present(paymentViewController!, animated: true, completion: nil)
                print("Payment processed: \(payment)")
            } else {
                // This particular payment will always be processable. If, for
                // example, the amount was negative or the shortDescription was
                // empty, this payment wouldn't be processable, and you'd want
                // to handle that here.
                print("Payment not processable: \(payment)")
            }
        } else {
            donateAmountTxt.text = "Enter donation Amount"
            donateAmountTxt.backgroundColor = UIColor.red
        }
    }
}
