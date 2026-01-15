# SkiinHeat

### iOS App for Skiin Line of Heated Garments & Accessories
***

### Supported devices and OS:
* Any iPhone (prior to iPhone X) running on iOS 13 or later.

### Dependencies:
1. [SkiinBLE](https://github.com/myantandco/SkiinBLE.git)

### Current functionalities:

1. Onboarding: 4 screens that provides instructions on setting up the product. 
  * Welcome screen
  * Activate the battery 
  * Pair the battery
  * Attach the battery to the garment

2. Dashboard: 1 screen that provide an overview of the heated garments.
  * Monitor bluetooth connection status
  * Monitor battery level
  * Turn on/off all heat elements
  * Turn on/off heat elements individually
  * Monitor temperature levels
  * See which heat element is turn on/off on the garment
  * Alternate between different heat settings (low, medium, or high)

### Known bugs:
##### There is a bluetooth connection bug that affect iPhone X, iPhone XR, iPhone XS, and iPhone XS Max.
##### Dark mode isn't supported.
##### The current version of the app differs slightly from the UI design due to bugs:
1. On the onboarding screens, the back button has been replaced by the iOS system back button in the navigation bar.
2. The screen to change the heat settings (low, medium, or high) has been replaced by an action sheet
***

### Run SkiinHeat locally:
##### To run the app on your local machine make sure you have the lastest version of XCode 11 installed then click on the green button above that says "clone or download" and then click on "Open In XCode". It will open Xcode automatically and prompt you to enter your github credentials. Once it's done you'll be able to build and run the app on the simulator or on a physical device. 