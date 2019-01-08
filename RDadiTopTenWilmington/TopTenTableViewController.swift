//
//  TopTenTableViewController.swift
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

//Import statement
import UIKit


/*
  TopTenTableViewController is a subclass of UITableViewController.
  This is a data source for the table view which loads destinations. When a button is pressed on the initial screen then table view with appropriate destinations details is loaded. The process of the loading is done in this class.
  This class will read the property list of each type of destinations and then load the appropriate one into the table view.
  When a cell is selected then it loads the detail view and passes data into the detail view.
*/
class TopTenTableViewController: UITableViewController {
    
    //Optional variable to store the type of search
    var searchType: String!
    
    //Objects to save attractions, hotels and restaurants from property list
    var attractionsObject = [Attraction]()
    var hotelsObject = [Hotel]()
    var restaurantsObject = [Restaurant]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Set the title for the navigation
        navigationItem.title = searchType
        
        //Set the height of the cell
        self.tableView.rowHeight = 160

        //If the search type is attractions then call the readAttractionsPropertyList
        if(searchType == "Attractions")
        {
            readAttractionsPropertyList()
        }
        
        //If the search type is hotels then call the readHotelsPropertyList
        if(searchType == "Hotels")
        {
            readHotelsPropertyList()
        }
        
        //If the search type is restaurants then call the readRestaurantsPropertyList
        if(searchType == "Restaurants")
        {
            readRestaurantsPropertyList()
        }
    }
    
    //This function will load the attractions property list into the AttractionsArray
    //From attractionsArray into attractionsObject
    func readAttractionsPropertyList()
    {
        //Getting the path of Attractions.plist
        let path = Bundle.main.path(forResource: "Attractions", ofType: "plist")!
        
        //Reading the property list data and displaying it on console
        let attractionsArray:NSArray = NSArray(contentsOfFile: path)!
        print("\(attractionsArray)")
        
        //Retieve each item in attractionsArray
        for item in attractionsArray
        {
            //Convert each item into dictionary
            let dictionary: [String : String] = (item as! Dictionary)
            
            //Store each value in dictionary to constant variables
            let name = dictionary["Name"]
            let subName = dictionary["SubName"]
            let description = dictionary["Description"]
            let fare = dictionary["Fare"]
            let address = dictionary["Address"]
            let phone = dictionary["Phone"]
            let timing = dictionary["Timing"]
            let website = dictionary["Website"]
            let latitude = dictionary["Latitude"]
            let longitude = dictionary["Longitude"]
            let visitors = dictionary["Visitors"]
            let cellImage = dictionary["CellImage"]
            let image = dictionary["Image"]
            
            //Create a Attraction object and then append it into attractionsObject
            attractionsObject.append(Attraction(att_name: name!,att_subName: subName!, att_description: description!, att_fare: fare!, att_timing: timing!, att_phone: phone!, att_website: website!, att_address: address!, att_visitors: visitors!, att_latitude: latitude!, att_longitude: longitude!, att_cellImage: cellImage!, att_image: image!))
        }
    }
    
    //This function will load the hotels property list into the hotelsArray
    //From hotelsArray into hotelsObject
    func readHotelsPropertyList()
    {
        //getting the path of hotels.plist
        let path = Bundle.main.path(forResource: "Hotels", ofType: "plist")!
        
        //Reading the property list data and displaying it on console
        let hotelsArray: NSArray = NSArray(contentsOfFile: path)!
        print("\(hotelsArray)")
        
        //Retieve each item in hotelsArray
        for item in hotelsArray
        {
            //Convert each item into dictionary
            let dictionary: [String : String] = (item as! Dictionary)
            
            //Store each value in dictionary to constant variables
            let name = dictionary["Name"]
            let subName = dictionary["SubName"]
            let classType = dictionary["Class"]
            let rating = dictionary["Rating"]
            let address = dictionary["Address"]
            let phone = dictionary["Phone"]
            let website = dictionary["Website"]
            let advantages = dictionary["Advantages"]
            let latitude = dictionary["Latitude"]
            let longitude = dictionary["Longitude"]
            let cellImage = dictionary["CellImage"]
            let image = dictionary["Image"]
            
            //Create a object for Hotel and then append it into hotelsObject
            hotelsObject.append(Hotel(att_name: name!, att_subName: subName!, att_class: classType!, att_rating: rating!, att_address: address!, att_phone: phone!, att_website: website!, att_advantage: advantages!, att_latitude: latitude!, att_longitude: longitude!, att_cellImage: cellImage!, att_image: image!))
        }
    }
    
    //This function will load the restaurants property list into the restaurantsArray
    //From restaurantsArray into restaurantssObject
    func readRestaurantsPropertyList()
    {
        //getting the path of restaurants.plist
        let path = Bundle.main.path(forResource: "Restaurants", ofType: "plist")!
        
        //Reading the property list data and displaying it on console
        let restaurantsArray: NSArray = NSArray(contentsOfFile: path)!
        print("\(restaurantsArray)")
        
        //Retieve each item in restaurantsArray
        for item in restaurantsArray
        {
            //Convert each item into dictionary
            let dictionary: [String : String] = (item as! Dictionary)
            
            //Store each value in dictionary to constant variables
            let name = dictionary["Name"]
            let subName = dictionary["SubName"]
            let description = dictionary["Description"]
            let rating = dictionary["Rating"]
            let address = dictionary["Address"]
            let phone = dictionary["Phone"]
            let hours = dictionary["Hours"]
            let website = dictionary["Website"]
            let latitude = dictionary["Latitude"]
            let longitude = dictionary["Longitude"]
            let cellImage = dictionary["CellImage"]
            let image = dictionary["Image"]
            
            //Create a object for Restaurant and then append it into restaurantsObject
            restaurantsObject.append(Restaurant(att_name: name!, att_subName: subName!, att_description: description!, att_rating: rating!, att_address: address!, att_phone: phone!, att_hours: hours!, att_website: website!, att_latitude: latitude!, att_longitude: longitude!, att_cellImage: cellImage!, att_image: image!))
        }
    }

    //Return the number of sections for table
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //Return the number of cells to load on the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Return the attractionsObject.count if type is Attractions
        if(searchType == "Attractions")
        {
            return attractionsObject.count
        }
        
        //Return the hotelsObject.count if type is Hotels
        if(searchType == "Hotels")
        {
            return hotelsObject.count
        }
        
        //Return the restaurantsObject.count if type is Restaurants
        if(searchType == "Restaurants")
        {
            return restaurantsObject.count
        }
        
        //If not any type then return 0
        return 0
    }

    //Return the cell with details
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //Retrieve the cell from the table view
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        
        //If searchType is Attractions
        //Then load the cell with the appropriate content
        if(searchType == "Attractions")
        {
            let attraction: Attraction = attractionsObject[indexPath.row]
            
            //Set the title, subTitle and image
            cell.title.text = attraction.att_name
            cell.subTitle.text = attraction.att_visitors
            cell.cellImage.image = UIImage(named: attraction.att_cellImage)
        }
        
        //If searchType is Hotels
        //Then load the cell with the appropriate content
        if(searchType == "Hotels")
        {
            let hotel: Hotel = hotelsObject[indexPath.row]
            
            //Set the title, subTitle and image
            cell.title.text = hotel.att_name
            cell.subTitle.text = hotel.att_class
            cell.cellImage.image = UIImage(named: hotel.att_cellImage)
        }
        
        //If searchType is Restaurants
        //Then load the cell with the appropriate content
        if(searchType == "Restaurants")
        {
            let restaurant: Restaurant = restaurantsObject[indexPath.row]
            
            //Set the title, subTitle and image
            cell.title.text = restaurant.att_name
            cell.subTitle.text = restaurant.att_description
            cell.cellImage.image = UIImage(named: restaurant.att_cellImage)
        }
        //Return the loaded cell
        return cell
    }
    
    /*
     This function will send the data from the current view to the detail view
     In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // First identify the DetailViewController as the destination view controller
        if (segue.identifier == "DetailView") {
            let destVC = segue.destination as! DetailViewController
            
            if(searchType == "Attractions")
            {
                // Prepare to send image, type, name, subName, description, phonenumber, website and other details
                // DetailViewController
                if let indexpath = self.tableView.indexPathForSelectedRow {
                    
                    //Retrieving data from the foundersObject
                    let attraction: Attraction = attractionsObject[indexpath.row]
                    
                    //Sending the data to detail view
                    destVC.tvType = "Attractions"
                    destVC.tvName = attraction.att_name
                    destVC.tvSubName = attraction.att_subName
                    destVC.tvDescription = attraction.att_description
                    destVC.tvHours = attraction.att_timing
                    destVC.tvAddress = attraction.att_address
                    destVC.tvFare = attraction.att_fare
                    destVC.tvPhoneNumber = attraction.att_phone
                    destVC.tvLatitude = attraction.att_latitude
                    destVC.tvLongitude = attraction.att_longitude
                    destVC.tvImage = attraction.att_image
                    destVC.tvWebsite = attraction.att_website
                    
                } // end if
            }
            
            if(searchType == "Hotels")
            {
                // Prepare to send image, type, name, subName, class, phonenumber, website and other details
                // DetailViewController
                if let indexpath = self.tableView.indexPathForSelectedRow
                {
                    let hotel: Hotel = hotelsObject[indexpath.row]
                    
                    //Pass the data onto the destination controller
                    destVC.tvType = "Hotels"
                    destVC.tvName = hotel.att_name
                    destVC.tvSubName = hotel.att_subName
                    destVC.tvClass = hotel.att_class
                    destVC.tvRating = hotel.att_rating
                    destVC.tvAddress = hotel.att_address
                    destVC.tvPhoneNumber = hotel.att_phone
                    destVC.tvWebsite = hotel.att_website
                    destVC.tvAdvantages = hotel.att_advantage
                    destVC.tvLatitude = hotel.att_latitude
                    destVC.tvLongitude = hotel.att_longitude
                    destVC.tvImage = hotel.att_image
                }
            }
            
            if(searchType == "Restaurants")
            {
                // Prepare to send image, type, name, subName, description, phonenumber, website and other details
                // DetailViewController
                if let indexpath = self.tableView.indexPathForSelectedRow
                {
                    let restaurant: Restaurant = restaurantsObject[indexpath.row]
                    
                    //Pass the data onto the destination controller
                    destVC.tvType = "Restaurants"
                    destVC.tvName = restaurant.att_name
                    destVC.tvSubName = restaurant.att_subName
                    destVC.tvDescription = restaurant.att_description
                    destVC.tvRating = restaurant.att_rating
                    destVC.tvAddress = restaurant.att_address
                    destVC.tvPhoneNumber = restaurant.att_phone
                    destVC.tvHours = restaurant.att_hours
                    destVC.tvWebsite = restaurant.att_website
                    destVC.tvLatitude = restaurant.att_latitude
                    destVC.tvLongitude = restaurant.att_longitude
                    destVC.tvImage = restaurant.att_image
                }
            }
        } // end if
    } // end function
}
