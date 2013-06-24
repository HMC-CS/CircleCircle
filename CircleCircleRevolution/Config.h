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
#define fontRectButtons [UIFont fontWithName:@"Krungthep" size:30.0]
#define fontSmallRoundButtons [UIFont fontWithName:@"Krungthep" size:25.0]
#define fontLargeRoundButtons [UIFont fontWithName:@"Krungthep" size:40.0]
#define fontInstructions [UIFont fontWithName:@"Krungthep" size:30.0]
#define fontCredits [UIFont fontWithName:@"Krungthep" size:20.0]
#define fontHighScores [UIFont fontWithName:@"Krungthep" size:20.0]
#define fontScoreLabel [UIFont fontWithName:@"Krungthep" size:30.0]
#define fontFractionLabel [UIFont fontWithName:@"Krungthep" size:50.0]
#define fontTitles [UIFont fontWithName:@"Krungthep" size:50.0];
#define kScreenWidth [UIScreen mainScreen].bounds.size.height
#define kScreenHeight [UIScreen mainScreen].bounds.size.width

// Buttons
#define rectButtonWidth topRectButtonNormal.size.width
#define rectTopButtonHeight 70
#define rectMiddleButtonHeight 60
#define rectBottomButtonHeight 64
#define smallCircleButtonSize 120
#define largeCircleButtonSize 178

// Main Menu (currently all menues use these - subject to change)
#define topButtonY 400
#define secondButtonY (topButtonY + rectTopButtonHeight)
#define thirdButtonY (secondButtonY + rectMiddleButtonHeight)
#define bottomButtonY (thirdButtonY + rectMiddleButtonHeight)
#define circleButtonY 50
#define circleButtonX 50

// Gameplay Constants
#define gameFPS 60
#define feedbackFillingTime 1
#define resetWaitTime 2
#define feedbackFrames gameFPS*feedbackFillingTime
#define resetFrames gameFPS*resetWaitTime
#define boostPercent 1
#define boostBackground 3

#define startingPercentChange 0.1
#define startingBackgroundChange 1.0
#define numProblemCorrectForIncrease 3
#define maximumPercentChange 0.8
#define percentChangeIncrease 0.1
#define backgroundChangeIncrease 2


#define nearFarParallaxRatio 2

#define awesomeScore 100
#define goodScore 50
#define okayScore 25

#define awesomeAccuracy 2
#define goodAccuracy 5
#define okayAccuracy 8

// Audio
#define bgMusicPath [[NSBundle mainBundle] pathForResource:@"through space" ofType:@"mp3"]
#define bgMusicURL [NSURL fileURLWithPath:bgMusicPath]
#define buttonSFXPath [[NSBundle mainBundle] pathForResource:@"flopp med underleppa (flanger9)" ofType:@"wav"]
#define buttonSFXURL [NSURL fileURLWithPath:buttonSFXPath]
#define correctSFXPath [[NSBundle mainBundle] pathForResource:@"zapThreeToneUp" ofType:@"mp3"]
#define correctSFXURL [NSURL fileURLWithPath:correctSFXPath]
#define wrongSFXPath [[NSBundle mainBundle] pathForResource:@"zapThreeToneDown" ofType:@"mp3"]
#define wrongSFXURL [NSURL fileURLWithPath:wrongSFXPath]
#define fasterSFXPath [[NSBundle mainBundle] pathForResource:@"threetone12" ofType:@"mp3"]
#define fasterSFXURL [NSURL fileURLWithPath:fasterSFXPath]
#define boostSFXPath [[NSBundle mainBundle] pathForResource:@"171106__qubodup__rocket-flight-loop" ofType:@"mp3"]
#define boostSFXURL [NSURL fileURLWithPath:boostSFXPath]
#define gameOverSoundPath [[NSBundle mainBundle] pathForResource:@"43698__notchfilter__game-over03" ofType:@"wav"]
#define gameOverSoundURL [NSURL fileURLWithPath:gameOverSoundPath]

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
#define pauseGame @"Pause"
#define resumeGame @"Resume"
#define speedBoost @"Boost"

