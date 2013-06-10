//
//  ViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "CreditsViewController.h"
#import "GameViewController.h"
#import "ScoreViewController.h"
#import "InstructionsViewController.h"


@interface ViewController : UINavigationController <ChangeScreenFromMenu, ChangeScreenFromGame, ChangeScreenFromCredits, ChangeScreenFromScore, ChangeScreenFromInstructions>
{
    MenuViewController* menuViewController;
    GameViewController* gameViewController;
    ScoreViewController* scoreViewController;
    CreditsViewController* creditsViewController;
    InstructionsViewController* instructionsViewController;
}
@end
