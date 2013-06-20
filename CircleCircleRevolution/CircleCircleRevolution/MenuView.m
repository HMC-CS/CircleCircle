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
        // Configuration Constants
        float xCoord = self.bounds.size.width/2;
        float highlightsHeight = 251;
        
        // stars background
        UIImageView* bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menuBg.png"]];
        [self addSubview:bg];
        
        // Twinkling stars
        UIEffectDesignerView* twinklingStars = [UIEffectDesignerView effectWithFile:@"starTwinkle.ped"];
        [self addSubview:twinklingStars];
        
        
        // Initialization code
        self.userInteractionEnabled=YES;
        
        // Title
        title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title.png"]];
        title.backgroundColor = [UIColor clearColor];
        title.frame = CGRectMake((kScreenWidth-title.image.size.width)/2,(kScreenHeight-title.image.size.height)/4,title.image.size.width,title.image.size.height);
        [self addSubview:title];
        
        // Game button
        gameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [gameButton setTitle:toSelectionScreen forState:UIControlStateNormal];
        [gameButton setBackgroundImage:topRectButtonNormal forState:UIControlStateNormal];
        [gameButton setBackgroundImage:topRectButtonPressed forState:UIControlStateHighlighted];
        gameButton.frame = CGRectMake(xCoord,topButtonY, rectButtonWidth, rectTopButtonHeight);
        [gameButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:gameButton];
        
        // Instructions button
        instructionsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [instructionsButton setTitle:toInstructions forState:UIControlStateNormal];
        [instructionsButton setBackgroundImage:midRectButtonNormal forState:UIControlStateNormal];
        [instructionsButton setBackgroundImage:midRectButtonPressed forState:UIControlStateHighlighted];
        instructionsButton.frame = CGRectMake(xCoord, secondButtonY, rectButtonWidth, rectMiddleButtonHeight);
        [instructionsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:instructionsButton];
        
        // Score button
        scoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [scoreButton setTitle:toHighScores forState:UIControlStateNormal];
        [scoreButton setBackgroundImage:midRectButtonNormal forState:UIControlStateNormal];
        [scoreButton setBackgroundImage:midRectButtonPressed forState:UIControlStateHighlighted];
        scoreButton.frame = CGRectMake(xCoord, thirdButtonY, rectButtonWidth, rectMiddleButtonHeight);
        [scoreButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:scoreButton];
        
        // Credits button
        creditsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [creditsButton setTitle:toCredits forState:UIControlStateNormal];
        [creditsButton setBackgroundImage:bottomRectButtonNormal forState:UIControlStateNormal];
        [creditsButton setBackgroundImage:bottomRectButtonPressed forState:UIControlStateHighlighted];
        creditsButton.frame = CGRectMake(xCoord, bottomButtonY, rectButtonWidth, rectBottomButtonHeight);
        [creditsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:creditsButton];
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:highlight4];
        highlights.frame = CGRectMake(xCoord,topButtonY,rectButtonWidth,highlightsHeight);
        [self addSubview:highlights];
        
         
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
