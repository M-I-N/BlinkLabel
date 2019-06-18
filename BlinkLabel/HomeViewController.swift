//
//  HomeViewController.swift
//  BlinkLabel
//
//  Created by Nayem BJIT on 5/9/19.
//  Copyright © 2019 BJIT Ltd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var blinkableLabel: BlinkLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blinkableLabel.colors = [.red, .green]
    }

    @IBAction func startButtonDidTap(_ sender: UIButton) {
        blinkableLabel.startBlinking()
    }

    @IBAction func stopButtonDidTap(_ sender: UIButton) {
        blinkableLabel.stopBlinking()
    }
}

