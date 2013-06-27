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
    // Game information
    int gameMode;
    int gameDifficulty;
    
    // Counts for timers to reset circle and display feedback smoothly
    int resetCircle1Count;
    int resetCircle2Count;
    int circle1FeedbackCount;
    int circle2FeedbackCount;
    
    // How much to move background and increase circle each fire of the timer
    float percentChange;
    float backgroundMoveAmount;
    
    // Current values filled in circles
    float circlePercent1;
    float circlePercent2;
    
    // For displaying correct fraction smoothly
    float circle1Feedback;
    float circle1FeedbackChange;
    float circle2Feedback;
    float circle2FeedbackChange;
    
    // Whether to increase the circle this timer fire
    BOOL update1;
    BOOL update2;
    
    // Whether a circle has already been touched and is therefore displaying feedback
    BOOL touch1;
    BOOL touch2;
    
    // Game states
    BOOL gameOver;
    BOOL isBoosted;
    BOOL isPaused;
    
    // A circle's correct fraction
    NSArray* currentFraction1;
    NSArray* currentFraction2;
    
    // Game timer - updates
    NSTimer* timer1;
    
    // Models
    ShipModel* shipModel;
    FractionModel* fractionModel;
    GameModel* gameModel;
    
    // Views
    GameView* gameView;
    UIImageView* bg1Far;
    UIImageView* bg2Far;
    UIImageView* bg1Near;
    UIImageView* bg2Near;
    
    // Sound Effects
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