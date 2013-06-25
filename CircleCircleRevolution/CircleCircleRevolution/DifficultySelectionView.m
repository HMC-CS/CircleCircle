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
        float highlightsHeight = 192;

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

        [self addSubview:mediumButton];
        
        UIButton* hardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [hardButton setTitle:hardMode forState:UIControlStateNormal];
        hardButton.titleLabel.font = fontRectButtons;
        [hardButton setBackgroundImage:bottomRectButtonNormal forState:UIControlStateNormal];
        [hardButton setBackgroundImage:bottomRectButtonPressed forState:UIControlStateHighlighted];
        hardButton.frame = CGRectMake(xCoord, thirdButtonY, rectButtonWidth, rectBottomButtonHeight);
        [hardButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        hardButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [hardButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [hardButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [hardButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [self addSubview:hardButton];
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:highlight3];
        highlights.frame = CGRectMake(xCoord,topButtonY,rectButtonWidth,highlightsHeight);
        [self addSubview:highlights];
        
        /// Menu button
        UIButton* menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.titleLabel.font = fontSmallRoundButtons;
        [menuButton setBackgroundImage:smallCircleButtonNormal forState:UIControlStateNormal];
        [menuButton setBackgroundImage:smallCircleButtonPressed forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(circleButtonX,circleButtonY, smallCircleButtonSize, smallCircleButtonSize);
        [menuButton addTarget:self action:@selector(toMenu:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [menuButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [menuButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [menuButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        
        [self addSubview:menuButton];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
