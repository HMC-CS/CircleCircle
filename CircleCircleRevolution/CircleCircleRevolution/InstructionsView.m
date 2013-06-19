//
//  InstructionsView.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "InstructionsView.h"
#import "Config.h"

@implementation InstructionsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // stars background
        UIImageView* bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"instructionsBg.png"]];
        [self addSubview:bg];
        
        float smallCircleButtonPictureWidth = 120;
        float smallCircleButtonPictureHeight = 120;
        
        float xCoord = 25;
        
        
        
        self.userInteractionEnabled=YES;
        
        /// Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"button_round_s_neutral.png"] forState:UIControlStateNormal];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"button_round_s_pressed.png"] forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(xCoord,topButtonY, smallCircleButtonPictureWidth, smallCircleButtonPictureHeight);        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
    }
    return self;
}

// Protocol for communicating with InstructionsViewController, to reach ViewController
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