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
        
        [self resetCircle1:YES andCircle2:YES];
        [self startTimer];
        
    }
    return self;
}

-(void) startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(checkUpdate)
                                           userInfo:nil
                                            repeats:YES];
}


-(void) resetCircle1:(BOOL)shouldReset1 andCircle2:(BOOL)shouldReset2
{
    percentChange = [gameModel calculateSpeed]; // check every time you reset a circle
    if (shouldReset1)
    {
        circlePercent1 = 0;
        [(SingleGameView*)self.view updateCircle1:circlePercent1 circle2:NO];//displays the circle without having to increase the percent
        [(SingleGameView*)self.view setFeedback1:0 feedback2:NO];
        currentFraction1 = [fractionModel getFractionWithMinD:2 andMaxD:4];
        [self updateFraction1:YES andFraction2:NO];
    }
    if (shouldReset2)
    {
        circlePercent2 = 0;
        [(SingleGameView*)self.view updateCircle1:NO circle2:circlePercent2];
        [(SingleGameView*)self.view setFeedback1:NO feedback2:0];
        currentFraction2 = [fractionModel getFractionWithMinD:2 andMaxD:4];
        [self updateFraction1:NO andFraction2:YES];
    }    
    [self updateScore];    
}

-(void) checkUpdate
{
    if (update1)
        [self updateCircle1];
    if (!update1){
        update1 = TRUE;
        [self resetCircle1:YES andCircle2:NO];
        touch1 = FALSE;
    }
    if (update2)
        [self updateCircle2];
    if (!update2) {
        update2 = TRUE;
        [self resetCircle1:NO andCircle2:YES];
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
        [self resetCircle1:YES andCircle2:NO];
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
        [self resetCircle1:NO andCircle2:YES];
    }
}

-(void) updateFraction1:(BOOL)shouldUpdate1 andFraction2:(BOOL)shouldUpdate2
{
    if (shouldUpdate1)
        [(SingleGameView*)self.view updateFraction1:currentFraction1 fraction2:NO];
    if (shouldUpdate2)
        [(SingleGameView*)self.view updateFraction1:NO fraction2:currentFraction2];
}

-(void) updateScore
{
    int score = [gameModel getScore];
    [(SingleGameView*)self.view updateScore:score];
}


-(void) scoreTap1
{
    update1 = FALSE;
    int accuracy;
    int numerator = [currentFraction1[0] intValue];
    int denominator = [currentFraction1[1] intValue];
    
    float fracValue = (float)numerator/denominator;
    accuracy = fabsf(fracValue*100 - circlePercent1);
    [self tapFeedback1:accuracy];
    
    [(SingleGameView*)self.view setFeedback1:fracValue*100 feedback2:NO];
    
    [self updateScore];
    [(SingleGameView*)self.view updateCircle1:circlePercent1 circle2:NO];
    touch1 = TRUE;
}


-(void) scoreTap2
{
    update2 = FALSE;
    int accuracy;
    int numerator = [currentFraction2[0] intValue];
    int denominator = [currentFraction2[1] intValue];
    
    float fracValue = (float)numerator/denominator;
    accuracy = fabsf(fracValue*100 - circlePercent2);
    [self tapFeedback2:accuracy];
    
    [(SingleGameView*)self.view setFeedback1:NO feedback2:fracValue*100];
    
    [self updateScore];
    [(SingleGameView*)self.view updateCircle1:NO circle2:circlePercent2];
    touch2 = TRUE;
}


-(void) tapFeedback1:(int)accuracy
{
    if (accuracy <= 2)
    {
        feedbackTerm1 = @"Awesome";
        [gameModel incrementScore:100];
    }
    
    else if (accuracy <= 5)
    {
        feedbackTerm1 = @"Good";
        [gameModel incrementScore:50];
    }
    
    else if (accuracy <= 8)
    {
        feedbackTerm1 = @"Okay";
        [gameModel incrementScore:25];
    }
    
    else
    {
        feedbackTerm1 = @"Miss";
    }
}

-(void) tapFeedback2:(int)accuracy
{
    if (accuracy <= 2)
    {
        feedbackTerm2 = @"Awesome";
        [gameModel incrementScore:100];
    }
    
    else if (accuracy <= 5)
    {
        feedbackTerm2 = @"Good";
        [gameModel incrementScore:50];
    }
    
    else if (accuracy <= 8)
    {
        feedbackTerm2 = @"Okay";
        [gameModel incrementScore:25];
    }
    
    else
    {
        feedbackTerm2 = @"Miss";
    }
}

-(void) touchesBegan:(NSSet*) touches withEvent:(UIEvent *) event
{
    UITouch* t = [touches anyObject];
    
    CGPoint touchLocation = [t locationInView:singleGameView.shipView];
    
    if (CGRectContainsPoint(singleGameView.shipView.circleView1.frame, touchLocation))
        [self scoreTap1];
    if (CGRectContainsPoint(singleGameView.shipView.circleView2.frame, touchLocation))
        [self scoreTap2];
    
    /*if ([t.view class] == [CircleView class] && !touch1)
    {
        [self scoreTap1];
    }*/
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
    [timer invalidate];

}

-(void) gameResume
{
    [self startTimer];

    
}


@end
