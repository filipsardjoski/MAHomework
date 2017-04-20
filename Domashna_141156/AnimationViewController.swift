//
//  AnimationViewController.swift
//  Domashna_141156
//
//  Created by Filip Sardzoski on 4/20/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    var button = UIButton()
    
    @IBAction func animationButtonIsPressed(_ sender: Any) {
        button = sender as! UIButton
        
        //Se pravi pomalo kopcheto
        button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: .allowUserInteraction,
                       animations: { [weak self] in
                            self?.button.transform = .identity
            }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
