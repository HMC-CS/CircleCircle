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
        float highlightsHeight = 252;
        
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
        gameButton.titleLabel.font = fontRectButtons;
        [gameButton setBackgroundImage:topRectButtonNormal forState:UIControlStateNormal];
        [gameButton setBackgroundImage:topRectButtonPressed forState:UIControlStateHighlighted];
        gameButton.frame = CGRectMake(xCoord,topButtonY, rectButtonWidth, rectTopButtonHeight);
        [gameButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        gameButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [gameButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [gameButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [gameButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [gameButton setTitleEdgeInsets:UIEdgeInsetsMake(10,0,0,0)];
        [gameButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [gameButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [gameButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [gameButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:gameButton];
        
        // Instructions button
        instructionsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [instructionsButton setTitle:toInstructions forState:UIControlStateNormal];
        instructionsButton.titleLabel.font = fontRectButtons;
        [instructionsButton setBackgroundImage:midRectButtonNormal forState:UIControlStateNormal];
        [instructionsButton setBackgroundImage:midRectButtonPressed forState:UIControlStateHighlighted];
        instructionsButton.frame = CGRectMake(xCoord, secondButtonY, rectButtonWidth, rectMiddleButtonHeight);
        [instructionsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        instructionsButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [instructionsButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [instructionsButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [instructionsButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [instructionsButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [instructionsButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [instructionsButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [instructionsButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:instructionsButton];
        
        // Score button
        scoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [scoreButton setTitle:toHighScores forState:UIControlStateNormal];
        scoreButton.titleLabel.font = fontRectButtons;
        [scoreButton setBackgroundImage:midRectButtonNormal forState:UIControlStateNormal];
        [scoreButton setBackgroundImage:midRectButtonPressed forState:UIControlStateHighlighted];
        scoreButton.frame = CGRectMake(xCoord, thirdButtonY, rectButtonWidth, rectMiddleButtonHeight);
        [scoreButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        scoreButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [scoreButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [scoreButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [scoreButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [scoreButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [scoreButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [scoreButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [scoreButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:scoreButton];
        
        // Credits button
        creditsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [creditsButton setTitle:toCredits forState:UIControlStateNormal];
        creditsButton.titleLabel.font = fontRectButtons;
        [creditsButton setBackgroundImage:bottomRectButtonNormal forState:UIControlStateNormal];
        [creditsButton setBackgroundImage:bottomRectButtonPressed forState:UIControlStateHighlighted];
        creditsButton.frame = CGRectMake(xCoord, bottomButtonY, rectButtonWidth, rectBottomButtonHeight);
        [creditsButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        creditsButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [creditsButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [creditsButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [creditsButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [creditsButton setTitleEdgeInsets:UIEdgeInsetsMake(-10,0,0,0)];
        [creditsButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [creditsButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [creditsButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [creditsButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:creditsButton];
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:highlight4];
        highlights.frame = CGRectMake(xCoord,topButtonY,rectButtonWidth,highlightsHeight);
        [self addSubview:highlights];
        
        // Sound button
        soundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [soundButton setBackgroundImage:[UIImage imageNamed:@"audioIconGrayL.png"] forState:UIControlStateNormal];

        soundButton.frame = CGRectMake(25,25,50,50);
        //[soundButton setTitle:@"Sound" forState:UIControlStateNormal];
        [soundButton addTarget:self action:@selector(sound) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:soundButton];
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

-(void) pressDown:(id)sender
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"])
    {
        buttonDownSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonDownURL error:nil];
        [buttonDownSound prepareToPlay];
        [buttonDownSound play];
    }
    UIButton* button = (UIButton*)sender;
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(button.titleEdgeInsets.top+2,0,0,0)];
}

-(void) pressUp:(id)sender
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"])
    {
        buttonUpSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonUpURL error:nil];
        [buttonUpSound prepareToPlay];
        [buttonUpSound play];
    }
    UIButton* button = (UIButton*)sender;
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(button.titleEdgeInsets.top-2,0,0,0)];
}

-(void) sound
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
        [soundButton setBackgroundImage:[UIImage imageNamed:@"muteIconGrayL.png"] forState:UIControlStateNormal];}
    else{ 
        [soundButton setBackgroundImage:[UIImage imageNamed:@"audioIconGrayL.png"] forState:UIControlStateNormal];
    }
    
    
    if (self.pressedDelegate)
        [self.pressedDelegate soundButtonPressed];
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
