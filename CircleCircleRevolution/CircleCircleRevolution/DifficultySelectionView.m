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
        // Initialization code
        
        UIButton* easyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [easyButton setTitle:@"Easy" forState:UIControlStateNormal];
        easyButton.frame = CGRectMake(button1X,button1Y, buttonWidth, buttonHeight);
        [easyButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:easyButton];
        
        UIButton* mediumButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [mediumButton setTitle:@"Medium" forState:UIControlStateNormal];
        mediumButton.frame = CGRectMake(button2X,button2Y, buttonWidth, buttonHeight);
        [mediumButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:mediumButton];
        
        UIButton* hardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [hardButton setTitle:@"Hard" forState:UIControlStateNormal];
        hardButton.frame = CGRectMake(button3X,button3Y, buttonWidth, buttonHeight);
        [hardButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:hardButton];
        
        self.backgroundColor = [UIColor blackColor];
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
