//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Mehta on 06/02/16.
//  Copyright © 2016 Mehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue : Int = 50
    var targetValue : Int = 50
    var roundNumber : Int = 1
    var scoreValue : Int = 0
    var difference :  Int = 0
    var roundScore : Int = 0

    @IBOutlet weak var randomNumber: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var hitMe: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var startOver: UIButton!
   


    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        targetValue = Int(arc4random_uniform(101))
        randomNumber.text = "\(targetValue)"
        scoreValue = 0
        scoreLabel.text = "Score : \(scoreValue)"
        roundNumber = 1
        roundLabel.text = "Round : \(roundNumber)"
        roundScore = 0

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(sender: AnyObject) {
        currentValue = lroundf(slider.value)
    }
    
    
    @IBAction func showAlert(sender: AnyObject) {
        self.score()
        let message = "The value of slider is \(currentValue) \n The target value is \(targetValue) \n You scored \(roundScore)"
        let alert = UIAlertController(title: "Bulls Eye", message: message, preferredStyle: .Alert)
        
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action:UIAlertAction!) in
            self.roundNumber++
            self.roundLabel.text = "Round : \(self.roundNumber)"
            self.currentValue = 50
            self.slider.value = Float(self.currentValue)
            self.targetValue = Int(arc4random_uniform(101))
            self.randomNumber.text = "\(self.targetValue)"
            }))
            
        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func startOver(sender: AnyObject) {
        currentValue = lroundf(slider.value)
        targetValue = Int(arc4random_uniform(101))
        randomNumber.text = "\(targetValue)"
        scoreValue = 0
        scoreLabel.text = "Score : \(scoreValue)"
        roundNumber = 1
        roundLabel.text = "Round : \(roundNumber)"
        roundScore = 0
    }
    
    func score(){
        if(targetValue > currentValue){
            difference = targetValue - currentValue
        }
        if(targetValue < currentValue){
            difference = currentValue - targetValue
        }
        if(targetValue == currentValue){
            difference = 0
        }
        if(difference == 0){
            roundScore = 400
            scoreValue = scoreValue + 400
        }
        if(difference == 1){
            roundScore = 200
            scoreValue = scoreValue + 200
        }
        if(difference == 2){
            roundScore = 100
            scoreValue = scoreValue + 100
        }
        if(difference == 3){
            roundScore = 50
            scoreValue = scoreValue + 50
        }
        if(difference == 4){
            roundScore = 40
            scoreValue = scoreValue + 40
        }
        if(difference == 5){
            roundScore = 30
            scoreValue = scoreValue + 30
        }
        if(difference == 6){
            roundScore = 20
            scoreValue = scoreValue + 20
        }
        if(difference == 7){
            roundScore = 10
            scoreValue = scoreValue + 10
        }
        if(difference == 8){
            roundScore = 5
            scoreValue = scoreValue + 5
        }
        if(difference > 8){
            roundScore = 0
        }
        scoreLabel.text = "Score : \(scoreValue)"
    }
}
