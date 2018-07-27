//
//  ViewController.swift
//  Quizzler
//
//  Created by Anuranjan Bose on 27/07/18.
//  Copyright © 2018 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var questionNumber : Int = 0
    var pickedAnswer : Bool = false
    var score : Int = 0
    
    let allQuestions = QuestionBank()
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var progressBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        nextQuestion()
    }

    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber = questionNumber + 1
        nextQuestion()
        
        
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        if questionNumber <= 12 {
        progressLabel.text = "\(questionNumber+1)/13"
        progressBar.frame.size.width = (view.frame.size.width/13)*CGFloat(questionNumber + 1)
        }
        
    }
    
    func nextQuestion() {
        updateUI()
        if questionNumber <= 12 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            
        }
        else {
            
            
            if score == 13 {
                showAlert(titl: "Awesome, you scored \(score)")
                            }
            else if score >= 10 && score < 13 {
              showAlert(titl: "Very good, you scored \(score)" )
            }
            else if score >= 5 && score < 10 {
                showAlert(titl : "Not bad, you scored \(score)")
            }
            else if score >= 1 && score < 5 {
                showAlert(titl: "Hard luck, you scored \(score)")
            }
            else {
                showAlert(titl: "Oops, you scored 0")
            }
            
            
        }
        
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        if pickedAnswer == correctAnswer {
            print("You got it!")
            score += 1
        }
        else {
            print("Wrong!")
        }
        
    }
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        nextQuestion()
    }
    
    func showAlert(titl: String) {
        let alert = UIAlertController(title: titl, message: "Wanna start over?", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
            self.startOver()
        })
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
        
    }
}

