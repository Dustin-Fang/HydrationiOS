//
//  waterLevelViewController.swift
//  Hydration
//
//  Created by Dustin Fang on 1/9/20.
//  Copyright © 2020 Dustin Fang. All rights reserved.
//

import UIKit

class waterLevelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var waterDrankWaterLevel : Int = 0
    
    //Represents the png image of the water bottle with alpha channels, is a button
    @IBOutlet weak var waterBottleButton: UIButton!
    
    //label for "Tap to Confirm!"
    @IBOutlet weak var tapToConfirmLabel: UILabel!
    
    //label for "Slide to Adjust!"
    @IBOutlet weak var slideToAdjustLabel: UILabel!
    
    //outlet for the back button to cupViewController
    @IBOutlet weak var backToBottleViewControllerButton : UIButton!
    
    //outlet for the adjustTotalWaterButton
    @IBOutlet weak var adjustTotalWaterButton: UIButton!
    
    //outlet for the water level slider
    @IBOutlet weak var waterLevelSlider: UISlider!
    
    //represents the blue box of water that is moved and symbolizes the amount of water in the bottle
    @IBOutlet weak var waterBox: UIView!
    
    //outlet for the bottom box covering waterBox
    @IBOutlet weak var bottomBox: UIView!
    
    //navigates from waterLevelViewController to cupViewController
    @IBAction func backToBottleViewControllerButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToCupViewController", sender: self)
    }

    //moves the water box and changes the water drank variable
    @IBAction func waterLevelSliderUsed(_ sender: Any) {
        animateWater()
    }
    
    //confirms the water level set and returns to cupViewController
    @IBAction func waterBottleButtonPressed(_ sender: Any) {
        //slider is a value from 0 - 100
        //the water level is in mL
        let setWaterLevel = waterLevelSlider.value * Float(totalWater) //mL
        print("new value of waterLevel: \(setWaterLevel)")
        
        //sets waterDrankWaterLevel to the appropriate amount
        waterDrankWaterLevel = totalWater - Int(setWaterLevel)
        
        print("new value of waterDrankWaterLevel: \(waterDrankWaterLevel)")
        
        performSegue(withIdentifier: "goToCupViewController", sender: self)
    }
    
    //sends data to cupViewController with the new waterDrankWaterLevel
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is cupViewController
        {
            let vc = segue.destination as? cupViewController
            
            //sets the waterDrankCup to the waterLevel
            vc?.waterDrankCup = waterDrankWaterLevel
            
            //tells the viewController to update the userDefault again before setting the waterDrankCup to the user default
            vc?.setUserDefaults()
        }
    }
    
    //moves the water based on the slider
    func animateWater()
    {
        //waterLevel in Pixels
        let changeInWaterPX = 500 - waterLevelSlider.value * 500
        //set WaterBox y position to waterLevel
        waterBox.frame.origin.y = CGFloat(changeInWaterPX) + 95//px adjusts for Float value's offset so it matches the bottle's position
    }
    
    /* To be implemented in ver 2.0
     //navigates from waterLevelViewController to totalWaterViewController
     @IBAction func adjustTotalWaterButtonPressed(_ sender: Any) {
     performSegue(withIdentifier: "goToTotalWaterViewController", sender: self)
     }
     */
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
