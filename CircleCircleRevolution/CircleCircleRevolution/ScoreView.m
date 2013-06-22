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
             
        
        self.userInteractionEnabled=YES;
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.titleLabel.font = fontSmallRoundButtons;
        [menuButton setBackgroundImage:smallCircleButtonNormal forState:UIControlStateNormal];
        [menuButton setBackgroundImage:smallCircleButtonPressed forState:UIControlStateHighlighted];
        menuButton.frame = CGRectMake(circleButtonY,circleButtonY, smallCircleButtonSize, smallCircleButtonSize);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.titleLabel.shadowOffset = CGSizeMake(-1,-1);

        [self addSubview:menuButton];
        
        // Scores and the like
        scoresLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.height/2,0,self.bounds.size.height,self.bounds.size.width)];
        scoresLabel.backgroundColor = [UIColor clearColor];
        scoresLabel.textColor = [UIColor whiteColor];
        scoresLabel.numberOfLines = 0;
        scoresLabel.font = fontHighScores;
        [self addSubview:scoresLabel];
        [self updateScoresLabel];
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

-(NSString*)getScoresAndNames
{
    // Get scores array stored in user default
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // Get high scores array from "defaults" object
    NSString* scoresToPrint = @"";
    
    for (int difficulty=1; difficulty<4;difficulty++) {
        for (int mode = 1; mode <3; mode++){
            NSMutableArray *highScores = [NSMutableArray arrayWithArray: [defaults arrayForKey: [[NSString alloc] initWithFormat:@"scores mode:%d diff:%d",mode,difficulty]]];
    NSMutableArray *nameList = [NSMutableArray arrayWithArray: [defaults arrayForKey: [[NSString alloc] initWithFormat:@"names mode:%d diff:%d",mode,difficulty]]];
    scoresToPrint = [scoresToPrint stringByAppendingFormat: @"%d %d\n", mode, difficulty];

    for (int i = 0; i < [nameList count]; i++) {
        int score = [[highScores objectAtIndex: i] intValue];
        NSString* name = [nameList objectAtIndex: i];
        scoresToPrint = [scoresToPrint stringByAppendingFormat: @"%@ %i\n", name, score];
    }
        
        }}
    return scoresToPrint;
}

-(void) updateScoresLabel
{
    scoresLabel.text = [self getScoresAndNames];
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
