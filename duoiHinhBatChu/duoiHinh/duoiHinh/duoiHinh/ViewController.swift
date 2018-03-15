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
     
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //in ra button o answer
        var index = 3
        var answers : [String] = ["C","H","I","D","I","E","M"]
        let answers1 = answers
        answers.shufffe()
        let count = answers1.count
        print(count)
        for i in 0...6 {
            // Answer button
            let button : UIButton = UIButton(frame: CGRect(x: 10 + 50*i, y: 10, width: 40, height: 30))
            
            button.backgroundColor = UIColor.blue
            button.layer.cornerRadius = 5
            button.tag = i + 100
            print(button.tag)
            Answer.addSubview(button)
        }
        while (index > 0) {
            let a: String = randomizeAvailableLetters()
            if (!answers.contains(a)) {
                answers.append(a)
                index-=1
            }
            
        }
        print(answers)
        
        // in ra button o choice
        var NoIndex = 0      // chi so hang
        let mainScreen: CGRect = UIScreen.main.bounds;
        var Y: CGFloat = 10
        for i in 0...9 {
            var X: CGFloat = CGFloat(10 + 50*NoIndex)
            //Choice Button
            
            if (X + 70 > mainScreen.size.width){
                Y = Y + 40
                X = 10
                NoIndex = 0
            }
            NoIndex = NoIndex + 1
            let button : UIButton = UIButton(frame: CGRect(x:X,y:Y,width:40 ,height:30))
            button.backgroundColor = UIColor.blue
            button.layer.cornerRadius = 5
            button.tag = i
            Choice.addSubview(button)
         
         print(answers)
         //Set text va action
          
         button.setTitle(answers[i], for: .normal)
         button.addTarget(self, action: #selector(playTapped), for: .touchUpInside)
    }
     

    }
 // ngoai class
    @objc func playTapped(sender: UIButton){
        //  while(count > 0){
        sender.isHidden = true
        
        // }
        
        print(sender.titleLabel!.text)
    }
    
    func randomizeAvailableLetters() -> String {
        let alphabet: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        let rand = Int(arc4random_uniform(26))
        return alphabet[rand]
    }


    @IBOutlet weak var Choice: UIView!
    @IBOutlet weak var Answer: UIView!
    
    
}
extension Array {
    public mutating func shufffe() {
        var temp = [Element]()
        while !isEmpty{
        let i = Int(arc4random_uniform(UInt32(count)))
        let obj = remove(at: i)
        temp.append(obj)
        }
        self = temp
    }
    
}
