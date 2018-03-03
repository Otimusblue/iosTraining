//
//  ViewController.swift
//  Test
//
//  Created by Macintosh HD on 3/2/18.
//  Copyright © 2018 testWT. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController , UIWebViewDelegate {

    @IBOutlet weak var webView: WKWebView!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myURL = URL(string : "http://bignerdranch.com")
        let request = URLRequest(url : myURL!)
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

