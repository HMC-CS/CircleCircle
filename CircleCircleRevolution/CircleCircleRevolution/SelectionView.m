//
//  SelectionView.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "SelectionView.h"
#import "Config.h"

@implementation SelectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // stars background
        UIImageView* bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"modeBg.png"]];
        [self addSubview:bg];
        
        // Twinkling stars
        UIEffectDesignerView* twinklingStars = [UIEffectDesignerView effectWithFile:@"starTwinkle.ped"];
        [self addSubview:twinklingStars];
        
        float smallCircleButtonPictureWidth = 120;
        float smallCircleButtonPictureHeight = 120;
        
        float xCoord = self.bounds.size.width/2;
        float menuXCoord = 25;
        
        self.userInteractionEnabled=YES;
        
        // single button
        singleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [singleButton setTitle:toSingleGame forState:UIControlStateNormal];
        [singleButton setBackgroundImage:[UIImage imageNamed:@"button_top.png"] forState:UIControlStateNormal];
        [singleButton setBackgroundImage:[UIImage imageNamed:@"button_top_pressed.png"] forState:UIControlStateHighlighted];
        singleButton.frame = CGRectMake(xCoord,topButtonY, rectButtonWidth, rectTopButtonHeight);

        [singleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:singleButton];
        
        // double button
        doubleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [doubleButton setTitle:toDoubleGame forState:UIControlStateNormal];
        [doubleButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_neutral.png"] forState:UIControlStateNormal];
        [doubleButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_pressed.png"] forState:UIControlStateHighlighted];
        doubleButton.frame = CGRectMake(xCoord, secondButtonY, rectButtonWidth, rectMiddleButtonHeight);
        [doubleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:doubleButton];
        
        /// Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"button_round_s_neutral.png"] forState:UIControlStateNormal];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"button_round_s_pressed.png"] forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(menuXCoord,topButtonY, smallCircleButtonPictureWidth, smallCircleButtonPictureHeight);        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];

        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_border_2.png"]];
        highlights.frame = CGRectMake(xCoord,topButtonY,252,132);
        [self addSubview:highlights];
    }
    return self;
}

// Protocol for communicating with SelectionViewController, to reach ViewController
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
