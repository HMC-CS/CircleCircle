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
        // Configuration Constants
        float xCoord = self.bounds.size.width/2;
        float highlightsHeight = 132;
        
        // stars background
        UIImageView* bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"modeBg.png"]];
        [self addSubview:bg];
        
        // Twinkling stars
        UIEffectDesignerView* twinklingStars = [UIEffectDesignerView effectWithFile:@"starTwinkle.ped"];
        [self addSubview:twinklingStars];
        
        self.userInteractionEnabled=YES;
        
        // single button
        singleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [singleButton setTitle:toSingleGame forState:UIControlStateNormal];
        singleButton.titleLabel.font = fontRectButtons;
        [singleButton setBackgroundImage:topRectButtonNormal forState:UIControlStateNormal];
        [singleButton setBackgroundImage:topRectButtonPressed forState:UIControlStateHighlighted];
        singleButton.frame = CGRectMake(xCoord,topButtonY, rectButtonWidth, rectTopButtonHeight);
        singleButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [singleButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [singleButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [singleButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];


        [singleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:singleButton];
        
        // double button
        doubleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [doubleButton setTitle:toDoubleGame forState:UIControlStateNormal];
        doubleButton.titleLabel.font = fontRectButtons;
        [doubleButton setBackgroundImage:bottomRectButtonNormal forState:UIControlStateNormal];
        [doubleButton setBackgroundImage:bottomRectButtonPressed forState:UIControlStateHighlighted];
        doubleButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [doubleButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [doubleButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [doubleButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];

        doubleButton.frame = CGRectMake(xCoord, secondButtonY, rectButtonWidth, rectMiddleButtonHeight);
        [doubleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:doubleButton];
        
        /// Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.titleLabel.font = fontSmallRoundButtons;
        [menuButton setBackgroundImage:smallCircleButtonNormal forState:UIControlStateNormal];
        [menuButton setBackgroundImage:smallCircleButtonPressed forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(circleButtonX,circleButtonY, smallCircleButtonSize, smallCircleButtonSize);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [menuButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [menuButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [menuButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];


        [self addSubview:menuButton];

        

        UIImageView* highlights = [[UIImageView alloc] initWithImage:highlight2];
        highlights.frame = CGRectMake(xCoord,topButtonY,rectButtonWidth,highlightsHeight);

        [self addSubview:highlights];
        
        UIImageView* title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SelectModeText.png"]];
        title.backgroundColor = [UIColor clearColor];
        title.center = CGPointMake(self.bounds.size.height/2, self.bounds.size.width/3);
        [self addSubview:title];


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
