//
//  SingleGameViewController.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingleGameView.h"
#import "ShipView.h"
#import "CircleView.h"
#import "FractionView.h"
#import "GameScoreView.h"
#import "LifeView.h"
#import "ShipModel.h"
#import "FractionModel.h"
#import "GameModel.h"
#import "DifficultySelectionView.h"

@class SingleGameViewController;

@protocol ChangeScreenFromGame1 <NSObject>
-(void) goToScreenFromGame1:(NSString*) screen;

@end

@interface SingleGameViewController : UIViewController <ButtonOnGame1Pressed,ButtonOnDifficultySelectionPressed>
{
    int gameMode;
    float percentChange;
    float circlePercent1;
    float circlePercent2;
    BOOL update1;
    BOOL touch1;
    BOOL update2;
    BOOL touch2;
    NSArray* currentFraction1;
    NSArray* currentFraction2;
    NSString* feedbackTerm1;
    NSString* feedbackTerm2;
    NSTimer* timer1;
    NSTimer* timer2;
    ShipModel* shipModel;
    FractionModel* fractionModel;
    GameModel* gameModel;
    DifficultySelectionView* difficultySelectionView;
    
}

-(id)initWithMode:(int)mode;

@property (weak,nonatomic) id<ChangeScreenFromGame1> screenDelegate;

@end