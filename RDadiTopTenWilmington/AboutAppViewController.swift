//
//  AboutAppViewController.swift
//  RDadiTopTenWilmington
//
//  Created by Revanth Reddy Dadi on 10/10/18.
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

//Import statements
import UIKit
import MessageUI

//This AboutAppViewController is also a subClass for MFMailComposeViewControllerDelegate.
//It loads when info light button in the initial view is pressed.
//This view contains data about the app and two buttons where one sends compose an email to send feedback about the app
//The other button will load the local webpage which contains about the author of the app
class AboutAppViewController: UIViewController, MFMailComposeViewControllerDelegate {

    //It also has a done button which when pressed will dismiss the present view
    @IBAction func doneBarButton(_ sender: UIBarButtonItem)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    //When a send Email feedback button is pressed the loads a framework onto the view
    @IBAction func sendFeedbackButton(_ sender: UIButton)
    {
        //Load the mail view controller
        let mailComposeVC = MFMailComposeViewController()
        
        //Make it as it's own delegate
        mailComposeVC.mailComposeDelegate = self
        
        //Set the recipents
        let toRecipents = ["niucsci@gmail.com"]
        
        //set the title
        let emailTitle = "RDadiTopTenWilmington"
        
        //Set the message body
        let messageBody = "Revanth Reddy Dadi, Z1823815, Due Date : 10/15/2018, 11:59 PM"
        
        //Load the recipents into the framework
        mailComposeVC.setToRecipients(toRecipents)
        
        //Load the subject into the framework
        mailComposeVC.setSubject(emailTitle)
        
        //Load the message body into the framework
        mailComposeVC.setMessageBody(messageBody, isHTML: false)
        
        //Present the framework on the screen
        self.present(mailComposeVC, animated: true, completion: nil)
    }
    
    //When a send button is pressed then dismiss the mail view
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    //When the about author button is pressed
    //Load the author view with a local webpage
    @IBAction func AboutAuthorButton(_ sender: UIButton)
    {
        //Get the main storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //find the controller with the identifier "AboutAuthorViewController"
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AboutAuthorViewController") as! AboutAuthorViewController
        
        //Transfer the controller to the identified controller in destinationVC
        self.navigationController?.pushViewController(destinationVC, animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
