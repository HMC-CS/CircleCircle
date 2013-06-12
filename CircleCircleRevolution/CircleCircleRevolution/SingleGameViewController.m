//
//  SingleGameViewController.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "SingleGameViewController.h"
#import "Config.h"

@interface SingleGameViewController ()

@end

@implementation SingleGameViewController

-(id)initWithMode:(int)mode andDifficulty:(int)difficulty
{
    self = [super init];
    if (self)
    {
        SingleGameView* game = [[SingleGameView alloc] initWithFrame:[UIScreen mainScreen].bounds andMode:mode];
        game.pressedDelegate = self;
        self.view = game;
        singleGameView = game;
        
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
        [singleGameView updateLife:[gameModel getLives]];
        gameOver = FALSE;
        
    }
    return self;
}

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


-(void) resetCircle:(int)circleNumber
{
    percentChange = [gameModel calculateSpeed]; // check every time you reset a circle
    if (circleNumber ==1)
    {
        circlePercent1 = 0;
        [(SingleGameView*)self.view updateCircle1:circlePercent1 circle2:NO];//displays the circle without having to increase the percent
        [(SingleGameView*)self.view setFeedback1:0 feedback2:NO];
        currentFraction1 = [fractionModel getFractionWithMinD:2 andMaxD:4];
        [self updateFraction1:YES andFraction2:NO];
        update1 = TRUE;
    }
    if (circleNumber == 2)
    {
        circlePercent2 = 0;
        [(SingleGameView*)self.view updateCircle1:NO circle2:circlePercent2];
        [(SingleGameView*)self.view setFeedback1:NO feedback2:0];
        currentFraction2 = [fractionModel getFractionWithMinD:2 andMaxD:4];
        [self updateFraction1:NO andFraction2:YES];
    }    
    [self updateScore];    
}

-(void) resetCircleFromNum:(NSNumber*)circleNumber
{
    [self resetCircle:[circleNumber integerValue]];
}


-(void) checkUpdate1
{
    [self checkGameOver];
    if (update1)
        [self updateCircle1];
    if (!update1){
        update1 = TRUE;
        //[self resetCircle:1];
        touch1 = FALSE;
    }
}

-(void) checkUpdate2
{
    [self checkGameOver];
    if (update2)
        [self updateCircle2];
    if (!update2) {
        update2 = TRUE;
        //[self resetCircle:2];
        touch2 = FALSE;
    }
    
}

-(void) updateCircle1
{
    if (circlePercent1 < 100)
    {
        circlePercent1 += percentChange;
        [(SingleGameView*)self.view updateCircle1:circlePercent1 circle2:NO];
    }
    else
    {
        [self scoreTap1];
        //[self resetCircle:1];


    }
}

-(void) updateCircle2
{
    if (circlePercent2 < 100)
    {
        circlePercent2 += percentChange;
        [(SingleGameView*)self.view updateCircle1:NO circle2:circlePercent2];
    }
    else
    {
        [self scoreTap2];
    }
}

-(void) updateFraction1:(BOOL)shouldUpdate1 andFraction2:(BOOL)shouldUpdate2
{
    if (shouldUpdate1)
        [(SingleGameView*)self.view updateFraction1:currentFraction1 fraction2:NO];
    if (shouldUpdate2)
        [(SingleGameView*)self.view updateFraction1:NO fraction2:currentFraction2];
}

// Passes down the changed score so that it is displayed
-(void) updateScore
{
    int score = [gameModel getScore];
    [(SingleGameView*)self.view updateScore:score];
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

-(void) scoreTap1
{
  
    [timer1 invalidate];
    update1 = FALSE;
    float fracValue = [self calculateFractionValue:currentFraction1];
    int accuracy = [self calculateAccuracyFromPercent:circlePercent1 andTargetFractionValue:fracValue];
    [self tapFeedback:accuracy];
    
    [(SingleGameView*)self.view setFeedback1:fracValue*100 feedback2:NO];
    
    [self updateScore];
    [(SingleGameView*)self.view updateCircle1:circlePercent1 circle2:NO];
    touch1 = TRUE;
    
    [self performSelector:@selector(startTimer1) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(resetCircleFromNum:) withObject:[NSNumber numberWithInt:1] afterDelay:5.0];

}


-(void) scoreTap2
{
    [timer2 invalidate];
    update2 = FALSE;
    float fracValue = [self calculateFractionValue:currentFraction2];
    int accuracy = [self calculateAccuracyFromPercent:circlePercent2 andTargetFractionValue:fracValue];
    [self tapFeedback:accuracy];
    
    [(SingleGameView*)self.view setFeedback1:NO feedback2:fracValue*100];
    
    [self updateScore];
    [(SingleGameView*)self.view updateCircle1:NO circle2:circlePercent2];
    touch2 = TRUE;
    
    [self performSelector:@selector(startTimer2) withObject:nil afterDelay:5.0];
    [self performSelector:@selector(resetCircleFromNum:) withObject:[NSNumber numberWithInt:2] afterDelay:5.0];


}

-(NSString*) tapFeedback:(int)accuracy
{
    NSString* feedbackTerm;
    if (accuracy <= 2)
    {
        feedbackTerm = @"Awesome";
        [gameModel incrementScore:100];
    }
    
    else if (accuracy <= 5)
    {
        feedbackTerm = @"Good";
        [gameModel incrementScore:50];
    }
    
    else if (accuracy <= 8)
    {
        feedbackTerm = @"Okay";
        [gameModel incrementScore:25];
    }
    
    else
    {
        feedbackTerm = @"Miss";
        if ([gameModel getLives] > 0)
        {
            [gameModel decreaseLife];
            [singleGameView updateLife:[gameModel getLives]];
        }

       
    }
    return feedbackTerm;
}

-(void) displayFeedback:(NSString*)feedbackTerm atPosition:(CGPoint)location
{
    
}

-(void) checkGameOver
{
    if ([gameModel getLives]==0)
    {
        gameOver = TRUE;
        NSLog(@"Game should be over now, technically!");
        [timer1 invalidate];
        [timer2 invalidate];
        [self.screenDelegate goToScreenFromGame1:toMainMenu];
    }
}

-(void) touchesBegan:(NSSet*) touches withEvent:(UIEvent *) event
{
    NSLog(@"touched!");
    UITouch* t = [touches anyObject];
    CGPoint touchLocation = [t locationInView:singleGameView.shipView];
    if (CGRectContainsPoint(singleGameView.shipView.circleView1.frame, touchLocation) && [t.view class] == [CircleView class] && !touch1){
        
    
       [self scoreTap1];
        NSLog(@"score tap 1");
        }
    
    if (CGRectContainsPoint(singleGameView.shipView.circleView2.frame, touchLocation) && [t.view class] == [CircleView class] && !touch2)
        [self scoreTap2];
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
