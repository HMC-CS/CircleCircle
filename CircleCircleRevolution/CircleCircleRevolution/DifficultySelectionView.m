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
        // stars background
        UIImageView* bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"difficultyBg.png"]];
        [self addSubview:bg];

        float xCoord = self.bounds.size.width/2 - rectButtonWidth/2;
        
        UIButton* easyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [easyButton setTitle:@"Easy" forState:UIControlStateNormal];
        [easyButton setBackgroundImage:[UIImage imageNamed:@"button_top.png"] forState:UIControlStateNormal];
        [easyButton setBackgroundImage:[UIImage imageNamed:@"button_top_pressed.png"] forState:UIControlStateHighlighted];
        easyButton.frame = CGRectMake(xCoord,topButtonY, rectButtonWidth, rectTopButtonHeight);
        [easyButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:easyButton];
        
        UIButton* mediumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [mediumButton setTitle:@"Medium" forState:UIControlStateNormal];
        [mediumButton setBackgroundImage:[UIImage imageNamed:@"button_middle_neutral.png"] forState:UIControlStateNormal];
        [mediumButton setBackgroundImage:[UIImage imageNamed:@"button_middle_pressed.png"] forState:UIControlStateHighlighted];
        mediumButton.frame = CGRectMake(xCoord, secondButtonY, rectButtonWidth, rectMiddleButtonHeight);        [mediumButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mediumButton];
        
        UIButton* hardButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [hardButton setTitle:@"Hard" forState:UIControlStateNormal];
        [hardButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_neutral.png"] forState:UIControlStateNormal];
        [hardButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_pressed.png"] forState:UIControlStateHighlighted];
        hardButton.frame = CGRectMake(xCoord, thirdButtonY, rectButtonWidth, rectBottomButtonHeight);        [hardButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:hardButton];
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_border_3.png"]];
        highlights.frame = CGRectMake(xCoord,topButtonY,252,192);
        [self addSubview:highlights];
        
    }
    return self;
}

-(void)buttonPress:(id)sender
{
    [self.pressedDelegate passedDifficulty:sender];
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
