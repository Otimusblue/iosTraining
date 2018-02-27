//
//  ViewController.swift
//  testWT
//
//  Created by Macintosh HD on 2/27/18.
//  Copyright © 2018 testWT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   // khau bao bien lam viec voi storyboard
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // khai bao bien lam viec voi gia tri cua user nhap vao
    var fahrenheitValue : Measurement<UnitTemperature>?{
        
        // dat mac dinh moi khi thuc hien bien nay se khoi dong
        didSet {
            updateCelsiusLabel()
        }
    }
    
    // Convert tu F -> C
    var celsiusValue : Measurement<UnitTemperature>? {
       
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    // modify number
    let numberFormatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //khai bao ham
    // khai bao ham lam viec voi textfield
    
    
    @IBAction func fahrenheitFieldEdittingChanged( _ textField : UITextField){
     
       // Kiem tra textfield khac nil va hop le
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = Measurement(value : value , unit : .fahrenheit)
        }
        else{
            fahrenheitValue = nil
        }
    }
    
    //khai bao ham lam viec voi ban phim
    
    @IBAction func dismissKeyBoard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
        func updateCelsiusLabel() {
            if let celsiusValue = celsiusValue {
                celsiusLabel.text = numberFormatter.string(from: NSNumber(value:celsiusValue.value))
            } else {
                celsiusLabel.text = "???"
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateCelsiusLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

