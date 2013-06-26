//
//  GameView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "GameView.h"
#import "Config.h"

@implementation GameView

- (id)initWithFrame:(CGRect)frame andMode:(int)mode
{
    self = [super initWithFrame:frame];
    if (self) {
        // Configuration Constants
        float xCoord = self.bounds.size.width/2  - rectButtonWidth/2;
        float highlightsHeight = 134;
        
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        
               
        // Pause Screen
        pauseView = [[UIImageView alloc] initWithImage:pauseScreenImage];
        pauseView.frame = CGRectMake(pauseScreenXOffset,pauseScreenYOffset,pauseScreenImage.size.width,pauseScreenImage.size.height);
        pauseView.backgroundColor = [UIColor clearColor];
        pauseView.userInteractionEnabled = YES;

        
        // Menu button - on pause screen
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.titleLabel.font = fontRectButtons;
        [menuButton setBackgroundImage:bottomRectButtonNormal forState:UIControlStateNormal];
        [menuButton setBackgroundImage:bottomRectButtonPressed forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(xCoord-pauseScreenXOffset, secondButtonY, rectButtonWidth, rectBottomButtonHeight);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [menuButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [menuButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [menuButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [menuButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [menuButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [menuButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [menuButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];

        
        // Resume button - on pause screen
        resumeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [resumeButton setTitle:resumeGame forState:UIControlStateNormal];
        resumeButton.titleLabel.font = fontRectButtons;
        [resumeButton setBackgroundImage:topRectButtonNormal forState:UIControlStateNormal];

        [resumeButton setBackgroundImage:topRectButtonPressed forState:UIControlStateHighlighted];
        resumeButton.frame = CGRectMake(xCoord-pauseScreenXOffset,topButtonY, rectButtonWidth, rectTopButtonHeight);
        [resumeButton addTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchUpInside];
        resumeButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [resumeButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [resumeButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [resumeButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [resumeButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [resumeButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [resumeButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [resumeButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView* highlights = [[UIImageView alloc] initWithImage:highlight2];
        highlights.frame = CGRectMake(xCoord-pauseScreenXOffset,topButtonY,rectButtonWidth,highlightsHeight);
        
        UIImageView* pauseTitle = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"PauseText.png"]];
        pauseTitle.center = CGPointMake(pauseView.bounds.size.width/2,250);
        
        [pauseView addSubview:pauseTitle];
        [pauseView addSubview:menuButton];
        [pauseView addSubview:resumeButton];
        [pauseView addSubview:highlights];
        pauseView.alpha = 0;
        
        
        // Boost button
        boostButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [boostButton setTitle:speedBoost forState:UIControlStateNormal];
        boostButton.titleLabel.font = fontLargeRoundButtons;
        boostButton.frame = CGRectMake(gameLeftButtonX,gameBoostY,largeCircleButtonSize,largeCircleButtonSize);
        [boostButton setBackgroundImage:largeCircleButtonNormal forState:UIControlStateNormal];
        [boostButton setBackgroundImage:largeCircleButtonNormal forState:UIControlStateDisabled];
        [boostButton setBackgroundImage:largeCircleButtonPressed forState:UIControlStateHighlighted];
        [boostButton addTarget:self action:@selector(unboost) forControlEvents:UIControlEventTouchUpInside];
        [boostButton addTarget:self action:@selector(unboost) forControlEvents:UIControlEventTouchDragExit];
        [boostButton addTarget:self action:@selector(boost) forControlEvents:UIControlEventTouchDown];
        [boostButton addTarget:self action:@selector(boost) forControlEvents:UIControlEventTouchDragEnter];
        boostButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [boostButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [boostButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [boostButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [boostButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [boostButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [boostButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [boostButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];

        
        
        // Pause button
        pauseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [pauseButton setTitle:pauseGame forState:UIControlStateNormal];
        pauseButton.titleLabel.font = fontSmallRoundButtons;
        pauseButton.frame = CGRectMake(gameLeftButtonX,gamePauseY,smallCircleButtonSize,smallCircleButtonSize);
        [pauseButton setBackgroundImage:smallCircleButtonNormal forState:UIControlStateNormal];
        [pauseButton setBackgroundImage:smallCircleButtonNormal forState:UIControlStateDisabled];
        [pauseButton setBackgroundImage:smallCircleButtonPressed forState:UIControlStateHighlighted];
        [pauseButton addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
        pauseButton.titleLabel.shadowOffset = CGSizeMake(1,1);
        [pauseButton setTitleColor:buttonFontNormalColor forState:UIControlStateNormal];
        [pauseButton setTitleColor:buttonFontPressedColor forState:UIControlStateHighlighted];
        [pauseButton setTitleShadowColor:buttonFontShadowColor forState:UIControlStateNormal];
        [pauseButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
        [pauseButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDragEnter];
        [pauseButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchDragExit];
        [pauseButton addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
        
        // Ship view
        if (mode == 1)
            shipView = [[ShipView alloc] initWithFrame:CGRectMake(sgShipXOffset,sgShipYOffset,shipWidth,shipHeight) andMode:mode];
        else if (mode == 2)
            shipView = [[ShipView alloc] initWithFrame:CGRectMake(dgShipXOffset,dgShipYOffset,shipWidth,shipHeight) andMode:mode];
        shipView.backgroundColor = [UIColor clearColor];
        
        // Score view
        gameScoreView = [[GameScoreView alloc] initWithFrame:CGRectMake(gameScoreX, gameScoreY, gameScoreWidth, gameScoreHeight)];
        
        // Life View
        lifeView = [[LifeView alloc] initWithFrame:CGRectMake(lifeXOffset, lifeYOffset, lifeWidth, lifeHeight)];
        
        
        [self addSubview:pauseView];
        [self sendSubviewToBack:pauseView];
        [self addSubview:pauseButton];
        [self addSubview:shipView];
        [self addSubview:gameScoreView];
        [self addSubview:lifeView];
        [self addSubview:boostButton];

    }
    return self;
}

// Updates passed down to subviews
-(void) updateFraction1:(NSArray *)currentFraction1 fraction2:(NSArray *)currentFraction2
{
    [shipView updateFraction1:currentFraction1 fraction2:currentFraction2];
}

-(void) updateCircle1:(float)percent1 circle2:(float)percent2
{
    [shipView updateCircle1:percent1 circle2:percent2];
}

-(void) updateScore:(int)score
{
    [gameScoreView updateScore:score];
}

-(void) updateLife:(int)lives
{
    [lifeView updateLife:lives];
}

-(void)setFeedback1:(float)feedbackPercent1 feedback2:(float)feedbackPercent2
{
    [shipView setFeedback1:feedbackPercent1 feedback2:feedbackPercent2];
}

// Protocol for communicating with GameViewController, to reach ViewController
-(void) buttonPress:(id)sender
{
    if (self.pressedDelegate){
        [self.pressedDelegate passedButtonPress:sender];
    }
}

// Protocol for pausing and resuming game
-(void) pause
{
    [self bringSubviewToFront:pauseView];
    pauseView.alpha = 1;
    [self.pressedDelegate gamePause];
    [shipView pause];
    [self disableBoost];
    [self disablePause];
}

-(void) resume
{
    [self sendSubviewToBack:pauseView];
    pauseView.alpha = 0;
    [self.pressedDelegate gameResume];
    [shipView resume];
    [self enablePause];
    boostButton.enabled=YES;
}

-(void) boost
{
    [self.pressedDelegate boost];
    // change ship as needed
    [shipView boost];
}

-(void) unboost
{
    [self.pressedDelegate unboost];
    [shipView unboost];
}


-(void) setCircleTarget:(id)sender forAction:(SEL)action whichCircle:(int)circleNumber
{
    [shipView setCircleTarget:sender forAction:action whichCircle:circleNumber];
}

-(void) disablePause
{
    pauseButton.enabled = NO;
}

-(void) enablePause
{
    pauseButton.enabled = YES;
}

-(void) disableBoost
{
    boostButton.enabled = NO;
}

-(void)showGlowOnCircle:(int)circleNum isCorrect:(BOOL)isRight
{
    [shipView showGlowOnCircle:circleNum isCorrect:isRight];
}

-(void) showFeedback:(NSString*)feedbackTerm onCircleNumber:(int)circleNum
{
    [shipView showFeedback:feedbackTerm onCircleNumber:circleNum];
}

-(void) pressDown:(id)sender
{
    buttonDownSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonDownURL error:nil];
    [buttonDownSound prepareToPlay];
    [buttonDownSound play];
    UIButton* button = (UIButton*)sender;
    [sender setTitleEdgeInsets:UIEdgeInsetsMake(button.titleEdgeInsets.top+2,0,0,0)];
}

-(void) pressUp:(id)sender
{
    buttonUpSound = [[AVAudioPlayer alloc] initWithContentsOfURL:buttonUpURL error:nil];
    [buttonUpSound prepareToPlay];
    [buttonUpSound play];
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
