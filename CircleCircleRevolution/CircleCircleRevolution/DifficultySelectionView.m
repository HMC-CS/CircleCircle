//
//  DifficultySelectionView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "DifficultySelectionView.h"
#import "Config.h"

@implementation DifficultySelectionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Configuration Constants
        float xCoord = self.bounds.size.width/2 - rectButtonWidth/2;
        float highlightsHeight = 252;

        // stars background
        UIImageView* bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"difficultyBg.png"]];
        [self addSubview:bg];

        // Twinkling stars
        UIEffectDesignerView* twinklingStars = [UIEffectDesignerView effectWithFile:@"starTwinkle.ped"];
        [self addSubview:twinklingStars];
        
        UIButton* easyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [easyButton setTitle:easyMode forState:UIControlStateNormal];
        easyButton.titleLabel.font = fontRectButtons;
        [easyButton setBackgroundImage:topRectButtonNormal forState:UIControlStateNormal];
        [easyButton setBackgroundImage:topRectButtonPressed forState:UIControlStateHighlighted];
        easyButton.frame = CGRectMake(xCoord,topButtonY, rectButtonWidth, rectTopButtonHeight);
        [easyButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        easyButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [easyButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [easyButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [easyButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [easyButton setTitleEdgeInsets:UIEdgeInsetsMake(10,0,0,0)];
        [easyButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [easyButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [easyButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [easyButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:easyButton];

        
        UIButton* mediumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [mediumButton setTitle:mediumMode forState:UIControlStateNormal];
        mediumButton.titleLabel.font = fontRectButtons;
        [mediumButton setBackgroundImage:midRectButtonNormal forState:UIControlStateNormal];
        [mediumButton setBackgroundImage:midRectButtonPressed forState:UIControlStateHighlighted];
        mediumButton.frame = CGRectMake(xCoord, secondButtonY, rectButtonWidth, rectMiddleButtonHeight);
        [mediumButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        mediumButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [mediumButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [mediumButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [mediumButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [mediumButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [mediumButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [mediumButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [mediumButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:mediumButton];
        
        UIButton* hardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [hardButton setTitle:hardMode forState:UIControlStateNormal];
        hardButton.titleLabel.font = fontRectButtons;
        [hardButton setBackgroundImage:midRectButtonNormal forState:UIControlStateNormal];
        [hardButton setBackgroundImage:midRectButtonPressed forState:UIControlStateHighlighted];
        hardButton.frame = CGRectMake(xCoord, thirdButtonY, rectButtonWidth, rectBottomButtonHeight);
        [hardButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        hardButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [hardButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [hardButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [hardButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [hardButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [hardButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [hardButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [hardButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:hardButton];
        
        /// Menu button
        UIButton* menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.titleLabel.font = fontRectButtons;
        [menuButton setBackgroundImage:bottomRectButtonNormal forState:UIControlStateNormal];
        [menuButton setBackgroundImage:bottomRectButtonPressed forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(xCoord, bottomButtonY, rectButtonWidth, rectBottomButtonHeight);
        [menuButton addTarget:self action:@selector(toMenu:) forControlEvents:UIControlEventTouchUpInside];
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
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:highlight4];
        highlights.frame = CGRectMake(xCoord,topButtonY,rectButtonWidth,highlightsHeight);
        [self addSubview:highlights];
        
        UIImageView* title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"SelectDifficultyText.png"]];
        title.backgroundColor = [UIColor clearColor];
        title.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/3);
        [self addSubview:title];
        

        
    }
    return self;
}

-(void)buttonPress:(id)sender
{
    [self.pressedDelegate passedDifficulty:sender];
}

-(void) toMenu:(id)sender
{
    [self.pressedDelegate toMenuFromDifficultySelection:sender];
}

-(void) pressDown:(id)sender
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
        buttonDownSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonDownURL error:nil];
        [buttonDownSound prepareToPlay];
        [buttonDownSound play];
    }
    
    UIButton* button = (UIButton*)sender;
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(button.titleEdgeInsets.top+2,0,0,0)];
}

-(void) pressUp:(id)sender
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
        buttonUpSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonUpURL error:nil];
        [buttonUpSound prepareToPlay];
        [buttonUpSound play];
    }
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
