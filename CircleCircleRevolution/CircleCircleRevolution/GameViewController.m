//
//  GameViewController.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "GameViewController.h"
#import "Config.h"

@interface GameViewController ()

@end

@implementation GameViewController

-(id)initWithMode:(int)mode andDifficulty:(int)difficulty
{
    self = [super init];
    if (self)
    {
        isPaused = FALSE;
        gameDifficulty = difficulty;
        pauseDisabledBy2 = FALSE;
        pauseDisabledBy1 = FALSE;
        self.view.backgroundColor = [UIColor blackColor];
        
        // Scrolling background pieces
        bg1Far = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars1_s.png"]];
        bg1Far.center = CGPointMake(bg1Far.image.size.width/2.0, bg1Far.center.y);
        bg1Far.backgroundColor = [UIColor clearColor];
        bg2Far = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars2_s.png"]];
        bg2Far.center = CGPointMake(3.0*bg2Far.image.size.width/2.0, bg2Far.center.y);
        bg2Far.backgroundColor = [UIColor clearColor];

        [self.view addSubview:bg1Far];
        [self.view addSubview:bg2Far];
        
        bg1Near = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars1_l.png"]];
        bg1Near.center = CGPointMake(bg1Near.image.size.width/2.0, bg1Near.center.y);
        bg1Near.backgroundColor = [UIColor clearColor];
        bg2Near = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars2_l.png"]];
        bg2Near.center = CGPointMake(3.0*bg2Near.image.size.width/2.0, bg2Near.center.y);
        bg1Near.backgroundColor = [UIColor clearColor];

        [self.view addSubview:bg1Near];
        [self.view addSubview:bg2Near];
        
        // Game View
        gameView = [[GameView alloc] initWithFrame:CGRectMake(0,0,self.view.bounds.size.height,self.view.bounds.size.width) andMode:mode];
        [gameView setCircleTarget:self forAction:@selector(scoreTap1) whichCircle:1];
        [gameView setCircleTarget:self forAction:@selector(scoreTap2) whichCircle:2];
        gameView.pressedDelegate = self;
        [self.view addSubview:gameView];

        shipModel = [[ShipModel alloc] init];
        fractionModel = [[FractionModel alloc] init];
        gameModel = [[GameModel alloc] init];
        
        gameMode = mode;
        update1 = TRUE;
        touch1 = FALSE;
        touch2 = FALSE;
        percentChange = 0.1;
        backgroundMoveAmount = 1.0;
        
        [self resetCircle:1];
        
        [self startTimer1];
        if (gameMode == 2)
        {
            update2 = TRUE;
            [self resetCircle:2];
            touch2 = FALSE;
        }
        [gameView updateLife:[gameModel getLives]];
        gameOver = FALSE;
        
        isBoosted = FALSE;
        
    }
    return self;
}

-(void)moveLeft
{
    float moveAmount = backgroundMoveAmount;
    if (bg1Far.center.x <= -bg1Far.image.size.width/2.0)
    {
        bg1Far.center = CGPointMake(1.5*bg1Far.image.size.width,bg1Far.center.y);
    }
    if (bg2Far.center.x <= -bg2Far.image.size.width/2.0)
    {
        bg2Far.center = CGPointMake(1.5*bg2Far.image.size.width,bg2Far.center.y);
    }
    bg1Far.center = CGPointMake(bg1Far.center.x - moveAmount, bg1Far.center.y);
    bg2Far.center = CGPointMake(bg2Far.center.x - moveAmount, bg2Far.center.y);
  
    
    if (bg1Near.center.x <= -bg1Near.image.size.width/2.0)
    {
        bg1Near.center = CGPointMake(1.5*bg1Near.image.size.width,bg1Near.center.y);
    }
    if (bg2Near.center.x <= -bg2Near.image.size.width/2.0)
    {
        bg2Near.center = CGPointMake(1.5*bg2Near.image.size.width,bg2Near.center.y);
    }
    bg1Near.center = CGPointMake(bg1Near.center.x - 2*moveAmount, bg1Near.center.y);
    bg2Near.center = CGPointMake(bg2Near.center.x - 2*moveAmount, bg2Near.center.y);

}


// Timers
-(void) startTimer1
{
    if (!gameOver){
    timer1 = [NSTimer scheduledTimerWithTimeInterval:1.0/60
                                             target:self
                                           selector:@selector(allUpdates)
                                           userInfo:nil
                                            repeats:YES];

    }
}



