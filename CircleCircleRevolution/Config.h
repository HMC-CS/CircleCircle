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

#define smallCircleButtonWidth 120
#define smallCircleButtonHeight smallCircleButtonWidth
#define circleButtonY 25

#define topRectButtonNormal [UIImage imageNamed:@"button_top.png"]
#define topRectButtonPressed [UIImage imageNamed:@"button_top_pressed.png"]
#define midRectButtonNormal [UIImage imageNamed:@"button_middle_neutral.png"]
#define midRectButtonPressed [UIImage imageNamed:@"button_middle_pressed.png"]
#define bottomRectButtonNormal [UIImage imageNamed:@"button_bottom_neutral.png"]
#define bottomRectButtonPressed [UIImage imageNamed:@"button_bottom_pressed.png"]

#define smallCircleButtonNormal [UIImage imageNamed:@"button_round_s_neutral.png"]
#define smallCircleButtonPressed [UIImage imageNamed:@"button_round_s_pressed.png"]

#define highlight3 [UIImage imageNamed:@"button_border_3.png"]
#define highlight4 [UIImage imageNamed:@"button_border_4.png"]

// Gameplay Constants
#define feedbackFillingTime 1
#define resetWaitTime 2






// Button Titles
#define toMainMenu @"Menu"
#define toSelectionScreen @"Game"
#define toSingleGame @"Single"
#define toDoubleGame @"Double"
#define toHighScores @"Score"
#define toInstructions @"Instructions"
#define toCredits @"Credits"
#define showPauseMenu @"Pause"

#define hardMode @"Hard"
#define mediumMode @"Medium"
#define easyMode @"Easy"

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
