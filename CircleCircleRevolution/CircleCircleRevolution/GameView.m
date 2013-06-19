//
//  GameView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "GameView.h"

@implementation GameView

- (id)initWithFrame:(CGRect)frame andMode:(int)mode
{
    self = [super initWithFrame:frame];
    if (self) {
        float buttonPictureWidth = 252;
        float topButtonHeight = 70;
        float bottomButtonHeight = 64;
        
        float xCoord = self.bounds.size.width/2  - buttonPictureWidth/2;
        float topButtonY = 100;
        float bottomButtonY = topButtonY + topButtonHeight;
        
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        self.userInteractionEnabled = YES;
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:@"Menu" forState:UIControlStateNormal];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_neutral.png"] forState:UIControlStateNormal];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_pressed.png"] forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(xCoord-87, bottomButtonY, buttonPictureWidth, bottomButtonHeight);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        // Boost button
        boostButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [boostButton setTitle:@"Boost" forState:UIControlStateNormal];
        boostButton.frame = CGRectMake(50,500,178,178);
        [boostButton setImage:[UIImage imageNamed:@"button_round_l_neutral.png"] forState:UIControlStateNormal];
        [boostButton setImage:[UIImage imageNamed:@"button_round_l_pressed.png"] forState:UIControlStateHighlighted];
        [boostButton addTarget:self action:@selector(unboost) forControlEvents:UIControlEventTouchUpInside];
        [boostButton addTarget:self action:@selector(unboost) forControlEvents:UIControlEventTouchDragExit];
        [boostButton addTarget:self action:@selector(boost) forControlEvents:UIControlEventTouchDown];
        [boostButton addTarget:self action:@selector(boost) forControlEvents:UIControlEventTouchDragEnter];        
    
        // Pause button
        pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        pauseButton.frame = CGRectMake(50,50,120,120);
        [pauseButton setImage:[UIImage imageNamed:@"button_round_s_neutral.png"] forState:UIControlStateNormal];
        [pauseButton setImage:[UIImage imageNamed:@"button_round_s_pressed.png"] forState:UIControlStateHighlighted];
        [pauseButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
        
        // Resume button
        resumeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [resumeButton setTitle:@"Resume" forState:UIControlStateNormal];
        [resumeButton setBackgroundImage:[UIImage imageNamed:@"button_top.png"] forState:UIControlStateNormal];
        [resumeButton setBackgroundImage:[UIImage imageNamed:@"button_top_pressed.png"] forState:UIControlStateHighlighted];
        resumeButton.frame = CGRectMake(xCoord-87,topButtonY, buttonPictureWidth, topButtonHeight);
        [resumeButton addTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchUpInside];
        
        // Pause Screen
        pauseView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pause.png"]];
        pauseView.frame = CGRectMake(87,75,850,620);
        pauseView.backgroundColor = [UIColor clearColor];
        pauseView.userInteractionEnabled = YES;
        [pauseView addSubview:menuButton];
        [pauseView addSubview:resumeButton];
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_border_2.png"]];
        highlights.frame = CGRectMake(xCoord-87,topButtonY,252,132+2);
        [pauseView addSubview:highlights];
        
        pauseView.alpha = 0;
        
        // Ship view
        if (mode == 1)
            shipView = [[ShipView alloc] initWithFrame:CGRectMake(177,100,850,500) andMode:mode];
        else if (mode == 2)
            shipView = [[ShipView alloc] initWithFrame:CGRectMake(107,160,850,500) andMode:mode];
        shipView.backgroundColor = [UIColor clearColor];
        
        // Score view
        gameScoreView = [[GameScoreView alloc] initWithFrame:CGRectMake(700, -25, 310, 140)];
        
        // Life View
        lifeView = [[LifeView alloc] initWithFrame:CGRectMake(850, 450, 120, 250)];
        
        
        [self addSubview:pauseView];
        [self sendSubviewToBack:pauseView];
        [self addSubview:pauseButton];
        [self addSubview:shipView];
        [self addSubview:gameScoreView];
        [self addSubview:lifeView];
        [self addSubview:boostButton];

    }
    return self;
}

// Updates passed down to subviews
-(void) updateFraction1:(NSArray *)currentFraction1 fraction2:(NSArray *)currentFraction2
{
    [shipView updateFraction1:currentFraction1 fraction2:currentFraction2];
}

-(void) updateCircle1:(float)percent1 circle2:(float)percent2
{
    [shipView updateCircle1:percent1 circle2:percent2];
}

-(void) updateScore:(int)score
{
    [gameScoreView updateScore:score];
}

-(void) updateLife:(int)lives
{
    [lifeView updateLife:lives];
}

-(void)setFeedback1:(float)feedbackPercent1 feedback2:(float)feedbackPercent2
{
    [shipView setFeedback1:feedbackPercent1 feedback2:feedbackPercent2];
}

// Protocol for communicating with GameViewController, to reach ViewController
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

-(void) boost
{
    [self.pressedDelegate boost];
    // change ship as needed
}

-(void) unboost
{
    [self.pressedDelegate unboost];
}


-(void) setCircleTarget:(id)sender forAction:(SEL)action whichCircle:(int)circleNumber
{
    [shipView setCircleTarget:sender forAction:action whichCircle:circleNumber];
}

-(void) disablePause
{
    pauseButton.enabled = NO;
}

-(void) enablePause
{
    pauseButton.enabled = YES;
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
