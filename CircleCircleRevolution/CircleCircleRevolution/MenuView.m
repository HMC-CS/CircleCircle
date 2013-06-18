//
//  MenuView.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "MenuView.h"
#import "Config.h"

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        // stars background
        UIImageView* bgFar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars1_s.png"]];
        bgFar.center = CGPointMake(bgFar.image.size.width/2.0, bgFar.center.y);
        bgFar.backgroundColor = [UIColor clearColor];
        UIImageView* bgNear = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stars1_l.png"]];
        bgNear.center = CGPointMake(bgNear.image.size.width/2.0, bgNear.center.y);
        bgNear.backgroundColor = [UIColor clearColor];
        
        [self addSubview:bgFar];
        [self addSubview:bgNear];

        
        
        float buttonPictureWidth = 252;
        float topButtonHeight = 70;
        float middleButtonHeight = 60;
        float bottomButtonHeight = 64;
        
        float xCoord = self.bounds.size.width/2;// - buttonPictureWidth/2;
        float topButtonY = 100;
        float secondButtonY = topButtonY + topButtonHeight;
        float thirdButtonY = secondButtonY + middleButtonHeight;
        float bottomButtonY = thirdButtonY + middleButtonHeight;
        
        // Initialization code
        self.userInteractionEnabled=YES;
        
        // Game button
        gameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [gameButton setTitle:toSelectionScreen forState:UIControlStateNormal];
        [gameButton setBackgroundImage:[UIImage imageNamed:@"button_top.png"] forState:UIControlStateNormal];
        [gameButton setBackgroundImage:[UIImage imageNamed:@"button_top_pressed.png"] forState:UIControlStateHighlighted];
        gameButton.frame = CGRectMake(xCoord,topButtonY, buttonPictureWidth, topButtonHeight);
        [gameButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:gameButton];
        
        // Instructions button
        instructionsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [instructionsButton setTitle:toInstructions forState:UIControlStateNormal];
        [instructionsButton setBackgroundImage:[UIImage imageNamed:@"button_middle_neutral.png"] forState:UIControlStateNormal];
        [instructionsButton setBackgroundImage:[UIImage imageNamed:@"button_middle_pressed.png"] forState:UIControlStateHighlighted];
        instructionsButton.frame = CGRectMake(xCoord, secondButtonY, buttonPictureWidth, middleButtonHeight);
        [instructionsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:instructionsButton];
        
        // Score button
        scoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [scoreButton setTitle:toHighScores forState:UIControlStateNormal];
        [scoreButton setBackgroundImage:[UIImage imageNamed:@"button_middle_neutral.png"] forState:UIControlStateNormal];
        [scoreButton setBackgroundImage:[UIImage imageNamed:@"button_middle_pressed.png"] forState:UIControlStateHighlighted];
        scoreButton.frame = CGRectMake(xCoord, thirdButtonY, buttonPictureWidth, middleButtonHeight);
        [scoreButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:scoreButton];
        
        // Credits button
        creditsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [creditsButton setTitle:toCredits forState:UIControlStateNormal];
        [creditsButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_neutral.png"] forState:UIControlStateNormal];
        [creditsButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_pressed.png"] forState:UIControlStateHighlighted];
        creditsButton.frame = CGRectMake(xCoord, bottomButtonY, buttonPictureWidth, bottomButtonHeight);
        [creditsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:creditsButton];
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_border_4.png"]];
        highlights.frame = CGRectMake(xCoord,topButtonY,252,251);
        [self addSubview:highlights];
        
         
    }

    return self;
}

// Protocol for communicating with MenuViewController, to reach ViewController
-(void) buttonPress:(id)sender
{
    if (self.pressedDelegate){
        [self.pressedDelegate passedButtonPress:sender];
    }
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
