//
//  GDCViewController.swift
//  Domashna_141156
//
//  Created by Filip Sardzoski on 4/17/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit

class GDCViewController: UIViewController {

    var counter : Int = 0
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func incrementButtonPressed(_ sender: Any) {
        counter += 1
        countLabel.text = String (counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countLabel.text = "0"
        counter = 0
        
        let url = URL(string: "https://www.nasa.gov/sites/default/files/thumbnails/image/lunar_flashlight_over_south_pole.jpg")
        
        DispatchQueue.global().async {
            
            let dataUrl = NSData (contentsOf: url!)
            let imageData = UIImage (data: dataUrl! as Data)
            
            DispatchQueue.main.async {
                self.img.image = imageData
            }
        }
    }

}
