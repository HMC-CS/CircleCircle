//
//  GameView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShipView.h"
#import "GameScoreView.h"
#import "LifeView.h"

#import <AVFoundation/AVFoundation.h>

@class GameView;

@protocol ButtonOnGame1Pressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;
-(void) gamePause;
-(void) gameResume;
-(void) boost;
-(void) unboost;

@end

@interface GameView : UIView
{
    UIButton* menuButton;
    UIButton* boostButton;
    UIImageView* pauseView;
    UIButton* pauseButton;
    UIButton* resumeButton;
    ShipView* shipView;
    GameScoreView* gameScoreView;
    LifeView* lifeView;
}

-(id)initWithFrame:(CGRect)frame andMode:(int)mode;
-(void)updateFraction1:(NSArray*)currentFraction1 fraction2:(NSArray*)currentFraction2;
-(void)updateCircle1:(float)percent1 circle2:(float)percent2;
-(void)setFeedback1:(float)feedbackPercent1 feedback2:(float)feedbackPercent2;
-(void)updateScore:(int)score;
-(void)updateLife:(int)lives;
-(void) setCircleTarget:(id)sender forAction:(SEL)action whichCircle:(int)circleNumber;
-(void) disablePause;
-(void) enablePause;
-(void) disableBoost;
-(void)showGlowOnCircle:(int)circleNum isCorrect:(BOOL)isRight;
-(void) showFeedback:(NSString*)feedbackTerm onCircleNumber:(int)circleNum;



@property (weak,nonatomic)id<ButtonOnGame1Pressed> pressedDelegate;

@end
