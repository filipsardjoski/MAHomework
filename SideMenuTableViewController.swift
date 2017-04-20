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
                let viewController = storyboard?.instantiateViewController(withIdentifier: "mapsAndLocation")
                self.navigationController?.pushViewController(viewController!, animated: false)
                break
            case 1:
                let viewController = storyboard?.instantiateViewController(withIdentifier: "webService")
                self.navigationController?.pushViewController(viewController!, animated: false)
                break
            case 2:
                let viewController = storyboard?.instantiateViewController(withIdentifier: "socialNetworkIntegration")
                self.navigationController?.pushViewController(viewController!, animated: false)
                break
            case 3:
                let viewController = storyboard?.instantiateViewController(withIdentifier: "gcd")
                self.navigationController?.pushViewController(viewController!, animated: false)
                break
            case 4:
                let viewController = storyboard?.instantiateViewController(withIdentifier: "camera")
                self.navigationController?.pushViewController(viewController!, animated: false)
                break
            case 5:
                let viewController = storyboard?.instantiateViewController(withIdentifier: "accelerometer")
                self.navigationController?.pushViewController(viewController!, animated: false)
                break
            case 6:
                let viewController = storyboard?.instantiateViewController(withIdentifier: "notifications")
                self.navigationController?.pushViewController(viewController!, animated: false)
                break
            case 7:
                let viewController = storyboard?.instantiateViewController(withIdentifier: "animation")
                self.navigationController?.pushViewController(viewController!, animated: false)
                break
            default: break
        }
    }
    
}


