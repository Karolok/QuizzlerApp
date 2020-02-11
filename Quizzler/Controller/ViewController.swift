//
//  ViewController.swift
//  Quizzler
//
//  Created by Karol Bryzgiel on 11/02/2020.
//  Copyright © 2020 Karol Bryzgiel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI();
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        if ( quizBrain.checkIsWin()) {
           performSegue(withIdentifier: "endSegue", sender: self)
        }
        quizBrain.nextQuestion()
    
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionLabelText()
        trueButton.setTitle(quizBrain.getFirstButtonLabelText(), for: .normal)
        falseButton.setTitle(quizBrain.getSecondButtonLabelText(), for: .normal)
        thirdButton.setTitle(quizBrain.getThirdButtonLabelText(), for: .normal)
        
        progressBar.progress = quizBrain.getProgressBarValue()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        
    }
}

