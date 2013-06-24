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
        
        float scoreLabelHeight = (self.bounds.size.width-circleButtonY-smallCircleButtonSize)/2;
        float scoreLabelWidth = self.bounds.size.height/3;
        float startingYLabelPos = circleButtonY+smallCircleButtonSize;
        
        // Scores and the like
        scoresLabel11 = [[UILabel alloc] initWithFrame:CGRectMake(0,startingYLabelPos,scoreLabelWidth,scoreLabelHeight)];
        [scoresLabel11 setTextAlignment:NSTextAlignmentCenter];
        scoresLabel11.backgroundColor = [UIColor clearColor];
        scoresLabel11.textColor = [UIColor whiteColor];
        scoresLabel11.numberOfLines = 0;
        scoresLabel11.font = fontHighScores;
        [self addSubview:scoresLabel11];
        
        scoresLabel12 = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabelWidth,startingYLabelPos,scoreLabelWidth,scoreLabelHeight)];
        [scoresLabel12 setTextAlignment:NSTextAlignmentCenter];
        scoresLabel12.backgroundColor = [UIColor clearColor];
        scoresLabel12.textColor = [UIColor whiteColor];
        scoresLabel12.numberOfLines = 0;
        scoresLabel12.font = fontHighScores;
        [self addSubview:scoresLabel12];
        
        scoresLabel13 = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabelWidth*2,startingYLabelPos,scoreLabelWidth,scoreLabelHeight)];
        [scoresLabel13 setTextAlignment:NSTextAlignmentCenter];
        scoresLabel13.backgroundColor = [UIColor clearColor];
        scoresLabel13.textColor = [UIColor whiteColor];
        scoresLabel13.numberOfLines = 0;
        scoresLabel13.font = fontHighScores;
        [self addSubview:scoresLabel13];
        
        scoresLabel21 = [[UILabel alloc] initWithFrame:CGRectMake(0,startingYLabelPos+scoreLabelHeight,scoreLabelWidth,scoreLabelHeight)];
        [scoresLabel21 setTextAlignment:NSTextAlignmentCenter];
        scoresLabel21.backgroundColor = [UIColor clearColor];
        scoresLabel21.textColor = [UIColor whiteColor];
        scoresLabel21.numberOfLines = 0;
        scoresLabel21.font = fontHighScores;
        [self addSubview:scoresLabel21];

        scoresLabel22 = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabelWidth,startingYLabelPos+scoreLabelHeight,scoreLabelWidth,scoreLabelHeight)];
        [scoresLabel22 setTextAlignment:NSTextAlignmentCenter];
        scoresLabel22.backgroundColor = [UIColor clearColor];
        scoresLabel22.textColor = [UIColor whiteColor];
        scoresLabel22.numberOfLines = 0;
        scoresLabel22.font = fontHighScores;
        [self addSubview:scoresLabel22];

        scoresLabel23 = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabelWidth*2,startingYLabelPos+scoreLabelHeight,scoreLabelWidth,scoreLabelHeight)];
        [scoresLabel23 setTextAlignment:NSTextAlignmentCenter];
        scoresLabel23.backgroundColor = [UIColor clearColor];
        scoresLabel23.textColor = [UIColor whiteColor];
        scoresLabel23.numberOfLines = 0;
        scoresLabel23.font = fontHighScores;
        [self addSubview:scoresLabel23];

        [self updateScoresLabel];
        
        // Title label
        UIImageView* title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HighScores.png"]];
        title.backgroundColor = [UIColor clearColor];
        title.center = CGPointMake(self.bounds.size.height/2, 1.5*title.bounds.size.height);
        [self addSubview:title];
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

-(NSString*)getScoresAndNamesForMode:(int)mode andDifficulty:(int)difficulty
{
    // Get scores array stored in user default
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // Get high scores array from "defaults" object
    NSString* scoresToPrint = @"";
            NSMutableArray *highScores = [NSMutableArray arrayWithArray: [defaults arrayForKey: [[NSString alloc] initWithFormat:@"scores mode:%d diff:%d",mode,difficulty]]];
            NSMutableArray *nameList = [NSMutableArray arrayWithArray: [defaults arrayForKey: [[NSString alloc] initWithFormat:@"names mode:%d diff:%d",mode,difficulty]]];
            //scoresToPrint = [scoresToPrint stringByAppendingFormat: @"%d %d\n", mode, difficulty];
    scoresToPrint = @"Double Medium\n";
    for (int i = 0; i < [nameList count]; i++) {
                int score = [[highScores objectAtIndex: i] intValue];
                NSString* name = [nameList objectAtIndex: i];
        if ([name length] >15){
            name = [name substringToIndex:15];
        }
                scoresToPrint = [scoresToPrint stringByAppendingFormat: @"%@ %i\n", name, score];
            }
    return scoresToPrint;
}

-(void) updateScoresLabel
{
    scoresLabel11.text = [self getScoresAndNamesForMode:1 andDifficulty:1];
    scoresLabel12.text = [self getScoresAndNamesForMode:1 andDifficulty:2];
    scoresLabel13.text = [self getScoresAndNamesForMode:1 andDifficulty:3];
    scoresLabel21.text = [self getScoresAndNamesForMode:2 andDifficulty:1];
    scoresLabel22.text = [self getScoresAndNamesForMode:2 andDifficulty:2];
    scoresLabel23.text = [self getScoresAndNamesForMode:2 andDifficulty:3];
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
