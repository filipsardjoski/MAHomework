//
//  MapsAndLocationViewController.swift
//  Domashna_141156
//
//  Created by Filip Sardzoski on 4/16/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapsAndLocationViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    let locationManager =  CLLocationManager()
    var pin = MKPointAnnotation()
    
    
    @IBAction func showCurrentLocation(_ sender: Any) {
        map.removeAnnotation(pin)
        let currentCoordinate : CLLocationCoordinate2D = (locationManager.location?.coordinate)!
        let newPin = MKPointAnnotation()
        newPin.coordinate = currentCoordinate
        
        //Set region
        let region = MKCoordinateRegion(center: currentCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        map.setRegion(region, animated: true)
        
        //Add annotation (pin)
        map.addAnnotation(newPin)
        
        //Keep pin in memory, to remove it on new button press
        pin = newPin
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        map.mapType = .hybrid
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
}
