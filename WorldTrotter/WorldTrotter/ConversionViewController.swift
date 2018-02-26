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
    @IBOutlet weak var textField: UITextField!
    
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
      //  textField.delegate = self
        updateCelsiusLabel()
        
    }

       @IBAction func dismissKeyboard(_ sender: AnyObject) {
          textField.resignFirstResponder()
        }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        
        if existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }          

}


