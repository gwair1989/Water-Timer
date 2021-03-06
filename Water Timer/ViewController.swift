//
//  ViewController.swift
//  Water Timer
//
//  Created by Aleksandr Khalupa on 30.05.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let systemSoundID: SystemSoundID = 1016
    let dictionary = ["10 min": 10, "15 min": 15, "20 min": 20]
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
    }
    
    @IBAction func pressedGlases(_ sender: UIButton) {
        
        guard let titeleOfButtons = sender.currentTitle else {
            return
        }
        
        guard var getSeconds = dictionary[titeleOfButtons] else {
            return
        }
        
        guard let staticSecond = dictionary[titeleOfButtons] else {
            return
        }
        
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (blockTimer) in
            if getSeconds > 0 {
                self.infoLabel.text = "\(getSeconds) seconds"
                getSeconds -= 1
                let caunterForvard = staticSecond - getSeconds
                self.progressBar.progress = Float(caunterForvard) / Float(staticSecond)
            } else {
                self.timer.invalidate()
                self.infoLabel.text = "Done!\n\nYou need to drink some wather!".uppercased()
                AudioServicesPlaySystemSound(self.systemSoundID)
            }
        }
    }
}
