//
//  ViewController.swift
//  testDuoiHinh
//
//  Created by Macintosh HD on 3/19/18.
//  Copyright © 2018 google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Answers: UIView!
    @IBOutlet weak var Choice: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addButton(subview: Answers, number: 5)
        addButton(subview: Choice, number: 5)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addButton(subview : UIView,number: Int ){
        var NoIndex = 0
        let mainScreen: CGRect = UIScreen.main.bounds;
        var Y: CGFloat = 10
        for i in 0...number - 1 {
            var X: CGFloat = CGFloat(10 + 50 * NoIndex)
            // kiem tra co tran button khong?
            if (X + 70 > mainScreen.size.width){
                Y = Y + 40
                X = 10
                NoIndex = 0
            }
            NoIndex = NoIndex + 1
            let button : UIButton = UIButton(frame: CGRect(x:X,y:Y,width:40 ,height:30))
            button.backgroundColor = UIColor.blue
            button.layer.cornerRadius = 5
            button.tag = i + 100
           subview.addSubview(button)
    
    }

}
}
