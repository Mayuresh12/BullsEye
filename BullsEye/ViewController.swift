//
//  ViewController.swift
//  BullsEye
//
//  Created by Mayuresh Rao on 1/14/18.
//  Copyright © 2018 Mayuresh Rao. All rights reserved.


import UIKit

class ViewController: UIViewController {
    var currentValue : Int = 0
    @IBOutlet weak var slider : UISlider!
    var targetValue : Int = 0
    var score  = 0
    var round = 1
    var bonus = 50
    @IBOutlet weak var targetValueOutlet: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel : UILabel!    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewGame()

        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") //UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted") //UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft") //UIImage(named : "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight") //UIImage(named : "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackRightResizable, for: .normal)
        
        
        
    }
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound (){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue =  50
        round += 1
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels (){
        targetValueOutlet.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert(_ sender: Any) {
        let  difference = abs(currentValue - targetValue)
        var points = 100 - difference
        let title :String
        if difference == 0{
            title = "Perfect!"
            points += 100
        }else if difference < 5{
            title = "You almost had it!"
            if difference == 1{
            points += 50
            }
        }else if difference < 10{
            title = "Pretty good!"
        }else{
            title = "Not even close..."
        }
        score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound() //this is concept about closure
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)//Alerts are called asynchroniously
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The currrent value of the slider is \(slider)")
        currentValue = lroundf(slider.value)
    }

}

