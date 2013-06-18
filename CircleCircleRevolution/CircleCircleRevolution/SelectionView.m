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
        
        float buttonPictureWidth = 252;
        float topButtonHeight = 70;
        float middleButtonHeight = 60;
        float bottomButtonHeight = 64;
        
        float xCoord = self.bounds.size.width/2;
        float topButtonY = 100;
        float secondButtonY = topButtonY + topButtonHeight;
        float bottomButtonY = secondButtonY + middleButtonHeight;
                
        
        self.userInteractionEnabled=YES;
        
        // single button
        singleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [singleButton setTitle:toSingleGame forState:UIControlStateNormal];
        [singleButton setBackgroundImage:[UIImage imageNamed:@"button_top.png"] forState:UIControlStateNormal];
        [singleButton setBackgroundImage:[UIImage imageNamed:@"button_top_pressed.png"] forState:UIControlStateHighlighted];
        singleButton.frame = CGRectMake(xCoord,topButtonY, buttonPictureWidth, topButtonHeight);

        [singleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:singleButton];
        
        // double button
        doubleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [doubleButton setTitle:toDoubleGame forState:UIControlStateNormal];
        [doubleButton setBackgroundImage:[UIImage imageNamed:@"button_middle_neutral.png"] forState:UIControlStateNormal];
        [doubleButton setBackgroundImage:[UIImage imageNamed:@"button_middle_pressed.png"] forState:UIControlStateHighlighted];
        doubleButton.frame = CGRectMake(xCoord, secondButtonY, buttonPictureWidth, middleButtonHeight);
        [doubleButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:doubleButton];
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_neutral.png"] forState:UIControlStateNormal];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"button_bottom_pressed.png"] forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(xCoord, bottomButtonY, buttonPictureWidth, bottomButtonHeight);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"button_border_3.png"]];
        highlights.frame = CGRectMake(xCoord,topButtonY,252,192);
        [self addSubview:highlights];
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
