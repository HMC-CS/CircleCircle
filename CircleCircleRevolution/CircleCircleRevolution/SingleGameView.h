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
    ShipView* shipView;
    GameScoreView* gameScoreView;
}

-(void)addCircle:(CircleView*)circleView;
-(void)updateFraction:(NSArray*)currentFraction;
-(void)updateCircle:(float)percent;
-(void)setFeedback:(float)feedbackPercent;
-(void)updateScore:(int)score;

@property (weak,nonatomic)id<ButtonOnGame1Pressed> pressedDelegate;

@end
