//
//  ViewController.swift
//  BullsEye
//
//  Created by Mayuresh Rao on 1/14/18.
//  Copyright © 2018 Mayuresh Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue : Int = 0
    @IBOutlet weak var slider : UISlider!
    var targetValue : Int = 0
    @IBOutlet weak var targetValueOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startNewRound()
    }
    func startNewRound (){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue =  50
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels (){
        targetValueOutlet.text = String(targetValue)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert(_ sender: Any) {
        let message = "The value of the slider is \(currentValue)" + " \n The target value is :\(targetValue)"
        let alert = UIAlertController.init(title: "Hello, World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        print("The currrent value of the slider is \(slider)")
        currentValue = lroundf(slider.value)
    }

}

