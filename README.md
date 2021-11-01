# HydrationiOS
water bottle app for iPhone

![Screen Shot 2021-10-31 at 9 18 03 PM](https://user-images.githubusercontent.com/77217507/139609000-b77422e7-bdbd-41c3-adea-f16abd84a7d9.png)

Download the folder labeled Hydration and run the simulator with iPhone 8.

Sippy Cup - Hydration Reminder App - 1.0.0

Developed by Dustin Fang
App Description:
	Exclusively for the new iPhone 8, Sippy Cup is an app that reminds you to sip water every hour and tracks how much water you have left in your water bottle. It displays a water bottle that can be tapped to represent sips that are taken during the day, visually representing the amount of water your water bottle to help you stay hydrated throughout the day. If you ever fill your water bottle up or accidentally dump some out, manually set the amount of water yourself. Set the total amount of water in your water bottle to better track how much water you have left to drink.
TBA: Notifications to sip will be added in future versions. The total amount of water can also be set through a keypad view in future version.

User Manual:
Opening the app displays a water bottle that can be tapped to lower the water level and update the amount of water remaining in the bottle. 
Tapping “Adjust water level” segues to a new view where the user can set the water level to the desired level.
Adjust the water level using the slider at the bottom of the screen and tap the water bottle to confirm the selection, returning to the water level tracker 
TBA in 1.2
Set the volume of the user’s water bottle by tapping “Adjust total water” while adjusting the current water level. Enter a number through the keypad and confirm selections.

Development: Outlets, Actions and Segues, and Corresponding descriptions
Initial View of Cup - cupViewController
Outlets
    “waterBox” a moving UIView of blue that will display the amount of water left in the cup. Is 500px by height. 
    “waterBottleButton” the button displaying the image of the bottle
    “bottomBox” covers the bottom of the screen to hide the moving water block
    “tapToSipLabel” shows text telling the user to tap to cause to water level to fall
    “waterRemainingLabel” displays the amount of water left to be consumed
    “fullBottleSizeLabel” displays the volume of the bottle when full
    Actions
    “adjustWaterLevelPressed” segues to the waterLevelViewController
    “waterBottleButtonPressed” updates the water remaining label and moves the water box downward
    Segues
    “goToWaterLevelViewController”: cupViewController -> waterLevelViewController

Set Water Level View - waterLevelViewController
Outlets
    “waterBox” a moving UIView of blue that will display the amount of water left in the cup. Is 500px by height. 
    “waterBottleButton” the button displaying the image of the bottle
    “bottomBox” covers the bottom of the screen to hide the moving water block
    “adjustTotalWaterButton” navigates to the totalWaterViewController
    “waterLevelSlider” changes the water level in the bottle
    “backToBottleViewControllerButton” navigates to the cupViewController
    “tapToConfirmLabel” displays text prompting the user to tap when finished
    “slideToAdjustLabel” displays text telling the user how to adjust the water
Actions
    “backToBottleViewControllerButtonPressed” segues from waterLevelViewController to cupViewController
    “waterLevelSliderUsed”
    “waterBottleButtonPressed” confirms user’s set water level and segues back to cupViewController
To Be Implemented in Version 1.1
    “adjustTotalWaterButtonPressed” segues from waterLevelViewController to totalWaterViewController
    Segues
    “goToCupViewController”: waterLevelViewController -> cupViewController
To Be Implemented in Version 1.2
“goToTotalWaterViewController”: waterLevelViewController -> totalWaterViewController

To Be Implemented in Version 1.3
Set Total Water View - totalWaterViewController

Notes on the Water Box and the Bottle
The bottle is approximately 500 pixels in length
Default volume of 1000mL. 
Default values: 1 pixel in height : 2mL of water, since a sip is 30mL, its 15 pixels in movement per tap
Pixel change per 30mL tap = 30mL / (totalVolume of Bottle /500mL) = 15px per tap


