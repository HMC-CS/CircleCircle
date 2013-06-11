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

-(id)initWithMode:(int)mode
{
    self = [super init];
    if (self)
    {
        SingleGameView* game = [[SingleGameView alloc] initWithFrame:[UIScreen mainScreen].bounds andMode:mode];
        game.pressedDelegate = self;
        self.view = game;
        
        shipModel = [[ShipModel alloc] init];
        fractionModel = [[FractionModel alloc] init];
        gameModel = [[GameModel alloc] init];
        
        gameMode = mode;
        update1 = TRUE;
        update2 = TRUE;
        touch1 = FALSE;
        touch2 = FALSE;
        percentChange = 0.1;
        
        difficultySelectionView = [[DifficultySelectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        difficultySelectionView.pressedDelegate = self;
        [self.view addSubview:difficultySelectionView];
    }
    return self;
}

-(void) startTimer1
{
    timer1 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(checkUpdate1)
                                           userInfo:nil
                                            repeats:YES];
}

-(void) startTimer2
{
    timer2 = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(checkUpdate2)
                                           userInfo:nil
                                            repeats:YES];
}

-(void) newObject1
{
    percentChange = [gameModel calculateSpeed];
    circlePercent1 = 0;
    [(SingleGameView*)self.view updateCircle1:circlePercent1 circle2:NO];
    [(SingleGameView*)self.view setFeedback1:0 feedback2:NO];
    currentFraction1 = [fractionModel getFractionWithMinD:2 andMaxD:4];
    [self updateFraction1];
    [self updateScore];
}


-(void) checkUpdate1
{
    if (update1) {
        [self updateCircle1];
    }
    //if (!update && [animateImage isAnimating] == NO) {
    if (!update1) {
        update1 = TRUE;
        [self newObject1];
        touch1 = FALSE;
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
        circlePercent1 = 0;
        [self newObject1];
    }
}

-(void) updateFraction1
{
    [(SingleGameView*)self.view updateFraction1:currentFraction1 fraction2:currentFraction2];
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

-(void) newObject2
{
    percentChange = [gameModel calculateSpeed];
    circlePercent2 = 0;
    [(SingleGameView*)self.view updateCircle1:NO circle2:circlePercent2];
    [(SingleGameView*)self.view setFeedback1:NO feedback2:0];
    currentFraction2 = [fractionModel getFractionWithMinD:2 andMaxD:4];
    [self updateFraction2];
    [self updateScore];
}


-(void) checkUpdate2
{
    if (update2) {
        [self updateCircle2];
    }
    //if (!update && [animateImage isAnimating] == NO) {
    if (!update2) {
        update2 = TRUE;
        [self newObject2];
        touch2 = FALSE;
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
        circlePercent2 = 0;
        [self newObject2];
    }
}

-(void) updateFraction2
{
    [(SingleGameView*)self.view updateFraction1:NO fraction2:currentFraction2];
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
    
    if ([t.view class] == [CircleView class] && !touch1)
    {
        [self scoreTap1];
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
    [timer2 invalidate];
}

-(void) gameResume
{
    [self startTimer1];
    [self startTimer2];
    
}


// Protocol for Selecting Difficulty
-(void)passedDifficulty:(UIButton *)button
{
    [self.view sendSubviewToBack:difficultySelectionView];
    difficultySelectionView.alpha = 0;
    // Set fraction model difficulty here based on the button
    [self newObject1];
    [self newObject2];
    [self startTimer1];
    [self startTimer2];
}


@end
