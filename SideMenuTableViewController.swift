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

    var items = ["Maps and Location", "Web Service", "Social Network Integration", "GCD", "Camera", "Accelerometer"]
    
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
        
        /*switch (indexPath.row) {
            case 0:
                performSegue(withIdentifier: "MapsAndLocationSegue", sender: self)
                break
            case 1:
                performSegue(withIdentifier: "WebServiceSegue", sender: self)
                break
            case 2:
                performSegue(withIdentifier: "SocialNetworkIntegrationSegue", sender: self)
                break
            case 3:
                performSegue(withIdentifier: "GCDSegue", sender: self)
                break
            case 4:
                performSegue(withIdentifier: "CameraSegue", sender: self)
                break
            case 5:
                performSegue(withIdentifier: "OtherSensorSegue", sender: self)
                break
            default: break
        }*/
    }
    
}


