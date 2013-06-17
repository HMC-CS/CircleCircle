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
        self.backgroundColor = [UIColor greenColor];
        
        self.userInteractionEnabled=YES;
        
        // Menu button
        menuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [menuButton setTitle:toMainMenu forState:UIControlStateNormal];
        menuButton.frame = CGRectMake(hsMainMenuButtonX,hsMainMenuButtonY, buttonWidth, buttonHeight);
        [menuButton addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:menuButton];
        
        // Scores and the like
        scoresLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,self.bounds.size.height,self.bounds.size.width)];
        scoresLabel.backgroundColor = [UIColor clearColor];
        scoresLabel.numberOfLines = 0;
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
    NSMutableArray *highScores = [NSMutableArray arrayWithArray: [defaults arrayForKey: @"scores"]];
    NSMutableArray *nameList = [NSMutableArray arrayWithArray: [defaults arrayForKey: @"names"]];
    
    NSString* scoresToPrint = @"";
    for (int i = 0; i < [nameList count]; i++) {
        int score = [[highScores objectAtIndex: i] intValue];
        NSString* name = [nameList objectAtIndex: i];
        scoresToPrint = [scoresToPrint stringByAppendingFormat: @"%@ %i\n", name, score];
    }
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
