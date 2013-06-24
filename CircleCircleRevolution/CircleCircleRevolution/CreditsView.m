//
//  CreditsView.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "CreditsView.h"
#import "Config.h"

@implementation CreditsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        // stars background
        UIImageView* bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"creditsBg.png"]];
        [self addSubview:bg];
        
        // Twinkling stars
        UIEffectDesignerView* twinklingStars = [UIEffectDesignerView effectWithFile:@"starTwinkle.ped"];
        [self addSubview:twinklingStars];
        
        
        self.userInteractionEnabled=YES;
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.titleLabel.font = fontSmallRoundButtons;
        [menuButton setBackgroundImage:smallCircleButtonNormal forState:UIControlStateNormal];
        [menuButton setBackgroundImage:smallCircleButtonPressed forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(circleButtonX,circleButtonY, smallCircleButtonSize, smallCircleButtonSize);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.titleLabel.shadowOffset = CGSizeMake(-1,-1);

        [self addSubview:menuButton];
        
        // Get the file from the resources
        NSString* path = [[NSBundle mainBundle] pathForResource:@"credits" ofType:@"txt"];
        NSAssert(path!=nil, @"credits.txt not found. Failed to load Instructions screen");
        NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        // Create the label
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0,150,self.bounds.size.height,600)];
        label.text = fileContents;
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        label.numberOfLines = 0;
        label.font = fontCredits;
        label.shadowColor=[UIColor blackColor];
        label.shadowOffset = CGSizeMake(-1,-1);
        [self addSubview:label];
        
        // Title label
        UILabel* title = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.height/2-200,0,400,500)];
        [title setTextAlignment:NSTextAlignmentCenter];
        title.text = @"Credits";
        title.textColor = [UIColor whiteColor];
        title.font = fontTitles;
        title.shadowOffset = CGSizeMake(-1,-1);
        title.shadowColor = [UIColor blackColor];
        title.backgroundColor = [UIColor clearColor];
        [title sizeToFit];
        title.center = CGPointMake(self.bounds.size.height/2,1.5*title.bounds.size.height);
        [self addSubview:title];

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
