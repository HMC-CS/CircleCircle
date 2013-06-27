//
//  ScoreView.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "ScoreView.h"
#import "Config.h"

@implementation ScoreView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        // stars background
        UIImageView* bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scoreBg.png"]];
        [self addSubview:bg];
        
        // Twinkling stars
        UIEffectDesignerView* twinklingStars = [UIEffectDesignerView effectWithFile:@"starTwinkle.ped"];
        [self addSubview:twinklingStars];
        
        UIImageView* scoreScreen = [[UIImageView alloc] initWithImage:scoreScreenImage];
        scoreScreen.frame = CGRectMake(27, 18, scoreScreenImage.size.width, scoreScreenImage.size.height);
        scoreScreen.userInteractionEnabled=YES;
        [self addSubview:scoreScreen];
             
        
        self.userInteractionEnabled=YES;
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.titleLabel.font = fontSmallRoundButtons;
        [menuButton setBackgroundImage:smallCircleButtonNormal forState:UIControlStateNormal];
        [menuButton setBackgroundImage:smallCircleButtonPressed forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(circleButtonY,circleButtonY, smallCircleButtonSize, smallCircleButtonSize);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [menuButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [menuButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [menuButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [menuButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [menuButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [menuButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [menuButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
        [scoreScreen addSubview:menuButton];

        float scoreLabelWidth = (scoreScreen.bounds.size.width-scoreMarginX*4)/3;
        float scoreLabelHeight = 200;
        
        subview11 = [[ScoreSubview alloc] initWithFrame:CGRectMake(scoreMarginX,scoreMarginTop,scoreLabelWidth,scoreLabelHeight) andMode:1 andDifficulty:1];
        [scoreScreen addSubview:subview11];
        
        subview12 = [[ScoreSubview alloc] initWithFrame:CGRectMake(scoreMarginX*2+scoreLabelWidth,scoreMarginTop,scoreLabelWidth,scoreLabelHeight) andMode:1 andDifficulty:2];
        [scoreScreen addSubview:subview12];
        
        subview13 = [[ScoreSubview alloc] initWithFrame:CGRectMake(scoreMarginX*3+scoreLabelWidth*2,scoreMarginTop,scoreLabelWidth,scoreLabelHeight) andMode:1 andDifficulty:3];
        [scoreScreen addSubview:subview13];
        
        subview21 = [[ScoreSubview alloc] initWithFrame:CGRectMake(scoreMarginX,scoreMarginTop+scoreMarginBottom+scoreLabelHeight,scoreLabelWidth,scoreLabelHeight) andMode:2 andDifficulty:1];
        [scoreScreen addSubview:subview21];
        
        subview22 = [[ScoreSubview alloc] initWithFrame:CGRectMake(scoreMarginX*2+scoreLabelWidth,scoreMarginTop+scoreMarginBottom+scoreLabelHeight,scoreLabelWidth,scoreLabelHeight) andMode:2 andDifficulty:2];
        [scoreScreen addSubview:subview22];
        
        subview23 = [[ScoreSubview alloc] initWithFrame:CGRectMake(scoreMarginX*3+scoreLabelWidth*2,scoreMarginTop+scoreMarginBottom+scoreLabelHeight,scoreLabelWidth,scoreLabelHeight) andMode:2 andDifficulty:3];
        [scoreScreen addSubview:subview23];
        
        [self updateScoresLabel];
        
        // Title label
        UIImageView* title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HighScores.png"]];
        title.backgroundColor = [UIColor clearColor];
        title.center = CGPointMake(self.bounds.size.height/2, 1.75*title.bounds.size.height);
        [scoreScreen addSubview:title];
    }
    return self;
}

// Protocol for communicating with ScoreViewController, to reach ViewController
-(void) buttonPress:(id)sender
{
    if (self.pressedDelegate){
        [self.pressedDelegate passedButtonPress:sender];
    }
}

-(void) updateScoresLabel
{
    [(ScoreSubview*)subview11 updateScoresAndNames];
    [(ScoreSubview*)subview12 updateScoresAndNames];
    [(ScoreSubview*)subview13 updateScoresAndNames];
    [(ScoreSubview*)subview21 updateScoresAndNames];
    [(ScoreSubview*)subview22 updateScoresAndNames];
    [(ScoreSubview*)subview23 updateScoresAndNames];
}

-(void) pressDown:(id)sender
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
        buttonDownSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonDownURL error:nil];
        [buttonDownSound prepareToPlay];
        [buttonDownSound play];
    }
    UIButton* button = (UIButton*)sender;
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(button.titleEdgeInsets.top+2,0,0,0)];
}

-(void) pressUp:(id)sender
{
   if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
       buttonUpSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonUpURL error:nil];
       [buttonUpSound prepareToPlay];
       [buttonUpSound play];
   }
    UIButton* button = (UIButton*)sender;
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(button.titleEdgeInsets.top-2,0,0,0)];
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
