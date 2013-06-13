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
        self.backgroundColor = [UIColor redColor];
        
        self.userInteractionEnabled=YES;
        
        // single button
        singleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [singleButton setTitle:toSingleGame forState:UIControlStateNormal];
        singleButton.frame = CGRectMake(button1X,button1Y, buttonWidth, buttonHeight);
        [singleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:singleButton];
        
        // double button
        doubleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [doubleButton setTitle:toDoubleGame forState:UIControlStateNormal];
        doubleButton.frame = CGRectMake(button2X,button2Y, buttonWidth, buttonHeight);
        [doubleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:doubleButton];
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.frame = CGRectMake(button3X,button3Y, buttonWidth, buttonHeight);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
    }
    return self;
}
/*
-(void)selectDifficulty
{
    // make the view to select from
    UIView* difficultySelection = [[UIView alloc] initWithFrame:self.bounds];
    difficultySelection.backgroundColor = [UIColor brownColor];
    
    UIButton* easyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [easyButton setTitle:@"Easy" forState:UIControlStateNormal];
    easyButton.frame = CGRectMake(ssSingleGameButtonX,ssSingleGameButtonY, ssButtonWidth, ssButtonHeight);
    [easyButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:easyButton];
    
    UIButton* mediumButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [mediumButton setTitle:@"Medium" forState:UIControlStateNormal];
    mediumButton.frame = CGRectMake(ssSingleGameButtonX+50,ssSingleGameButtonY, ssButtonWidth, ssButtonHeight);
    [mediumButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:mediumButton];
    
    UIButton* hardButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [hardButton setTitle:@"Hard" forState:UIControlStateNormal];
    hardButton.frame = CGRectMake(ssSingleGameButtonX+100,ssSingleGameButtonY, ssButtonWidth, ssButtonHeight);
    [hardButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:hardButton];

}*/


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
