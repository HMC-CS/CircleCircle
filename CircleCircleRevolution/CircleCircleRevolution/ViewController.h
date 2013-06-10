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
#import "SelectionViewController.h"
#import "ScoreViewController.h"
#import "InstructionsViewController.h"
#import "SingleGameViewController.h"
#import "DoubleGameViewController.h"


@interface ViewController : UINavigationController <ChangeScreenFromMenu, ChangeScreenFromSelect, ChangeScreenFromCredits, ChangeScreenFromScore, ChangeScreenFromInstructions, ChangeScreenFromGame1, ChangeScreenFromGame2>
{
    MenuViewController* menuViewController;
    SelectionViewController* selectionViewController;
    ScoreViewController* scoreViewController;
    CreditsViewController* creditsViewController;
    InstructionsViewController* instructionsViewController;
    SingleGameViewController* singleGameViewController;
    DoubleGameViewController* doubleGameViewController;
}
@end
