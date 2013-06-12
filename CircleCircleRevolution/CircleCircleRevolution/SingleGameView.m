//
//  SingleGameView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "SingleGameView.h"

@implementation SingleGameView

- (id)initWithFrame:(CGRect)frame andMode:(int)mode
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor yellowColor];
        
        self.userInteractionEnabled = YES;
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [menuButton setTitle:@"Menu" forState:UIControlStateNormal];
        menuButton.frame = CGRectMake(50,30, 50, 30);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        // Pause button
        pauseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        pauseButton.frame = CGRectMake(150,30, 50, 30);
        [pauseButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
        
        // Resume button
        resumeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [resumeButton setTitle:@"Resume" forState:UIControlStateNormal];
        resumeButton.frame = CGRectMake(250,30, 50, 30);
        [resumeButton addTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchUpInside];
        
        // Pause Screen
        pauseView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.bounds.size.height,self.bounds.size.width)];
        pauseView.backgroundColor = [UIColor purpleColor];
        [pauseView addSubview:menuButton];
        [pauseView addSubview:resumeButton];
        pauseView.alpha = 0;
        
        // Ship view
        _shipView = [[ShipView alloc] initWithFrame:CGRectMake(200,200,400,300) andMode:mode];
        _shipView.backgroundColor = [UIColor magentaColor];
        
        //Score view
        gameScoreView = [[GameScoreView alloc] initWithFrame:CGRectMake(500, 10, 200, 100)];
        
        [self addSubview:pauseView];
        [self sendSubviewToBack:pauseView];
        [self addSubview:pauseButton];
        [self addSubview:_shipView];
        [self addSubview:gameScoreView];

    }
    return self;
}


-(void) updateFraction1:(NSArray *)currentFraction1 fraction2:(NSArray *)currentFraction2
{
    [_shipView updateFraction1:currentFraction1 fraction2:currentFraction2];
}

-(void) updateCircle1:(float)percent1 circle2:(float)percent2
{
    [_shipView updateCircle1:percent1 circle2:percent2];
}

-(void) updateScore:(int)score
{
    [gameScoreView updateScore:score];
}

// Protocol for communicating with SingleGameViewController, to reach ViewController
-(void) buttonPress:(id)sender
{
    if (self.pressedDelegate){
        [self.pressedDelegate passedButtonPress:sender];
    }
}

// Protocol for pausing and resuming game
-(void) pause
{
    [self bringSubviewToFront:pauseView];
    pauseView.alpha = 1;
    [self.pressedDelegate gamePause];
}

-(void) resume
{
    [self sendSubviewToBack:pauseView];
    pauseView.alpha = 0;
    [self.pressedDelegate gameResume];
}

-(void)setFeedback1:(float)feedbackPercent1 feedback2:(float)feedbackPercent2
{
    [_shipView setFeedback1:feedbackPercent1 feedback2:feedbackPercent2];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
