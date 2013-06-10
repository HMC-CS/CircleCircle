//
//  MenuView.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled=YES;
        
        // Game button
        gameButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [gameButton setTitle:@"Game" forState:UIControlStateNormal];
        gameButton.frame = CGRectMake(50,30, 50, 30);
        [gameButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:gameButton];
        
        // Credits button
        creditsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [creditsButton setTitle:@"Credits" forState:UIControlStateNormal];
        creditsButton.frame = CGRectMake(150, 30, 50, 30);
        [creditsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:creditsButton];
        
        // Score button
        scoreButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [scoreButton setTitle:@"Score" forState:UIControlStateNormal];
        scoreButton.frame = CGRectMake(250, 30, 50, 30);
        [scoreButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:scoreButton];
        
        // Instructions button
        instructionsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [instructionsButton setTitle:@"Instructions" forState:UIControlStateNormal];
        instructionsButton.frame = CGRectMake(350, 30, 50, 30);
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
