//
//  ViewController.swift
//  duoiHinh
//
//  Created by Macintosh HD on 3/11/18.
//  Copyright © 2018 google. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var answers : [String] = ["C","H","I","D","I","E","M"]
    var answers1 : [String] = []
    lazy var choice = addRandomCharacter(array: answers, index: 3)
    var countt = 0
    @objc func playTapped(sender: UIButton){
        var answersNumber = answers.count
        if (countt < answersNumber){
        sender.isHidden = true
            let lbl  = view.viewWithTag(countt+100) as! UIButton
            lbl.setTitle(sender.titleLabel?.text, for: .normal)
            answers1.append(lbl.titleLabel!.text!)
       //sender.titleLabel?.text
        countt+=1
        }
        if(countt == answersNumber){
            if (answers1 == answers) {
                let alert: UIAlertController = UIAlertController(title: "Thông Báo", message: "Ngon", preferredStyle: UIAlertControllerStyle.alert)
                
                let btn : UIAlertAction = UIAlertAction(title: "Thoát", style: .default, handler: nil)
                alert.addAction(btn)
                present(alert, animated: true, completion: nil)
            }
            else {
                let alert: UIAlertController = UIAlertController(title: "Thông Báo", message: "Sai Rồi", preferredStyle: UIAlertControllerStyle.alert)
                
                let btn : UIAlertAction = UIAlertAction(title: "Thoát", style: .default, handler: nil)
                let back: UIAlertAction = UIAlertAction(title: "Back", style: .default, handler: { (back) in
                    //sender.isHidden = false
                    
                    
                })
                alert.addAction(btn)
                alert.addAction(back)
                present(alert, animated: true, completion: nil)
                
            }
        }
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choice.shuffle()
        addButtonAnswers(number: answers.count)
        addButtonChoice(number: choice.count)
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
    }
    
   // tao button cho answers
    func addButtonAnswers(number: Int){
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
                Answer.addSubview(button)
                print(button.tag)
                
            }
        }
        
    
   //tao button cho choice
    func addButtonChoice(number: Int){
            var NoIndex = 0
            let mainScreen: CGRect = UIScreen.main.bounds;
            var Y: CGFloat = 10
            for i in 0...number - 1 {
                var X: CGFloat = CGFloat(10 + 50*NoIndex)
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
                Choice.addSubview(button)
            // them Text cho button
                button.setTitle(choice[i],for : .normal)
                button.addTarget(self, action:#selector(ViewController.playTapped(sender:)),  for: .touchUpInside)
                
                

            }
        }
    
    
    
   



    @IBOutlet weak var Choice: UIView!
    @IBOutlet weak var Answer: UIView!
   
    


}
