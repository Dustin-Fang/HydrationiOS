//
//  ViewController.swift
//  Hydration
//
//  Created by Dustin Fang on 1/9/20.
//  Copyright © 2020 Dustin Fang. All rights reserved.
//

//global variable that stores the total amount of water in the bottle
var totalWater = 1000 //mL

import UIKit

class cupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set the waterDrank to the stored default
        waterDrankCup = defaults.integer(forKey: "waterDrank")
        setupDiplay()
    }
    
    //setups up the userDefault
    var defaults = UserDefaults.standard
    
    //setup waterDrankCup to 0, which will be changed to the userDefault
    var waterDrankCup = 0
    
    //calculates and determines the number of pixels to properly represent a sip
    var pixelShift = 30/(totalWater / 500)
    
    //label for the full water bottle's volume
    @IBOutlet weak var fullBottleSizeLabel: UILabel!
    
    //label for tap to Sip!
    @IBOutlet weak var tapToSipLabel: UILabel!
    
    //Editable label to display amount of water remaining
    @IBOutlet weak var waterRemainingLabel: UILabel!
    
    //water bottle button
    @IBOutlet weak var waterBottleButton: UIButton!
    
    //the box representing water
    @IBOutlet weak var waterBox: UIView!
    
    //box that covers the water at the bottom
    @IBOutlet weak var bottomBlock: UIView!
    
    //adjust water level button
    @IBOutlet weak var adjustWaterLevelButton: UIButton!
    
    //navigates to waterLevelViewController from cupViewController
    @IBAction func adjustWaterLevelPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToWaterLevelViewController", sender: self)
    }
    
    //sends data to waterLevelViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is waterLevelViewController
        {
            let vc = segue.destination as? waterLevelViewController
            vc?.waterDrankWaterLevel = waterDrankCup
        }
    }
    
    //updates the water remaining label and
    @IBAction func waterBottleButtonPressed(_ sender: Any) {
        //only moves the box if there is water to drink
        if(waterDrankCup > totalWater)
        {
            return
        }
        //parameters of the waterBox adjusted for a pixelShift in the y direction
        print("water drank!")
        //obtains positional data and mutates it
        let yPosition = waterBox.frame.origin.y + CGFloat(pixelShift)
        //moves the waterBox down pixelShift (calculated from total water)
        waterBox.frame.origin.y = yPosition
        
        print("New Pos: \(waterBox.frame.origin.y)") //debug
        
        //adds water to water drank for water remaining calculation
        waterDrankCup += 30
        updateWaterRemaining()
        //updates the userDefaults
        setUserDefaults()
    }
    
    //setups the water remaining and full bottle size labels, can
    func setupDiplay()
    {
        //creates a string with total water to add to the fullBottleSizeLabel
        let bottleSizeString = " \(totalWater) mL"
        fullBottleSizeLabel.text = fullBottleSizeLabel.text! + bottleSizeString
        
        setUserDefaults()
        
        //puts the waterBox in the proper place based on waterDrankCup
        placeWaterBox()
        //updates the water remaining label as well
        updateWaterRemaining()
    }
    
    //updates the waterRemaining Label
    func updateWaterRemaining()
    {
        //creates a string with waterDrankCup to add to the waterRemainingLabel
        let waterToDisplay = totalWater - waterDrankCup
        //changes the label to no water left if all the water is consumed
        if(waterToDisplay <= 0)
        {
            waterRemainingLabel.text = "No water left to drink!"
            return
        }
        let waterRemainingString = " \(waterToDisplay) mL"
        waterRemainingLabel.text = "Water Remaining:" + waterRemainingString
    }
    
    //moves the water box according to waterDrankCup
    func placeWaterBox()
    {
        waterBox.frame.origin.y = waterBox.frame.origin.y + CGFloat(waterDrankCup/2)
    }
    
    //function set the userDefault to the currentAmount of water in the and then adds the new user default
    func setUserDefaults()
    {
        defaults.set(waterDrankCup, forKey: "waterDrank")
        print("new default set, waterDrankCup = \(defaults.integer(forKey: "waterDrank"))")
        //is put into a function so that it can be called on this ViewController in other View Controllers to update the default in other places
    }
    
    
}

