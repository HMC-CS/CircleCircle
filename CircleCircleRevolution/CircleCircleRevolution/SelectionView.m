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
        float highlightsHeight = 192;
        
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
        [singleButton setTitleEdgeInsets:UIEdgeInsetsMake(10,0,0,0)];
        [singleButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [singleButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [singleButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [singleButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
        [singleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:singleButton];
        
        // double button
        doubleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [doubleButton setTitle:toDoubleGame forState:UIControlStateNormal];
        doubleButton.titleLabel.font = fontRectButtons;
        [doubleButton setBackgroundImage:midRectButtonNormal forState:UIControlStateNormal];
        [doubleButton setBackgroundImage:midRectButtonPressed forState:UIControlStateHighlighted];
        doubleButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [doubleButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [doubleButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [doubleButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        doubleButton.frame = CGRectMake(xCoord, secondButtonY, rectButtonWidth, rectMiddleButtonHeight);
        [doubleButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [doubleButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [doubleButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [doubleButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
        [doubleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:doubleButton];
        
        /// Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.titleLabel.font = fontRectButtons;
        [menuButton setBackgroundImage:bottomRectButtonNormal forState:UIControlStateNormal];
        [menuButton setBackgroundImage:bottomRectButtonPressed forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(xCoord, thirdButtonY, rectButtonWidth, rectBottomButtonHeight);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [menuButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [menuButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [menuButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [menuButton setTitleEdgeInsets:UIEdgeInsetsMake(-10,0,0,0)];
        [menuButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [menuButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [menuButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [menuButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];


        [self addSubview:menuButton];

        

        UIImageView* highlights = [[UIImageView alloc] initWithImage:highlight3];
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

-(void) pressDown:(id)sender
{
    buttonDownSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonSFXURL error:nil];
    [buttonDownSound prepareToPlay];
    [buttonDownSound play];
    UIButton* button = (UIButton*)sender;
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(button.titleEdgeInsets.top+2,0,0,0)];
}

-(void) pressUp:(id)sender
{
    buttonUpSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonSFXURL error:nil];
    [buttonUpSound prepareToPlay];
    [buttonUpSound play];
    UIButton* button = (UIButton*)sender;
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(button.titleEdgeInsets.top-2,0,0,0)];
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
