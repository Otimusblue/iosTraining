//
//  ViewController.swift
//  Buggy
//
//  Created by Macintosh HD on 3/3/18.
//  Copyright © 2018 Buggy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    @IBAction func buttonTaped(_ sender: UIButton) {
//        print("Taped Taped")
//    }
    
    @IBAction func switchToggle(_ sender: UISwitch) {
        print("hello")
        print("Is control on? \(sender.isOn)")
    }
    
}

