//
//  WKViewController.swift
//  testWT
//
//  Created by Macintosh HD on 3/2/18.
//  Copyright © 2018 testWT. All rights reserved.
//

import Foundation
import WebKit

class WKViewController : UIViewController , UIWebViewDelegate {
  
  
    @IBOutlet weak var webView: WKWebView!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myUrl = URL(string: "https://www.bignerdranch.com")
        let myRequest = URLRequest(url: myUrl!)
        webView.load(myRequest)
    }
}
