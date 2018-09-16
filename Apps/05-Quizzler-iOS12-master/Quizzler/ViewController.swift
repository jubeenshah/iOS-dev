//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    //var questionSelected : Int  = 0
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBarWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //questionSelected = Int.random(in: 0...12)
        nextQuestion()

    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
    }
    
    
    func updateUI() {
        progressLabel.text = "Question : \(questionNumber + 1) / 13"
        scoreLabel.text = "Score : \(score)"
        progressBarWidth.constant = (view.frame.size.width / 13 ) * CGFloat(questionNumber + 1)
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }else {
            let alert = UIAlertController(title: "Awesome", message: "You've finished all the question, do you want to start again?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default , handler:{ (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnser = allQuestions.list[questionNumber].answer
        
        if correctAnser == pickedAnswer {
            print("Yes Bro")
            ProgressHUD.showSuccess("Correct")
            score += 1
            
        }
        else {
            print("No Bro")
            ProgressHUD.showError("Wrong")
            
        }
        
        
        questionNumber += 1
        nextQuestion()
        
    }
    
    
    func startOver() {
       
        questionNumber = 0
        nextQuestion()
        score = 0
    }
    

    
}
