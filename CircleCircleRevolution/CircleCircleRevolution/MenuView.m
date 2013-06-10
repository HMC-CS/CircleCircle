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
        // Initialization code
        self.userInteractionEnabled=YES;
        
        // Game button
        gameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [gameButton setTitle:toSelectionScreen forState:UIControlStateNormal];
        gameButton.frame = CGRectMake(mmSelectionButtonX,mmSelectionButtonY, mmButtonWidth, mmButtonHeight);
        [gameButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:gameButton];
        
        // Credits button
        creditsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [creditsButton setTitle:toCredits forState:UIControlStateNormal];
        creditsButton.frame = CGRectMake(mmCreditsButtonX, mmCreditsButtonY, mmButtonWidth, mmButtonHeight);
        [creditsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:creditsButton];
        
        // Score button
        scoreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [scoreButton setTitle:toHighScores forState:UIControlStateNormal];
        scoreButton.frame = CGRectMake(mmScoreButtonX, mmScoreButtonY, mmButtonWidth, mmButtonHeight);
        [scoreButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:scoreButton];
        
        // Instructions button
        instructionsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [instructionsButton setTitle:toInstructions forState:UIControlStateNormal];
        instructionsButton.frame = CGRectMake(mmInstructionsButtonX, mmInstructionsButtonY, mmButtonWidth, mmButtonHeight);
        [instructionsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:instructionsButton];
         
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
