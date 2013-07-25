CircleCircle
============

Circle Circle Revolution Summer

This is the revamping of Circle Circle Revloution, originally completed in CS  121, Spring 2013.

Original Game Concept: Sean Campbell, Greg Kronmiller, Justin Lim, and Maruhan Park

Summer Code and Design: Kathryn Aplin, Haley Erickson, Paige Garratt, Azubuike Ndefo-Dahl,
    Carson Ramsden, Kanak Singh and Jean Sung

Primary Students working on this project: Kathryn Aplin and Azubuike Ndefo-Dahl

See credits.txt for additional credits and resources.

This app was submitted to Apple for approval on July 15, 2013. It was approved and released on the App Store on July 22, 2013.
It can be found on the app store at https://itunes.apple.com/us/app/ccr/id674228102

Improvements from original CCR:
This application does not use Cocos2d. This allows us to easily use ARC, and makes use of built in Apple frameworks
in the code. Primarily we use UIKit for navigation and user interaction, though some particle effects are achieved
using the CoreAnimationFramework.


Known Issues: 
There is some problem with the memory management of the application. 
Though it does not identify as an explicit memory leak, and althrough ARC is enabled, 
allocations increase without bound as more and more games are started.
After approximately 30 games are begun, the device (iPad) receives a low memory warning and the application quits.
It is unclear what exactly is being held onto in memory at this point in time. Future work would track down this
implicit leak or retain cycle and repair it for an update to the application.
