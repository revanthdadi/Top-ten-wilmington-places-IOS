//
//  WebsiteViewController.swift
//  RDadiTopTenWilmington
//
//  Created by Revanth Reddy Dadi on 14/10/18.
//  Copyright © 2018 Revanth Reddy Dadi. All rights reserved.
//
/*
 Author:        Revanth Reddy Dadi
 Your Z-ID:     Z1823815
 Course:        CSCI 521, FALL 2018
 Instructor:    Professor Kai Rush
 T.A:           Rajarshi sen
 Due Date:      Monday, 10/15/2018, 11:59 PM
 
 About application: This application is midterm exam project. This application displays the top ten attractions, hotels and restaurants of Wilmington, North Carolina with more details about each one. The application contains 7 views and 2 controllers. The first view of the application will have buttons for attractions, hotels and restaurants. When one of the button is pressed then a table view will open with details. When one of the table view row is selected then detail view loads up and displays more details on the selected row. There are two more buttons on detail view where one is about the website of selected destination, another button is to make a phone call to the appropriate destination management. The initial view also has a info light button which when pressed will load about app view, this view contains details about the app and a button to send an email feedback about the app and other button to view the local webpage about the author of the application.
 
 Sources: https://en.wikipedia.org/wiki/Wilmington,_North_Carolina
 https://www.yelp.com/search?find_desc=&find_loc=Wilmington%2C+NC&ns=1
 https://www.google.com/search?ei=US_FW5DXHOLdjwT-uKnQCA&q=wilmington+north+carolina&oq=w&gs_l=psy-ab.1.0.35i39l2j0i131j0l4j0i131j0j0i131.1320.1906..3047...1.0..0.77.77.1......0....1..gws-wiz.....6.H1SyizMcAgU
 */

//import statements
import UIKit
import WebKit

//The websiteViewController will load an external webpage on to the view.
//When a detail button with visit website title is pressed, then it will load up this controller view with a external webpage.
class WebsiteViewController: UIViewController {

    //Reference to the web view
    @IBOutlet weak var myWebView: WKWebView!
    
    //Optional variables to store the values of passed from the detail view
    var tvWebURL: String!
    var tvSubName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the title of the web page
        navigationItem.title = tvSubName
        
        //Retrieve the url
        let url = URL(string: tvWebURL)
        
        //Request the url
        let requestUrl = URLRequest(url: url!)
        
        //Load the requested url on the web view
        myWebView.load(requestUrl)

    }

}
