//
//  WebServiceViewController.swift
//  Domashna_141156
//
//  Created by Filip Sardzoski on 4/17/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import Firebase

class WebServiceViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ref = FIRDatabase.database().reference()
        
        ref.observe(FIRDataEventType.value, with: { (snapshot) in
            let postDict = snapshot.value as? [String : AnyObject] ?? [:]
            var flag = true
            for i in postDict {
                if flag {
                    self.textLabel.text = String(describing: i.value)
                }
                flag = false
            }
        })
    }
}
