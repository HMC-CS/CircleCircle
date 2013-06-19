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

// Menu Buttons
#define rectButtonWidth 252
#define rectTopButtonHeight 70
#define rectMiddleButtonHeight 60
#define rectBottomButtonHeight 64

#define topButtonY (400)
#define secondButtonY (topButtonY + rectTopButtonHeight)
#define thirdButtonY (secondButtonY + rectMiddleButtonHeight)
#define bottomButtonY (thirdButtonY + rectMiddleButtonHeight)

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

// Single Circle Game Formatting - sg


// Double Circle Game Formatting - dg


// Credits Screen Formatting - cs

#define csFontSize
#define csFontPositionX
#define csFontPositionY

// Instrucitons Screen Formatting - is

#define isFontSize
#define isFontPositionX
#define isFontPositionY


// High Scores Screen Formatting - hs

#define hsFontSize
#define hsFontPositionX
#define hsFontPositionY

// Circles




// Resource File Titles - replace when we have them



#endif
