//
//  ViewController.swift
//  duoiHinh
//
//  Created by Macintosh HD on 3/11/18.
//  Copyright © 2018 google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var index = 3
        var answers : [String] = ["C","H","I","D","I","E","M"]
        for i in 0...6 {
            // Answer button
            let button : UIButton = UIButton(frame: CGRect(x: 10 + 50*i, y: 10, width: 40, height: 30))
            
            button.backgroundColor = UIColor.blue
            button.layer.cornerRadius = 5
            button.tag = i
            Answer.addSubview(button)
            }
        while (index > 0) {
            let a: String = randomizeAvailableLetters()
            if (!answers.contains(a)) {
                answers.append(a)
            }
            index-=1
        }
       print(answers)
        
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        var NoIndex = 0
        let mainScreen: CGRect = UIScreen.main.bounds;
        var Y: CGFloat = 10
        for i in 0...11 {
            var X: CGFloat = CGFloat(10 + 50*NoIndex)
            //Choice Button
            
            if (X + 40 > mainScreen.size.width - 32 ){
                Y = Y + 40
                X = 10
                NoIndex = 0
            }
            NoIndex = NoIndex + 1
            let button : UIButton = UIButton(frame: CGRect(x:X,y:Y,width:40 ,height:30))
            button.backgroundColor = UIColor.blue
            button.layer.cornerRadius = 5
            button.tag = 1
            Choice.addSubview(button)
        }
    }
    func randomizeAvailableLetters() -> String {
        let alphabet: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        let rand = Int(arc4random_uniform(26))
        return alphabet[rand]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var Choice: UIView!
    @IBOutlet weak var Answer: UIView!
    
    
}

