//
//  DetailViewController.swift
//  RDadiTopTenWilmington
//
//  Created by Revanth Reddy Dadi on 11/10/18.
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

//import statement
import UIKit

//The detailViewController will load the view with the selected destination details.
//It also has a website button which when pressed will open the destination webpage.
//It also has a phone number button which will make a call to the destination management.
class DetailViewController: UIViewController {

    //References to the image,labels and button of the view
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var fareLabel: UILabel!
    @IBOutlet weak var phoneButtonLabel: UIButton!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    
    //When a phone call button is pressed, this function will execute
    @IBAction func makeCallButton(_ sender: UIButton)
    {
        //Guard statement to retrieve the phone number on the button title
        guard let phoneNum = sender.titleLabel?.text else {return}
        
        //Load the phone number into myURL
        let myURL:NSURL = URL(string: "tel://\(phoneNum)")! as NSURL
        
        //Send the phone number to phoneCall app.
        UIApplication.shared.open(myURL as URL, options:[:], completionHandler: nil)
    }
    
    //Optional variables to hold the data sent from the table view
    var tvType: String!
    var tvDescription: String!
    var tvFare: String!
    var tvHours: String!
    var tvAddress: String!
    var tvPhoneNumber: String!
    var tvImage: String!
    var tvName: String!
    var tvSubName: String!
    var tvWebsite: String!
    var tvLatitude: String!
    var tvLongitude: String!
    var tvClass: String!
    var tvRating: String!
    var tvAdvantages: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //If the loaded type is attractions then load the label with appropriate details
        if(tvType == "Attractions")
        {
            //Set the title of the view
            navigationItem.title = tvSubName
            
            //Set the label values with optional values
            descriptionLabel.text = tvDescription
            addressLabel.text = tvAddress
            hoursLabel.text = tvHours
            fareLabel.text = tvFare
            
            //Set the phone button with phone number
            phoneButtonLabel.setTitle(tvPhoneNumber, for: .normal)
            
            //Set the appropriate image
            imageView.image = UIImage(named: tvImage)
        }
        
        //If the loaded type is a hotels then load the label with appropriate details
        if(tvType == "Hotels")
        {
            //Set the title of the view
            navigationItem.title = tvSubName
            
            //Set the appropriate image
            imageView.image = UIImage(named: tvImage)
            
            //Set the label values with optional values
            ratingLabel.text = "Rating:"
            descriptionLabel.text = tvRating
            addressLabel.text = tvAddress
            
            //Set the phone button with phone number
            phoneButtonLabel.setTitle(tvPhoneNumber, for: .normal)
            thirdLabel.text = "Advantages:"
            hoursLabel.text = tvAdvantages
            
            //Hide the label with no data
            fourthLabel.text = " "
            
        }
        
        //IF the loaded type is a restaurants then load the label with appropriate details
        if(tvType == "Restaurants")
        {
            //Set the title of the view
            navigationItem.title = tvSubName
            
            //Set the appropriate image
            imageView.image = UIImage(named: tvImage)
            ratingLabel.text = "Rating:"
            descriptionLabel.text = tvRating
            addressLabel.text = tvAddress
            
            //Set the phone button with phone number
            phoneButtonLabel.setTitle(tvPhoneNumber, for: .normal)
            hoursLabel.text = tvHours
            
            //Hide the label with no data
            fourthLabel.text = " "
        }
    }
    
    //Before loading the website
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //If the segue is a website
        if(segue.identifier == "Website")
        {
            //Create instance of the destination controller
            let destVC = segue.destination as! WebsiteViewController
            
            //Pass values to the destination variables
            destVC.tvSubName = tvSubName
            destVC.tvWebURL = tvWebsite
        }
    }

}
