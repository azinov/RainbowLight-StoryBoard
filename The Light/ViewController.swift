//
//  ViewController.swift
//  The Light
//
//  Created by Alexey Zinovyev on 08.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn = 1
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black    }
        
    fileprivate func updateUI() {

        switch isLightOn {
        
        case 1:
            view.backgroundColor = .red
            isLightOn += 1
        case 2:
            view.backgroundColor = .orange
            isLightOn += 1
        case 3:
            view.backgroundColor = .yellow
            isLightOn += 1
        case 4:
            view.backgroundColor = .green
            isLightOn += 1
        case 5:
//          view.backgroundColor = UIColor(red: 128.0, green: 166.0, blue: 255.0, alpha: 1.0)
            view.backgroundColor = UIColor.cyan
            isLightOn += 1
        case 6:
            view.backgroundColor = .blue
            isLightOn += 1
        default:
            view.backgroundColor = .purple
            isLightOn = 1
            
        }
    }
    
    // MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  isLightOn.toggle()
        updateUI()
    }
      
}

