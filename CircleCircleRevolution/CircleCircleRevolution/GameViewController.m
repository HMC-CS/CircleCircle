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
        circle1Feedback = 0;
        circle1FeedbackChange = 0;
        circle2Feedback = 0;
        circle2FeedbackChange = 0;
        
        circle1FeedbackCount = -1;
        circle2FeedbackCount = -1;
        
        resetCircle1Count = -1;
        resetCircle2Count = -1;
        gameDifficulty = difficulty;
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
            circle1FeedbackCount = -1;
            circle1Feedback = 0;
            circle1FeedbackChange = 0;
            resetCircle1Count = -1;
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
            circle2FeedbackCount = -1;
            circle2Feedback = 0;
            circle2FeedbackChange = 0;
            resetCircle2Count = -1;
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
    [self moveLeft];
    [self checkUpdate1];
    if (gameMode ==2){
        [self checkUpdate2];
        [gameView setFeedback1:circle1Feedback feedback2:circle2Feedback];
    }else{
    [gameView setFeedback1:circle1Feedback feedback2:-1];
    }
}


-(void) checkUpdate1
{
    if (update1)
        [self updateCircle1];
    if (resetCircle1Count>0)
        resetCircle1Count--;
    else if (resetCircle1Count == 0)
        [self resetCircle:1];
    if (circle1FeedbackCount>0){
        circle1FeedbackCount--;
        circle1Feedback += circle1FeedbackChange;        
    }
        
}

-(void) checkUpdate2
{
    if (update2)
        [self updateCircle2];
    if (resetCircle2Count>0)
        resetCircle2Count--;
    else if (resetCircle2Count == 0)
        [self resetCircle:2];
    if (circle2FeedbackCount>0){
        circle2FeedbackCount--;
        circle2Feedback += circle2FeedbackChange;
    }
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
    update1 = FALSE;
    float fracValue = [self calculateFractionValue:currentFraction1];
    int accuracy = [self calculateAccuracyFromPercent:circlePercent1 andTargetFractionValue:fracValue];
    [self tapFeedback:accuracy];
    [self checkGameOver];
    [self updateScore];
    [gameView updateCircle1:circlePercent1 circle2:NO];
    touch1 = TRUE;
    
    float feedbackPercent = fracValue*100;
    if (feedbackPercent>=circlePercent1 && circle1Feedback ==0){
        [gameView setFeedback1:circlePercent1 feedback2:-1];
        circle1FeedbackChange = (feedbackPercent-circlePercent1)/60;
        circle1Feedback = circlePercent1;
            circle1FeedbackCount = 60;
    }
    else if (circle1Feedback == 0){
        circle1FeedbackChange = feedbackPercent/60;
            circle1FeedbackCount = 60;
    }

}

-(void)scoreBlock2
{
    update2 = FALSE;
    float fracValue = [self calculateFractionValue:currentFraction2];
    int accuracy = [self calculateAccuracyFromPercent:circlePercent2 andTargetFractionValue:fracValue];
    [self tapFeedback:accuracy];
    [self checkGameOver];
    [self updateScore];
    [gameView updateCircle1:NO circle2:circlePercent2];
    touch2 = TRUE;
    
    float feedbackPercent = fracValue*100;
    if (feedbackPercent>=circlePercent2 && circle2Feedback==0){
        [gameView setFeedback1:-1 feedback2:circlePercent2];
        circle2FeedbackChange = (feedbackPercent-circlePercent2)/60;
        circle2Feedback = circlePercent2;
        circle2FeedbackCount = 60;

    }
    else if (circle2Feedback == 0){
        circle2FeedbackChange = feedbackPercent/60;
        circle2FeedbackCount = 60;

    }
}

-(void) scoreTap1
{
    if (!touch1){
        [self scoreBlock1];
        if (gameOver && gameMode == 2){
            [self scoreBlock2];        
        }else if (!gameOver){
            resetCircle1Count = 60*5;
            
        }
    }
}

-(void) scoreTap2
{
    if(!touch2){
        [self scoreBlock2];
        if (gameOver){
            [self scoreBlock1];
        }else if (!gameOver){
            resetCircle2Count = 5*60;
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
            [gameView disablePause];

        }
        gameOver = TRUE; // the selector won't be double scheduled, now
        NSLog(@"Game should be over now, technically!");
    }
}

// Helper method that can be called by a selector
-(void) goToHighScores
{
    [timer1 invalidate];
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
    percentChange -= 1;//[gameModel calculateSpeed];
    backgroundMoveAmount /= 3;//[gameModel getBackgroundChange];
}


@end
