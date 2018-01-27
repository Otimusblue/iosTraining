//
//  ViewController.swift
//  Quiz
//
//  Created by Nguyen Ba Linh on 1/27/18.
//  Copyright © 2018 TranNgocHieu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var questionIndex: Int = 0
    let questions: [String] = ["What's your name?",
                               "How old are you?",
                               "Where are you from?",
                               "4 + 4 = ?"]
    let answers: [String] = ["Hieu",
                             "21",
                             "Nghe An",
                             "8"]
    
    
    @IBAction func nextQuestion(_sender: UIButton){
        questionIndex += 1
        if (questionIndex == questions.count){
            questionIndex = 0
        }
        let question:String = questions[questionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    @IBAction func showAnswer(_sender: UIButton){
        let answer:String = answers[questionIndex]
        answerLabel.text = answer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[questionIndex]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