// Resets a circle and its fraction
-(void) resetCircle:(int)circleNumber
{
    if (!gameOver)
    {
        percentChange = [gameModel calculateSpeed]; // check every time you reset a circle
        backgroundMoveAmount = [gameModel getBackgroundChange];
        NSLog(@"percent change is %f and bgmoveamt is %f",percentChange,backgroundMoveAmount);
        if (isBoosted){
            percentChange += 1;
            backgroundMoveAmount *=3;
        }
        if (circleNumber ==1)
        {
            update1 = TRUE;
            touch1 = FALSE;
            circlePercent1 = 0;
            [gameView updateCircle1:circlePercent1 circle2:NO];
            [gameView setFeedback1:0 feedback2:-1];
            currentFraction1 = [fractionModel getFractionGivenDifficulty:gameDifficulty];
            [self updateFraction1:YES andFraction2:NO];
        }
        if (circleNumber == 2)
        {
            update2 = TRUE;
            touch2 = FALSE;
            circlePercent2 = 0;
            [gameView updateCircle1:NO circle2:circlePercent2];
            [gameView setFeedback1:-1 feedback2:0];
            currentFraction2 = [fractionModel getFractionGivenDifficulty:gameDifficulty];
            [self updateFraction1:NO andFraction2:YES];
        }    
        [self updateScore];
    }
}
// A helper method so reset can be called by a selector
-(void) resetCircleFromNum:(NSNumber*)circleNumber
{
    [self resetCircle:[circleNumber integerValue]];
}

// Game Loop Updates
-(void)allUpdates
{
    if (!isPaused){
        [self moveLeft];
        [self checkUpdate1];
        if (gameMode ==2)
            [self checkUpdate2];
    }
}


-(void) checkUpdate1
{
    if (update1)
        [self updateCircle1];
}

-(void) checkUpdate2
{
    if (update2)
        [self updateCircle2];
}

-(void) updateCircle1
{
    if (circlePercent1 < 100)
    {
        circlePercent1 += percentChange;
        [gameView updateCircle1:circlePercent1 circle2:NO];
    }
    else
    {
        [self scoreTap1];
    }
}

-(void) updateCircle2
{
    if (circlePercent2 < 100)
    {
        circlePercent2 += percentChange;
        [gameView updateCircle1:NO circle2:circlePercent2];
    }
    else
    {
        [self scoreTap2];
    }
}

// Refresh the display of score and fraction
-(void) updateFraction1:(BOOL)shouldUpdate1 andFraction2:(BOOL)shouldUpdate2
{
    if (shouldUpdate1)
        [gameView updateFraction1:currentFraction1 fraction2:NO];
    if (shouldUpdate2)
        [gameView updateFraction1:NO fraction2:currentFraction2];
}

-(void) updateScore
{
    int score = [gameModel getScore];
    [gameView updateScore:score];
}

// Scoring and Displaying Feedback
-(void)scoreBlock1
{
    //[timer1 invalidate];
    update1 = FALSE;
    float fracValue = [self calculateFractionValue:currentFraction1];
    int accuracy = [self calculateAccuracyFromPercent:circlePercent1 andTargetFractionValue:fracValue];
    [self tapFeedback:accuracy];
    [self checkGameOver];
    [gameView setFeedback1:fracValue*100 feedback2:-1];
    [self updateScore];
    [gameView updateCircle1:circlePercent1 circle2:NO];
    touch1 = TRUE;
}

-(void)scoreBlock2
{
    update2 = FALSE;
    float fracValue = [self calculateFractionValue:currentFraction2];
    int accuracy = [self calculateAccuracyFromPercent:circlePercent2 andTargetFractionValue:fracValue];
    [self tapFeedback:accuracy];
    [self checkGameOver];
    [gameView setFeedback1:-1 feedback2:fracValue*100];
    [self updateScore];
    [gameView updateCircle1:NO circle2:circlePercent2];
    touch2 = TRUE;
}

-(void) scoreTap1
{
    if (!touch1){
        [self scoreBlock1];        
        [self disablePause];
        pauseDisabledBy1 = TRUE;
        if (gameOver && gameMode == 2){
            [self scoreBlock2];        
        }else if (!gameOver){
            //[self performSelector:@selector(startTimer1) withObject:nil afterDelay:5.0];
            [self performSelector:@selector(resetCircleFromNum:) withObject:[NSNumber numberWithInt:1] afterDelay:5.0];
            if (pauseDisabledBy2){
                // cancel the other enable selector
                [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(enablePause) object:nil];
            }
            [self performSelector:@selector(enablePause) withObject:nil afterDelay:5.0];
        }
    }
}

