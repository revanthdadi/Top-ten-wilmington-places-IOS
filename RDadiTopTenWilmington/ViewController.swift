//
//  ViewController.swift
//  RDadiTopTenWilmington
//
//  Created by Revanth Reddy Dadi on 10/10/18.
//  Copyright © 2018 Revanth Reddy Dadi. All rights reserved.
//
/*
 Author:        Revanth Reddy Dadi
 
 About application: This application displays the top ten attractions, hotels and restaurants of Wilmington, North Carolina with more details about each one. The application contains 7 views and 2 controllers. The first view of the application will have buttons for attractions, hotels and restaurants. When one of the button is pressed then a table view will open with details. When one of the table view row is selected then detail view loads up and displays more details on the selected row. There are two more buttons on detail view where one is about the website of selected destination, another button is to make a phone call to the appropriate destination management. The initial view also has a info light button which when pressed will load about app view, this view contains details about the app and a button to send an email feedback about the app and other button to view the local webpage about the author of the application.
 
 Sources: https://en.wikipedia.org/wiki/Wilmington,_North_Carolina
 https://www.yelp.com/search?find_desc=&find_loc=Wilmington%2C+NC&ns=1
 https://www.google.com/search?ei=US_FW5DXHOLdjwT-uKnQCA&q=wilmington+north+carolina&oq=w&gs_l=psy-ab.1.0.35i39l2j0i131j0l4j0i131j0j0i131.1320.1906..3047...1.0..0.77.77.1......0....1..gws-wiz.....6.H1SyizMcAgU
 */

import UIKit

//This is the initial view which loads three buttons which when pressed will load the appropriate destination on to the view.
//It also has info light button on top right cornor which when pressed will load the about app view.
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call to the function
        addRightNavigationBarInfoButton()
    }
    
    /* This function creates an a button of type "Info light" on the top right cornor */
    func addRightNavigationBarInfoButton() {
        
        // Create an Info light button
        let button = UIButton(type: .infoLight)
        
        //When the button is pressed execeute showAboutAppView function
        button.addTarget(self, action: #selector(self.showAboutAppView), for: .touchUpInside)
        
        //Position the button at top right cornor
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    /*This function will load the about app view by placing the controller at the aboutAppNavigationController start which loads it's first view in that navigation controller */
    @objc func showAboutAppView() {
        //Identifying the about app navigation controller on the storyboad
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AboutAppNavigationController") as! UINavigationController
        
        //Show the about app view.
        self.present(controller, animated: false, completion: nil)
        
    }
    
    //Before loading the other views this function will be executed
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //If the segue is a atrraction segue
        if(segue.identifier == "AttractionsTableView")
        {
            //Assign a value to the variable in the destination view with attractions
            let destVC = segue.destination as! TopTenTableViewController
            
            destVC.searchType = "Attractions"
        }
        
        //If the segue is a hotel segue
        if(segue.identifier == "HotelsTableView")
        {
            //Assign a value to the variable in the destination view with hotels
            let destVC = segue.destination as! TopTenTableViewController
            
            destVC.searchType = "Hotels"
        }
        
        //If the seguee is a restaurant segue
        if(segue.identifier == "RestaurantsTableView")
        {
            //Assign a value to the variable in the destination view with restaurant
            let destVC = segue.destination as! TopTenTableViewController
            
            destVC.searchType = "Restaurants"
        }
    }//End of prepare
}//ViewController

