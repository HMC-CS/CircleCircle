//
//  SingleGameView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShipView.h"
#import "GameScoreView.h"
#import "LifeView.h"

@class SingleGameView;

@protocol ButtonOnGame1Pressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;
-(void) gamePause;
-(void) gameResume;

@end

@interface SingleGameView : UIView
{
    UIButton* menuButton;
    UIView* pauseView;
    UIButton* pauseButton;
    UIButton* resumeButton;
    ShipView* _shipView;
    GameScoreView* gameScoreView;
    LifeView* lifeView;
}

-(id)initWithFrame:(CGRect)frame andMode:(int)mode;
-(void)updateFraction1:(NSArray*)currentFraction1 fraction2:(NSArray*)currentFraction2;
-(void)updateCircle1:(float)percent1 circle2:(float)percent2;
-(void)setFeedback1:(float)feedbackPercent1 feedback2:(float)feedbackPercent2;
-(void)updateScore:(int)score;
-(void)updateLife:(int)lives;


@property (weak,nonatomic)id<ButtonOnGame1Pressed> pressedDelegate;

@property (strong, nonatomic) ShipView* shipView;

@end