-(void) scoreTap2
{
    if(!touch2){
        [self scoreBlock2];
        [self disablePause];
        pauseDisabledBy2 = TRUE;
        if (gameOver){
            [self scoreBlock1];
        }else if (!gameOver){
            [self performSelector:@selector(resetCircleFromNum:) withObject:[NSNumber numberWithInt:2] afterDelay:5.0];
            if (pauseDisabledBy1){
                // cancel the other enable selector
                [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(enablePause) object:nil];
            }
        [self performSelector:@selector(enablePause) withObject:nil afterDelay:5.0];
        }
    }
}

-(NSString*) tapFeedback:(int)accuracy
{
    NSString* feedbackTerm = @"Miss";
    int score = 0;
    if (!gameOver){
        if (accuracy <= 2)
        {
            feedbackTerm = @"Awesome";
            score = 100;
        }
        else if (accuracy <= 5)
        {
            feedbackTerm = @"Good";
            score = 50;
        }
        
        else if (accuracy <= 8)
        {
            feedbackTerm = @"Okay";
            score = 25;
        }
        else
        {
            if ([gameModel getLives] > 0)
            {
                [gameModel decreaseLife];
                [gameView updateLife:[gameModel getLives]];
            }
        }
    }
    [gameModel incrementScore:score];
    return feedbackTerm;
}

-(int)calculateAccuracyFromPercent:(float)circlePercent andTargetFractionValue:(float)fracValue
{
    int accuracy = fabsf(fracValue*100 - circlePercent);
    return accuracy;
}

-(float) calculateFractionValue:(NSArray*)fraction
{
    int numerator = [fraction[0] intValue];
    int denominator = [fraction[1] intValue];
    float fracValue = (float) numerator/denominator;
    return fracValue;
}


-(void) displayFeedback:(NSString*)feedbackTerm atPosition:(CGPoint)location
{
    // Any visual onscreen feedback other than the circle filling
}


// Game Over Actions
-(void) checkGameOver
{
    if ([gameModel getLives]==0) // the game is over
    {
        if (!gameOver){ // the first time this is reached
            [self performSelector:@selector(goToHighScores) withObject:nil afterDelay:5.0];
            [timer1 invalidate];
            [gameView disablePause];

        }
        gameOver = TRUE; // the selector won't be double scheduled, now
        NSLog(@"Game should be over now, technically!");
        [timer1 invalidate];

    }
}

// Helper method that can be called by a selector
-(void) goToHighScores
{
    bg1Far.center = CGPointMake(bg1Far.image.size.width/2.0,bg1Far.image.size.height/2.0);
    bg2Far.center = CGPointMake(bg2Far.image.size.width/2.0,bg2Far.image.size.height/2.0);
    bg1Near.center = CGPointMake(bg1Near.image.size.width/2.0,bg1Near.image.size.height/2.0);
    bg2Near.center = CGPointMake(bg2Near.image.size.width/2.0,bg2Near.image.size.height/2.0);
    [gameView removeFromSuperview];
    // Save the score in the userDefaults for last game, and go to high scores
    [[NSUserDefaults standardUserDefaults] setInteger:[gameModel getScore] forKey:@"lastGameScore"];
    [self.screenDelegate goToScreenFromGame1:toHighScores];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Protocol for communicating with ViewController
-(void) passedButtonPress:(UIButton*)button
{
    bg1Far.center = CGPointMake(bg1Far.image.size.width/2.0,bg1Far.image.size.height/2.0);
    bg2Far.center = CGPointMake(bg2Far.image.size.width/2.0,bg2Far.image.size.height/2.0);
    bg1Near.center = CGPointMake(bg1Near.image.size.width/2.0,bg1Near.image.size.height/2.0);
    bg2Near.center = CGPointMake(bg2Near.image.size.width/2.0,bg2Near.image.size.height/2.0);
    if (self.screenDelegate)
    {
        NSString* screenTitle = button.titleLabel.text;
        [self.screenDelegate goToScreenFromGame1:screenTitle];
    }
}

// Protocol for pausing and resuming game
-(void) gamePause
{
    [timer1 invalidate];
}

-(void) gameResume
{
    [self startTimer1];
}

// Protocol for boosting
-(void) boost
{
    isBoosted = TRUE;
    percentChange +=1;
    backgroundMoveAmount *= 3;
}

-(void) unboost
{
    isBoosted = FALSE;
    percentChange = [gameModel calculateSpeed];
    backgroundMoveAmount = [gameModel getBackgroundChange];
}

// Disables pause button while feedback displays until circle resets
-(void) disablePause
{
    [gameView disablePause];
}

-(void) enablePause
{
    pauseDisabledBy1 = FALSE;
    pauseDisabledBy2 = FALSE;
    [gameView enablePause];
}

@end