// Game Screen Formatting
#define gameBoostY 500
#define gamePauseY 50
#define gameLeftButtonX 50
#define pauseScreenXOffset 87
#define pauseScreenYOffset 75
#define sgShipXOffset 177
#define dgShipXOffset 107
#define sgShipYOffset 100
#define dgShipYOffset 160
#define shipWidth 850
#define shipHeight 500
#define gameScoreX 700
#define gameScoreY -25
#define gameScoreWidth 310
#define gameScoreHeight 140
#define lifeXOffset 850
#define lifeYOffset 450
#define lifeWidth 120
#define lifeHeight 250

#define sgCircleX 174
#define sgCircleY 67
#define sgCircleSize 320
#define sgFractionX 223
#define sgFractionY 398
#define sgFractionWidth 220
#define sgFractionHeight 194

#define dgCircle1X 136
#define dgCircle1Y 44
#define dgCircle2X 518
#define dgCircle2Y 44
#define dgCircleSize 249
#define dgFraction1X 224
#define dgFraction1Y 284
#define dgFraction2X 481
#define dgFraction2Y 280
#define dgFractionWidth 170
#define dgFractionHeight 220

// Circles
#define circleBGColor [UIColor colorWithRed:0 green:128.0/255 blue:128.0/255 alpha:1]
#define circleFillColor [UIColor colorWithRed:95.0/255 green:211.0/255 blue:95.0/255 alpha:1]
#define circleFeedbackColor [UIColor colorWithRed:200.0/255 green:55.0/255 blue:55.0/255 alpha:1]

// Images
#define pauseScreenImage [UIImage imageNamed:@"pause.png"]
#define singleShipImage [UIImage imageNamed:@"ship_body_single.png"]
#define doubleShipImage [UIImage imageNamed:@"ship_body_double.png"]
#define scoreImage [UIImage imageNamed:@"score_tab.png"]

#define bottomLifeFilled [UIImage imageNamed:@"life_bottom_filled.png"]
#define bottomLifeEmpty [UIImage imageNamed:@"life_bottom_emptypng"]
#define middleLifeFilled [UIImage imageNamed:@"life_middle_filled.png"]
#define middleLifeEmpty [UIImage imageNamed:@"life_middle_empty.png"]
#define topLifeFilled [UIImage imageNamed:@"life_top_filled.png"]
#define topLifeEmpty [UIImage imageNamed:@"life_top_empty.png"]
#define lifeBorderImage [UIImage imageNamed:@"life_border.png"]

#define topRectButtonNormal [UIImage imageNamed:@"button_top.png"]
#define topRectButtonPressed [UIImage imageNamed:@"button_top_pressed.png"]
#define midRectButtonNormal [UIImage imageNamed:@"button_middle_neutral.png"]
#define midRectButtonPressed [UIImage imageNamed:@"button_middle_pressed.png"]
#define bottomRectButtonNormal [UIImage imageNamed:@"button_bottom_neutral.png"]
#define bottomRectButtonPressed [UIImage imageNamed:@"button_bottom_pressed.png"]

#define smallCircleButtonNormal [UIImage imageNamed:@"button_round_s_neutral.png"]
#define smallCircleButtonPressed [UIImage imageNamed:@"button_round_s_pressed.png"]
#define largeCircleButtonNormal [UIImage imageNamed:@"button_round_l_neutral.png"]
#define largeCircleButtonPressed [UIImage imageNamed:@"button_round_l_pressed.png"]

#define highlight2 [UIImage imageNamed:@"button_border_2.png"]
#define highlight3 [UIImage imageNamed:@"button_border_3.png"]
#define highlight4 [UIImage imageNamed:@"button_border_4.png"]

#define sgFractionImageName @"ship_fraction_single.png"
#define dgFraction1ImageName @"ship_fraction_double_1.png"
#define dgFraction2ImageName @"ship_fraction_double_2.png"

#endif
