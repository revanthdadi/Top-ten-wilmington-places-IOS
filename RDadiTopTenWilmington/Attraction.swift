//
//  Attraction.swift
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

//This class will variables which store the corresponding attribute values from Attractions.plist
class Attraction: NSObject
{
    //Instance variables
    var att_name: String!
    var att_subName: String!
    var att_description: String!
    var att_fare: String!
    var att_timing: String!
    var att_phone: String!
    var att_website: String!
    var att_address: String!
    var att_visitors: String!
    var att_latitude: String!
    var att_longitude: String!
    var att_cellImage: String!
    var att_image: String!
    
    //This initializer method will initialize variables with values
    init(att_name: String,att_subName: String, att_description: String, att_fare: String, att_timing: String, att_phone: String, att_website: String, att_address: String, att_visitors: String, att_latitude: String, att_longitude: String, att_cellImage: String, att_image: String)
    {
        //Assigning values to the variables
        self.att_name = att_name
        self.att_subName = att_subName
        self.att_description = att_description
        self.att_fare = att_fare
        self.att_timing = att_timing
        self.att_phone = att_phone
        self.att_website = att_website
        self.att_address = att_address
        self.att_visitors = att_visitors
        self.att_latitude = att_latitude
        self.att_longitude = att_longitude
        self.att_cellImage = att_cellImage
        self.att_image = att_image
    }

}
