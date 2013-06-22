//
//  GameViewController.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameView.h"
#import "ShipView.h"
#import "CircleView.h"
#import "FractionView.h"
#import "GameScoreView.h"
#import "LifeView.h"
#import "ShipModel.h"
#import "FractionModel.h"
#import "GameModel.h"
#import "DifficultySelectionView.h"
#import <AVFoundation/AVFoundation.h>

@class GameViewController;

@protocol ChangeScreenFromGame1 <NSObject>
-(void) goToScreenFromGame1:(NSString*) screen;

@end

@interface GameViewController : UIViewController <ButtonOnGame1Pressed>
{
    int gameMode;
    int gameDifficulty;
    int resetCircle1Count;
    int resetCircle2Count;
    
    int circle1FeedbackCount;
    int circle2FeedbackCount;
    
    float percentChange;
    float circlePercent1;
    float circlePercent2;
    float backgroundMoveAmount;
    
    float circle1Feedback;
    float circle1FeedbackChange;
    
    float circle2Feedback;
    float circle2FeedbackChange;
    
    BOOL update1;
    BOOL touch1;
    BOOL update2;
    BOOL touch2;
    BOOL gameOver;
    BOOL isBoosted;
    BOOL isPaused;
    NSArray* currentFraction1;
    NSArray* currentFraction2;
    NSString* feedbackTerm1;
    NSString* feedbackTerm2;
    NSTimer* timer1;
    ShipModel* shipModel;
    FractionModel* fractionModel;
    GameModel* gameModel;
    GameView* gameView;
    NSMutableArray* farBackgroundImages;
    NSMutableArray* nearBackgroundImages;
    UIImageView* bg1Far;
    UIImageView* bg2Far;
    UIImageView* bg1Near;
    UIImageView* bg2Near;
    
    AVAudioPlayer *buttonSFX;
    AVAudioPlayer *correctSFX;
    AVAudioPlayer *wrongSFX;
    AVAudioPlayer *boostSFX;
    AVAudioPlayer *fasterSFX;
    AVAudioPlayer *gameOverSound;
}

-(id)initWithMode:(int)mode andDifficulty:(int)difficulty;

@property (weak,nonatomic) id<ChangeScreenFromGame1> screenDelegate;

@end