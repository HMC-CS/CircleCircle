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
    float circlePercent;
    float percentChange;
    BOOL update;
    BOOL touch;
    NSArray* currentFraction;
    NSTimer* timer;
    NSString* feedbackTerm;
    ShipModel* shipModel;
    FractionModel* fractionModel;
    GameModel* gameModel;
    DifficultySelectionView* difficultySelectionView;
}

-(void)startTimer;
-(void)checkUpdate;
-(void)updateCircle;
-(void)scoreTap;
-(void)tapFeedback:(int)accuracy;
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event;

@property (weak,nonatomic) id<ChangeScreenFromGame1> screenDelegate;

@end