//
//  AboutAuthorViewController.swift
//  RDadiTopTenWilmington
//
//  Created by Revanth Reddy Dadi on 10/10/18.
//  Copyright © 2018 Revanth Reddy Dadi. All rights reserved.
//
/*
 Author:        Revanth Reddy Dadi
 
 About application: This application is midterm exam project. This application displays the top ten attractions, hotels and restaurants of Wilmington, North Carolina with more details about each one. The application contains 7 views and 2 controllers. The first view of the application will have buttons for attractions, hotels and restaurants. When one of the button is pressed then a table view will open with details. When one of the table view row is selected then detail view loads up and displays more details on the selected row. There are two more buttons on detail view where one is about the website of selected destination, another button is to make a phone call to the appropriate destination management. The initial view also has a info light button which when pressed will load about app view, this view contains details about the app and a button to send an email feedback about the app and other button to view the local webpage about the author of the application.
 
 Sources: https://en.wikipedia.org/wiki/Wilmington,_North_Carolina
 https://www.yelp.com/search?find_desc=&find_loc=Wilmington%2C+NC&ns=1
 https://www.google.com/search?ei=US_FW5DXHOLdjwT-uKnQCA&q=wilmington+north+carolina&oq=w&gs_l=psy-ab.1.0.35i39l2j0i131j0l4j0i131j0j0i131.1320.1906..3047...1.0..0.77.77.1......0....1..gws-wiz.....6.H1SyizMcAgU
 */

//Import statement
import UIKit
import WebKit

//This aboutAuthorViewController will load an local webpage on to the view
class AboutAuthorViewController: UIViewController {
    
    @IBOutlet weak var myWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create a path to fetch the content/data of the index.html file as part of your project app bundle
        let path = Bundle.main.path(forResource: "index", ofType: "html")!
        
        //Retrieve the data from the given path
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        
        //Encode the data and load it in html
        let html = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        
        //Load the data into the IBOutlet called myWebView
        myWebView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)

        // Do any additional setup after loading the view.
    }
}
