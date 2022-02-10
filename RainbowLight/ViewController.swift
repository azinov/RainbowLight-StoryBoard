//
//  ViewController.swift
//  The Light
//
//  Created by Alexey Zinovyev on 08.02.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    /// Set the color of view
    var viewColor = 0
    var colorUI = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor(red: 128/255, green: 166/255, blue: 255/255, alpha: 1.0), UIColor.blue, UIColor.purple]
    var touchCount = 1
    
    /// Hide status bar
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

        viewColor += 1

        switch viewColor {

        case 1:
            view.backgroundColor = .red // Красный
            toggleTorch(on: true, level: 0.1)
        case 2:
            view.backgroundColor = .orange // Оранжевый
            toggleTorch(on: true, level: 0.2)
        case 3:
            view.backgroundColor = .yellow // Желтый
            toggleTorch(on: true, level: 0.3)
        case 4:
            view.backgroundColor = .green // Зеленый
            toggleTorch(on: true, level: 0.4)
        case 5:
            view.backgroundColor = UIColor(red: 128/255, green: 166/255, blue: 255/255, alpha: 1.0) // Голубой или .cyan
            toggleTorch(on: true, level: 0.5)
        case 6:
            view.backgroundColor = .blue // Синий
            toggleTorch(on: true, level: 0.6)
        default:
            view.backgroundColor = .purple // Фиолетовый
            viewColor = 0
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
        // Use switch
        //        switchUpdateUI()
        
        // Use array of colorUI
        
        touchCount = touchCount <= colorUI.count-1 ? touchCount : 0
        view.backgroundColor = colorUI[touchCount]
        touchCount += 1
        
    }
    
}

