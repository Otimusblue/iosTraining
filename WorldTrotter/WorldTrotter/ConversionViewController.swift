//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Nguyen Ba Linh on 1/30/18.
//  Copyright © 2018 TranNgocHieu. All rights reserved.
//

import Foundation
import UIKit

class ConversionViewController : UIViewController ,UITextFieldDelegate  {
    @IBOutlet weak var celsiusLabel: UITextField!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue : Measurement<UnitTemperature>?{
        didSet{
        updateCelsiusLabel()
        }
    }
    
    var celsiusValue : Measurement<UnitTemperature>?{
        if let fahrenheitValue = fahrenheitValue {
            return  fahrenheitValue.converted(to: .celsius)
        } else
        {
           return nil
        }
    }
    let numberFormatter: NumberFormatter = {
                let nf = NumberFormatter()
                nf.minimumFractionDigits = 0
                nf.maximumFractionDigits = 1
                return nf
            }()
    
    func updateCelsiusLabel() {
                if let celsiusValue = celsiusValue {
                    celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
                } else {
                    celsiusLabel.text = "???"
                }
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }

       @IBAction func dismissKeyboard(_ sender: AnyObject) {
          textField.resignFirstResponder()
  
    
}



//class ConversionViewController: UIViewController, UITextFieldDelegate {
//
//    @IBOutlet var celsiusLabel: UILabel!
//    @IBOutlet var textField: UITextField!
//
//    var fahrenheitValue: Measurement<UnitTemperature>? {
//        didSet {
//            updateCelsiusLabel()
//        }
//    }
//
//    var celsiusValue: Measurement<UnitTemperature>? {
//        if let fahrenheitValue = fahrenheitValue {
//            return fahrenheitValue.converted(to: .celsius)
//        } else {
//            return nil
//        }
//    }
//
//    let numberFormatter: NumberFormatter = {
//        let nf = NumberFormatter()
//        nf.minimumFractionDigits = 0
//        nf.maximumFractionDigits = 1
//        return nf
//    }()
//
//    func updateCelsiusLabel() {
//        if let celsiusValue = celsiusValue {
//            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
//        } else {
//            celsiusLabel.text = "???"
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        updateCelsiusLabel()
//    }
//
//    @IBAction func dismissKeyboard(_ sender: AnyObject) {
//        textField.resignFirstResponder()
//}
//
