//
//  Config.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//


// reusability - 123 setup for buttons

#ifndef CircleCircleRevolution_Config_h
#define CircleCircleRevolution_Config_h

// Overall
#define kgameFont
#define kScreenWidth [UIScreen mainScreen].bounds.size.height
#define kScreenHeight [UIScreen mainScreen].bounds.size.width

// 3 Button system
#define button1X 50
#define button1Y 30
#define button2X 150
#define button2Y 30
#define button3X 250
#define button3Y 30
#define buttonWidth 50
#define buttonHeight 30

// Gameplay Constants


// Button Titles
#define toMainMenu @"Menu"
#define toSelectionScreen @"Game"
#define toSingleGame @"Single"
#define toDoubleGame @"Double"
#define toHighScores @"Score"
#define toInstructions @"Instructions"
#define toCredits @"Credits"
#define showPauseMenu @"Pause"

// Main Menu Formatting - mm
#define mmSelectionButtonX 50
#define mmSelectionButtonY 30
#define mmCreditsButtonX 150
#define mmCreditsButtonY 30
#define mmInstructionsButtonX 250
#define mmInstructionsButtonY 30
#define mmScoreButtonX 350
#define mmScoreButtonY 30


// Selection Screen Formatting - ss
#define ssMainMenuButtonX button3X
#define ssMainMenuButtonY button3Y
#define ssSingleGameButtonX button1X
#define ssSingleGameButtonY button1Y
#define ssDoubleGameButtonX button2X
#define ssDoubleGameButtonY button2Y



// Single Circle Game Formatting - sg
#define sgPauseButtonX
#define sgPauseButtonY
#define sgShipX
#define sgShipY
#define sgCircleX
#define sgCircleY
#define sgFractionX
#define sgFractionY
#define sgLifeMeterX
#define sgLifeMeterY

// Double Circle Game Formatting - dg
#define dgPauseButtonX
#define dgPauseButtonY
#define dgShipX
#define dgShipY
#define dgCircle1X
#define dgCircle1Y
#define dgCircle2X
#define dgCircle2Y
#define dgFractionX
#define dgFractionY
#define dgLifeMeterX
#define dgLifeMeterY

// Credits Screen Formatting - cs
#define csMainMenuButtonX 50
#define csMainMenuButtonY 30
#define csFontSize
#define csFontPositionX
#define csFontPositionY

// Instrucitons Screen Formatting - is
#define isMainMenuButtonX 50
#define isMainMenuButtonY 30
#define isFontSize
#define isFontPositionX
#define isFontPositionY


// High Scores Screen Formatting - hs
#define hsMainMenuButtonX 50
#define hsMainMenuButtonY 30
#define hsFontSize
#define hsFontPositionX
#define hsFontPositionY


// Mode Selection Screen Formatting - ms
#define msMainMenuButtonX button1X
#define msMainMenuButtonY button1Y
#define msSingleButtonX button2X
#define msSingleButtonY button2Y
#define msDoubleButtonX button3X
#define msDoubleButtonY button3Y

// Difficulty Selection Screen Formatting - ds
#define dsEasyButtonX button1X
#define dsEasyButtonY button1Y
#define dsMediumButtonX button2X
#define dsMediumButtonY button2Y
#define dsHardButtonX button3X
#define dsHardButtonY button3Y

// Circles




// Resource File Titles - replace when we have them



#endif
