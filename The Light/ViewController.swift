//
//  ViewController.swift
//  The Light
//
//  Created by Alexey Zinovyev on 08.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var isLightOn = 0
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        isLightOn = 2
    }
        
    fileprivate func updateUI() {

        switch isLightOn {
        
        case 1:
            view.backgroundColor = .red // Красный
            isLightOn += 1
        case 2:
            view.backgroundColor = .orange // Оранжевый
            isLightOn += 1
        case 3:
            view.backgroundColor = .yellow // Желтый
            isLightOn += 1
        case 4:
            view.backgroundColor = .green // Зеленый
            isLightOn += 1
        case 5:
            view.backgroundColor = UIColor(red: 128/255, green: 166/255, blue: 255/255, alpha: 1.0) // Голубой или .cyan
            isLightOn += 1
        case 6:
            view.backgroundColor = .blue // Синий
            isLightOn += 1
        default:
            view.backgroundColor = .purple // Фиолетовый
            isLightOn = 1
            
        }
    }
    
    // MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      //  isLightOn.toggle()
        updateUI()
    }
      
}

