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
    var colorUI = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor(red: 128/255, green: 166/255, blue: 255/255, alpha: 1.0), UIColor.blue, UIColor.purple]
    /// Count of touches
    var touchCount = 1
    /// State of Light
    var lightOff = true

    /// Hide status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toggleTorch(on: true, lightLevel: 0.1)
        lightButton.setImage(UIImage(systemName: "flashlight.off.fill"), for: .normal)
        
        // Почему-то не скейлит картинку UIImage внутри UIButton, сделал через атрибут инспектор
        //        lightButton.imageView?.contentMode = .scaleAspectFit
        
        lightMax.isHidden = true
    }
        
    // Try to toggle Torch
    fileprivate func toggleTorch(on: Bool, lightLevel: Float) {
        guard
            let device = AVCaptureDevice.default(for: AVMediaType.video),
            device.hasTorch
        else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            try device.setTorchModeOn(level: lightLevel)
            device.unlockForConfiguration()
        } catch {
            print("Torch could not be used")
        }
    }
    
    // MARK: - Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Use array of colorUI
        
        touchCount = touchCount <= colorUI.count-1 ? touchCount : 0
        view.backgroundColor = colorUI[touchCount]
        touchCount += 1
        
    }
    
    @IBOutlet weak var lightButton: UIButton!
    
    @IBOutlet weak var lightMax: UIImageView!
    
    
    @IBAction func lightButtonPressed (_ sender: Any) {
        
        if lightOff {
            lightButton.setImage(UIImage(systemName: "flashlight.on.fill"), for: .normal)
            toggleTorch(on: true, lightLevel: 1.0)
        } else {
            lightButton.setImage(UIImage(systemName: "flashlight.off.fill"), for: .normal)
            toggleTorch(on: false, lightLevel: 0)
        }
        
        lightOff.toggle()
        lightMax.isHidden.toggle()
        
    }
    
    
}

