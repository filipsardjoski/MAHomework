//
//  AccelerometerViewController.swift
//  Domashna_141156
//
//  Created by Filip Sardzoski on 4/17/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {
    
    let motionManager = CMMotionManager()
    
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) {
            (data, error) in
            if let trueData = data {
                self.view.reloadInputViews()
                self.xLabel.text = String(trueData.acceleration.x)
                self.yLabel.text = String(trueData.acceleration.y)
                self.zLabel.text = String(trueData.acceleration.z)
            }
        }
    }
}
