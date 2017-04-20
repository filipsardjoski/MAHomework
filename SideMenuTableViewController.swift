//
//  MyRootViewController.swift
//  
//
//  Created by Filip Sardzoski on 4/14/17.
//
//

import UIKit
import SideMenu

class SideMenuTableViewController: UITableViewController {

    var items = ["Maps and Location", "Web Service", "Social Network Integration", "GCD", "Camera", "Accelerometer", "Notifications", "Custom Animation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SideMenu Start
        
        // Define the menus
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        
        SideMenuManager.menuLeftNavigationController = menuLeftNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        SideMenuManager.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        //SideMenu End
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RootViewControllerCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[indexPath.row];
        
        return cell
    }
    
    /*func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let row = indexPath.row
        print("\(row) - \(items[row])")
    }*/
    
    override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
        // Get storyboard
        //let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Get profile NC
        //let profileNC = storyboard.instantiateViewControllerWithIdentifier("LoginNC") as! UINavigationController
        
        switch (indexPath.row) {
            case 0:
                //let MapsAndLocationViewController = self.storyboard?.instantiateViewController(withIdentifier: "MapsAndLocation")
                //let MAL = storyboard.instantiateViewController(withIdentifier: "MapsAndLocation") as! UINavigationController
                //self.navigationController?.pushViewController(MAL, animated: true)
                //self.present(MAL, animated: true, completion: nil)
                //self.presentedViewController?.
                
                if let vc3 = self.storyboard?.instantiateViewController(withIdentifier: "MapsAndLocation") as? UINavigationController {
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController!.present(vc3, animated: true, completion: nil)
                }
                
                break
            case 1:
                //let WebServiceViewController = self.storyboard?.instantiateViewController(withIdentifier: "WebService")
                //self.navigationController = WebServiceViewController?.navigationController
                // self.navigationController?.pushViewController(WebServiceViewController!, animated: true)
                break
            case 2:
                let SocialNetworkIntegrationViewController = self.storyboard?.instantiateViewController(withIdentifier: "SocialNetworkIntegration")
                self.navigationController?.pushViewController(SocialNetworkIntegrationViewController!, animated: true)
                break
            case 3:
                let GCDViewController = self.storyboard?.instantiateViewController(withIdentifier: "GCD")
                self.navigationController?.pushViewController(GCDViewController!, animated: true)
                break
            case 4:
                let CameraViewController = self.storyboard?.instantiateViewController(withIdentifier: "Camera")
                self.navigationController?.pushViewController(CameraViewController!, animated: true)
                break
            case 5:
                let AccelerometerViewController = self.storyboard?.instantiateViewController(withIdentifier: "Accelerometer")
                self.navigationController?.pushViewController(AccelerometerViewController!, animated: true)
                break
            default: break
        }
    }
    
}


