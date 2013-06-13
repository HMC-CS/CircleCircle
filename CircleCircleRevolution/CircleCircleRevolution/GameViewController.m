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
        gameView = [[GameView alloc] initWithFrame:[UIScreen mainScreen].bounds andMode:mode];
        gameView.pressedDelegate = self;
        self.view = gameView;
        
        shipModel = [[ShipModel alloc] init];
        fractionModel = [[FractionModel alloc] init];
        gameModel = [[GameModel alloc] init];
        
        gameMode = mode;
        update1 = TRUE;
        update2 = TRUE;
        touch1 = FALSE;
        touch2 = FALSE;
        percentChange = 0.1;
        
        [self resetCircle:1];
        [self resetCircle:2];
        [self startTimer1];
        if (gameMode == 2)
            [self startTimer2];
        [gameView updateLife:[gameModel getLives]];
        gameOver = FALSE;
        
    }
    return self;
}

// Timers
-(void) startTimer1
{
    if (!gameOver){
    timer1 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(checkUpdate1)
                                           userInfo:nil
                                            repeats:YES];

    }
}

-(void) startTimer2
{
    if (!gameOver) {
    timer2 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                              target:self
                                            selector:@selector(checkUpdate2)
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
        if (circleNumber ==1)
        {
            circlePercent1 = 0;
            [gameView updateCircle1:circlePercent1 circle2:NO];
            [gameView setFeedback1:0 feedback2:-1];
            currentFraction1 = [fractionModel getFractionWithMinD:2 andMaxD:4];
            [self updateFraction1:YES andFraction2:NO];
        }
        if (circleNumber == 2)
        {
            circlePercent2 = 0;
            [gameView updateCircle1:NO circle2:circlePercent2];
            [gameView setFeedback1:-1 feedback2:0];
            currentFraction2 = [fractionModel getFractionWithMinD:2 andMaxD:4];
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
-(void) checkUpdate1
{
    if (update1)
        [self updateCircle1];
    if (!update1){
        update1 = TRUE;
        touch1 = FALSE;
    }
}

-(void) checkUpdate2
{
    if (update2)
        [self updateCircle2];
    if (!update2) {
        update2 = TRUE;
        touch2 = FALSE;
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
    [timer1 invalidate];
    update1 = FALSE;
    float fracValue = [self calculateFractionValue:currentFraction1];
    int accuracy = [self calculateAccuracyFromPercent:circlePercent1 andTargetFractionValue:fracValue];
    [self tapFeedback:accuracy];
    [self checkGameOver];
    [gameView setFeedback1:fracValue*100 feedback2:-1];
    NSLog(@"frac value for feedback on circle 1 is %f",fracValue);
    [self updateScore];
    [gameView updateCircle1:circlePercent1 circle2:NO];
    touch1 = TRUE;
}

-(void)scoreBlock2
{
    [timer2 invalidate];
    update2 = FALSE;
    float fracValue = [self calculateFractionValue:currentFraction2];
    int accuracy = [self calculateAccuracyFromPercent:circlePercent2 andTargetFractionValue:fracValue];
    [self tapFeedback:accuracy];
    [self checkGameOver];
    [gameView setFeedback1:-1 feedback2:fracValue*100];
    NSLog(@"frac value for feedback on circle 2 is %f",fracValue);

    [self updateScore];
    [gameView updateCircle1:NO circle2:circlePercent2];
    touch2 = TRUE;
}

-(void) scoreTap1
{
    [self scoreBlock1];    
    if (gameOver && gameMode == 2){
        [self scoreBlock2];        
    }else if (!gameOver){
        [self performSelector:@selector(startTimer1) withObject:nil afterDelay:5.0];
        [self performSelector:@selector(resetCircleFromNum:) withObject:[NSNumber numberWithInt:1] afterDelay:5.0];
    }    
}

-(void) scoreTap2
{
    [self scoreBlock2];
    if (gameOver){
        [self scoreBlock1];
    }else if (!gameOver){
        [self performSelector:@selector(startTimer2) withObject:nil afterDelay:5.0];
        [self performSelector:@selector(resetCircleFromNum:) withObject:[NSNumber numberWithInt:2] afterDelay:5.0]; 
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
    
}


// Game Over Actions
-(void) checkGameOver
{
    if ([gameModel getLives]==0) // the game is over
    {
        if (!gameOver){ // the first time this is reached
            [self performSelector:@selector(backToMainMenu) withObject:nil afterDelay:5.0];
            [timer1 invalidate];
            [timer2 invalidate];
            NSLog(@"fraction1 is %f",[self calculateFractionValue:currentFraction1]);
            NSLog(@"fraction2 is %f",[self calculateFractionValue:currentFraction2]);

        }
        gameOver = TRUE; // the selector won't be double scheduled, now
        NSLog(@"Game should be over now, technically!");
        [timer1 invalidate];
        [timer2 invalidate];

    }
}

// Helper method that can be called by a selector
-(void) backToMainMenu
{
    [self.screenDelegate goToScreenFromGame1:toMainMenu];

}

-(void) touchesBegan:(NSSet*) touches withEvent:(UIEvent *) event
{
    UITouch* t = [touches anyObject];
    CGPoint touchLocation = [t locationInView:gameView.shipView];
    if (CGRectContainsPoint(gameView.shipView.circleView1.frame, touchLocation) && [t.view class] == [CircleView class] && !touch1){
       [self scoreTap1];        
    }
    if (CGRectContainsPoint(gameView.shipView.circleView2.frame, touchLocation) && [t.view class] == [CircleView class] && !touch2){
        [self scoreTap2];
    }
    return;
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
    if (gameMode == 2)
        [timer2 invalidate];
}

-(void) gameResume
{
    [self startTimer1];
    if (gameMode == 2)
        [self startTimer2];
}


@end
