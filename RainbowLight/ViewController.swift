//
//  ViewController.swift
//  The Light
//
//  Created by Alexey Zinovyev on 08.02.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var viewColor = 1
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewColor = 2
        toggleTorch(on: true, level: 0.1)
    }
        
    fileprivate func switchUpdateUI() {

        switch viewColor {
        
        case 1:
            view.backgroundColor = .red // Красный
            viewColor += 1
            toggleTorch(on: true, level: 0.1)
        case 2:
            view.backgroundColor = .orange // Оранжевый
            viewColor += 1
            toggleTorch(on: true, level: 0.2)
        case 3:
            view.backgroundColor = .yellow // Желтый
            viewColor += 1
            toggleTorch(on: true, level: 0.3)
        case 4:
            view.backgroundColor = .green // Зеленый
            viewColor += 1
            toggleTorch(on: true, level: 0.4)
        case 5:
            view.backgroundColor = UIColor(red: 128/255, green: 166/255, blue: 255/255, alpha: 1.0) // Голубой или .cyan
            viewColor += 1
            toggleTorch(on: true, level: 0.5)
        case 6:
            view.backgroundColor = .blue // Синий
            viewColor += 1
            toggleTorch(on: true, level: 0.6)
        default:
            view.backgroundColor = .purple // Фиолетовый
            viewColor = 1
            toggleTorch(on: true, level: 0.7)
            
        }
    }
    
    // Try to toggle Torch
    fileprivate func toggleTorch(on: Bool, level: Float) {
        guard
            let device = AVCaptureDevice.default(for: AVMediaType.video),
            device.hasTorch
        else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            try device.setTorchModeOn(level: level)
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    }
    
    // MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        switchUpdateUI()
    }
      
}

