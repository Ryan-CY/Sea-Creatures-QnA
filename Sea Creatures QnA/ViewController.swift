//
//  ViewController.swift
//  Sea Creatures QnA
//
//  Created by Ryan Lin on 2022/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var creatureImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var showAnswerNextButton: UIButton!
    //questions需寫在function外面
    //宣告questions成Controller的屬性，讓大家都讀得到
    var questions = [Question]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let question1 = Question(answer: "seahorse")
        questions.append(question1)
        let question2 = Question(answer: "starfish")
        questions.append(question2)
        let question3 = Question(answer: "whale")
        questions.append(question3)
        let question4 = Question(answer: "jellyfish")
        questions.append(question4)
        let question5 = Question(answer: "octopus")
        questions.append(question5)
        let question6 = Question(answer: "fish")
        questions.append(question6)
        let question7 = Question(answer: "crab")
        questions.append(question7)
        let question8 = Question(answer: "puffer fish")
        questions.append(question8)
        let question9 = Question(answer: "seal")
        questions.append(question9)
        let question10 = Question(answer: "dolphin")
        questions.append(question10)
        
        //讓每次打開APP題目順序都不一樣(所以寫在viewDidLoad裡)
        questions.shuffle()
        //讓image跟著對應questions array的answer
        creatureImageView.image = UIImage(named: questions[index].answer)
        //設定answerLabel的邊框
        answerLabel.layer.borderWidth = CGFloat(10)
        answerLabel.layer.borderColor = CGColor(red: 102/255, green: 178/255, blue: 1, alpha: 1)
    }
    fileprivate func routine() {
        answerLabel.text = ""
        creatureImageView.image = UIImage(named: questions[index].answer)
        progressSlider.value = Float(index)
        progressLabel.text = String("\(index+1)/10")
    }
    @IBAction func answerButton(_ sender: Any) {

        if answerLabel.text == ""{
            answerLabel.text = questions[index].answer
        }
        else if answerLabel.text == String(questions[index].answer){
            if index < questions.count-1{
                index = (index+1)%questions.count
                routine()
            }
            else{
                showAnswerNextButton.isEnabled = false
                answerLabel.text = "Press Replay"
            }
        }
    }
    @IBAction func replayButton(_ sender: Any) {
        questions.shuffle()
        index = 0
        showAnswerNextButton.isEnabled = true
        routine()
    }
}
