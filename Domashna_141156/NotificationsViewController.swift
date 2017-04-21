//
//  NotificationsViewController.swift
//  Domashna_141156
//
//  Created by Filip Sardzoski on 4/20/17.
//  Copyright © 2017 Filip Sardzoski. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationsViewController: UIViewController {
    
    @IBAction func getNotificationButtonPressed(_ sender: Any) {
        if #available(iOS 10.0, *) {
            let content = UNMutableNotificationContent()
            content.title = "Local Notification"
            content.body = "Thank you for waiting 5 seconds"
            content.sound = UNNotificationSound.default()
            content.categoryIdentifier = "notificationIdentifier"
            // Deliver the notification in five seconds.
            let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 5.0, repeats: false)
            let request = UNNotificationRequest(identifier: "notificationIdentifier", content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
            UNUserNotificationCenter.current().add(request){(error) in
                
                if (error != nil){
                    
                    print(error?.localizedDescription as Any)
                }
            }
        }
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        print("Tapped in notification")
    }
    
    
    //This is key callback to present notification while the app is in foreground
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        print("Notification being triggered")
        //You can either present alert ,sound or increase badge while the app is in foreground too with ios 10
        //to distinguish between notifications
        if notification.request.identifier == "notificationIdentifier"{
            
            completionHandler( [.alert,.sound,.badge])
            
        }
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
