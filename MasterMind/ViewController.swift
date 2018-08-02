//
//  ViewController.swift
//  MasterMind
//
//  Created by Jason Hsu on 2018/8/1.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var clickTimes: Int = 0
    var numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",]
    var newNumbers: [String] = []
    var inputNumbers: [String] = []
    var radomNumbers: [String] = []
    var answers: [String] = []
    var i = 0
    var j = 0
    var aTimes = 0
    var bTimes = 0
    var sendTimes = 0
    
    
   @IBOutlet weak var inputDisplayLabel: UILabel!
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var ButtonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    
    @IBOutlet weak var answerLabel_1: UILabel!
    @IBOutlet weak var hintLabel_1: UILabel!
    @IBOutlet weak var answerLabel_2: UILabel!
    @IBOutlet weak var hintLabel_2: UILabel!
    @IBOutlet weak var answerLabel_3: UILabel!
    @IBOutlet weak var hintLabel_3: UILabel!
    @IBOutlet weak var answerLabel_4: UILabel!
    @IBOutlet weak var hintLabel_4: UILabel!
    @IBOutlet weak var answerLabel_5: UILabel!
    @IBOutlet weak var hintLabel_5: UILabel!
    @IBOutlet weak var answerLabel_6: UILabel!
    @IBOutlet weak var hintLabel_6: UILabel!
    @IBOutlet weak var answerLabel_7: UILabel!
    @IBOutlet weak var hintLabel_7: UILabel!
    @IBOutlet weak var answerLabel_8: UILabel!
    @IBOutlet weak var hintLabel_8: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func numberButtonsClick (_ sender: UIButton) {
        
            if clickTimes < 3 {
                inputDisplayLabel.text = inputDisplayLabel.text! + sender.currentTitle!
                inputNumbers.insert(sender.currentTitle!, at: clickTimes)
                sender.isEnabled = false
                clickTimes += 1
            } else if clickTimes == 3 {
                inputDisplayLabel.text = inputDisplayLabel.text! + sender.currentTitle!
                inputNumbers.insert(sender.currentTitle!, at: clickTimes)
                sender.isEnabled = false
                clickTimes += 1
                buttonOff()
           }
        
    }
        
    @IBAction func clearButtonClick(_ sender: Any) {
        inputDisplayLabel.text = ""
        buttonOn()
        clickTimes = 0
    }
    
    @IBAction func sendButtonClick(_ sender: Any) {
        sendTimes += 1
        if let inputDisplay = inputDisplayLabel.text {
            switch sendTimes  {
            case 1:
                answerLabel_1.text = inputDisplay
                aResult()
                bResult()
                hintLabel_1.text = "\(aTimes)A\(bTimes)B"
                buttonOn()
                inputDisplayLabel.text = ""
                clickTimes = 0
            case 2:
                answerLabel_2.text = inputDisplay
                aResult()
                bResult()
                hintLabel_2.text = "\(aTimes)A\(bTimes)B"
                buttonOn()
                inputDisplayLabel.text = ""
                clickTimes = 0
            case 3:
                answerLabel_3.text = inputDisplay
                aResult()
                bResult()
                hintLabel_3.text = "\(aTimes)A\(bTimes)B"
                buttonOn()
                inputDisplayLabel.text = ""
                clickTimes = 0
            case 4:
                answerLabel_4.text = inputDisplay
                aResult()
                bResult()
                hintLabel_4.text = "\(aTimes)A\(bTimes)B"
                buttonOn()
                inputDisplayLabel.text = ""
                clickTimes = 0
            case 5:
                answerLabel_5.text = inputDisplay
                aResult()
                bResult()
                hintLabel_5.text = "\(aTimes)A\(bTimes)B"
                buttonOn()
                inputDisplayLabel.text = ""
                clickTimes = 0
            case 6:
                answerLabel_6.text = inputDisplay
                aResult()
                bResult()
                hintLabel_6.text = "\(aTimes)A\(bTimes)B"
                buttonOn()
                inputDisplayLabel.text = ""
                clickTimes = 0
            case 7:
                answerLabel_7.text = inputDisplay
                aResult()
                bResult()
                hintLabel_7.text = "\(aTimes)A\(bTimes)B"
                buttonOn()
                inputDisplayLabel.text = ""
                clickTimes = 0
            case 8:
                answerLabel_8.text = inputDisplay
                aResult()
                bResult()
                hintLabel_8.text = "\(aTimes)A\(bTimes)B"
                winLabel.text = "You lost!"
                sendButton.isEnabled = false
                inputDisplayLabel.text = ""
                playButton.isHidden = false
            default:
                break
            }
        }
        
    }
    
    @IBAction func playButtonClick(_ sender: UIButton) {
        newNumbers = numbers.shuffled()
        radomNumbers = [newNumbers[0], newNumbers[2], newNumbers[4], newNumbers[5]]
        playButton.isHidden = true
        sendButton.isEnabled = true
        winLabel.text = ""
        sendTimes = 0
        buttonOn()
        print(radomNumbers)
        allLabelClear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendButton.isEnabled = false
        buttonOff()
    }
    
    func aResult() {
        aTimes = 0
        for i in 0...3 {
            if inputNumbers[i] == radomNumbers[i] {
                aTimes += 1
            }
        }
        if aTimes == 4 {
            playButton.isHidden = false
            winLabel.text = "You win!"
            sendButton.isEnabled = false
            sendTimes = 0
        }
    }
    
    func bResult() {
        bTimes = 0
        for i in 0...3 {
            for j in 0...3 {
                if inputNumbers[i] == radomNumbers[j] {
                    bTimes += 1
                }
            }
            
        }
    }
    
    func buttonOn() {
        buttonOne.isEnabled = true
        buttonTwo.isEnabled = true
        ButtonThree.isEnabled = true
        buttonFour.isEnabled = true
        buttonFive.isEnabled = true
        buttonSix.isEnabled = true
        buttonSeven.isEnabled = true
        buttonEight.isEnabled = true
        buttonNine.isEnabled = true
        buttonZero.isEnabled = true
    }
    
    func buttonOff() {
        buttonOne.isEnabled = false
        buttonTwo.isEnabled = false
        ButtonThree.isEnabled = false
        buttonFour.isEnabled = false
        buttonFive.isEnabled = false
        buttonSix.isEnabled = false
        buttonSeven.isEnabled = false
        buttonEight.isEnabled = false
        buttonNine.isEnabled = false
        buttonZero.isEnabled = false
    }
    
    func allLabelClear() {
        answerLabel_1.text = ""
        hintLabel_1.text = ""
        answerLabel_2.text = ""
        hintLabel_2.text = ""
        answerLabel_3.text = ""
        hintLabel_3.text = ""
        answerLabel_4.text = ""
        hintLabel_4.text = ""
        answerLabel_5.text = ""
        hintLabel_5.text = ""
        answerLabel_6.text = ""
        hintLabel_6.text = ""
        answerLabel_7.text = ""
        hintLabel_7.text = ""
        answerLabel_8.text = ""
        hintLabel_8.text = ""
    }

}

