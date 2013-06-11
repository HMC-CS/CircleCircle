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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        SingleGameView* game = [[SingleGameView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        game.pressedDelegate = self;
        self.view = game;
        
        shipModel = [[ShipModel alloc] init];
        fractionModel = [[FractionModel alloc] init];
        gameModel = [[GameModel alloc] init];
        
        update = TRUE;
        touch = FALSE;
        percentChange = 0.1;
        
        difficultySelectionView = [[DifficultySelectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        difficultySelectionView.pressedDelegate = self;
        [self.view addSubview:difficultySelectionView];
        
        //[self newObject];
        //[self startTimer];
    }
    return self;
}


-(void) newObject
{
    percentChange = [gameModel calculateSpeed];
    circlePercent = 0;
    [(SingleGameView*)self.view updateCircle:circlePercent];
    [(SingleGameView*)self.view setFeedback:0];
    currentFraction = [fractionModel getFractionWithMinD:2 andMaxD:4];
    [self updateFraction];
    [self updateScore];
}




-(void) startTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(checkUpdate)
                                           userInfo:nil
                                            repeats:YES];
}

-(void) checkUpdate{
    if (update) {
        [self updateCircle];
    }
    //if (!update && [animateImage isAnimating] == NO) {
    if (!update) {
        update = TRUE;
        [self newObject];
        touch = FALSE;
    }
}

-(void) updateCircle
{
    if (circlePercent < 100)
    {
        circlePercent += percentChange;
        [(SingleGameView*)self.view updateCircle:circlePercent];
    }
    else
    {
        circlePercent = 0;
        [self newObject];
    }
}

-(void) updateFraction
{
    [(SingleGameView*)self.view updateFraction:currentFraction];
}

-(void) updateScore
{
    int score = [gameModel getScore];
    [(SingleGameView*)self.view updateScore:score];
}


-(void) scoreTap
{
    update = FALSE;
    int accuracy;
    int numerator = [currentFraction[0] intValue];
    int denominator = [currentFraction[1] intValue];
    
    float fracValue = (float)numerator/denominator;
    accuracy = fabsf(fracValue*100 - circlePercent);
    [self tapFeedback:accuracy];
    
    [(SingleGameView*)self.view setFeedback:fracValue*100];
    
    [self updateScore];
    [(SingleGameView*)self.view updateCircle:circlePercent];
    touch = TRUE;
}

-(void) tapFeedback:(int)accuracy
{
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
    }
    
    
}

-(void) touchesBegan:(NSSet*) touches withEvent:(UIEvent *) event
{
    UITouch* t = [touches anyObject];
    
    if ([t.view class] == [CircleView class] && !touch)
    {
        [self scoreTap];
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
    [timer invalidate];
}

-(void) gameResume
{
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                             target:self
                                           selector:@selector(checkUpdate)
                                           userInfo:nil
                                            repeats:YES];
}


// Protocol for Selecting Difficulty
-(void)passedDifficulty:(UIButton *)button
{
    [self.view sendSubviewToBack:difficultySelectionView];
    difficultySelectionView.alpha = 0;
    // Set fraction model difficulty here based on the button
    [self newObject];
    [self startTimer];
}


@end
