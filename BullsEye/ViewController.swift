//
//  ViewController.swift
//  BullsEye
//
//  Created by Mayuresh Rao on 1/14/18.
//  Copyright © 2018 Mayuresh Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func showAlert(_ sender: Any) {
        let alert = UIAlertController.init(title: "Hello, World!", message: "This is my first app!", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

