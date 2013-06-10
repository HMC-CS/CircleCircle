//
//  CreditsView.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "CreditsView.h"

@implementation CreditsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blueColor];
        
        self.userInteractionEnabled=YES;
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [menuButton setTitle:@"Menu" forState:UIControlStateNormal];
        menuButton.frame = CGRectMake(50,30, 50, 30);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
    }
    return self;
}

// Protocol for communicating with CreditsViewController, to reach ViewController
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
