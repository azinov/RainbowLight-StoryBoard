//
//  ViewController.swift
//  The Light
//
//  Created by Alexey Zinovyev on 08.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    fileprivate func updateUI() {
        view.backgroundColor = isLightOn ? .white : .black
    }
    
    @IBAction func buttonPressed() {
        isLightOn.toggle()
        updateUI()
    }
      
}

