//
//  ViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "MenuViewController.h"
#import "CreditsViewController.h"
#import "SelectionViewController.h"
#import "ScoreViewController.h"
#import "InstructionsViewController.h"
#import "GameViewController.h"
#import "DifficultySelectionViewController.h"


@interface ViewController : UINavigationController <ChangeScreenFromMenu, ChangeScreenFromSelect, ChangeScreenFromCredits, ChangeScreenFromScore, ChangeScreenFromInstructions, ChangeScreenFromGame1, BeginGameFromDifficulySelection>
{
    MenuViewController* menuViewController;
    SelectionViewController* selectionViewController;
    ScoreViewController* scoreViewController;
    CreditsViewController* creditsViewController;
    InstructionsViewController* instructionsViewController;
    GameViewController* gameViewController;
    DifficultySelectionViewController* difficultySelectionViewController;
    AVAudioPlayer* bgMusicPlayer;
    AVAudioPlayer* buttonSFX;
}
@end
