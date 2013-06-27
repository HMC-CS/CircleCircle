//
//  ScoreSubview.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/25/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "ScoreSubview.h"
#import "Config.h"

@implementation ScoreSubview

- (id)initWithFrame:(CGRect)frame andMode:(int)m andDifficulty:(int)d
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        mode = m;
        difficulty = d;
        [self getModeAndDiffStrings];
        
        header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height/4)];
        [header setTextAlignment:NSTextAlignmentCenter];
        header.backgroundColor = [UIColor clearColor];
        header.textColor = [UIColor whiteColor];
        header.font = fontHighScoresL;
        header.text = [[NSString alloc] initWithFormat:@"%@ - %@",modeString,diffString];
        [self addSubview:header];
        
        names = [[UILabel alloc] initWithFrame:CGRectMake(0, header.bounds.size.height,self.bounds.size.width*2/3,self.bounds.size.height*3/4)];
        [names setTextAlignment:NSTextAlignmentLeft];
        names.backgroundColor = [UIColor clearColor];
        names.textColor = [UIColor whiteColor];
        names.font = fontHighScoresS;
        names.text = @"";
        names.numberOfLines = 0;
        [self addSubview:names];
        
        scores = [[UILabel alloc] initWithFrame:CGRectMake(0, header.bounds.size.height, self.bounds.size.width,self.bounds.size.height*3/4)];
        [scores setTextAlignment:NSTextAlignmentRight];
        scores.backgroundColor = [UIColor clearColor];
        scores.textColor = [UIColor whiteColor];
        scores.font = fontHighScoresS;
        scores.text = @"";
        scores.numberOfLines = 0;
        [self addSubview:scores];
    }
    return self;
}

-(void)getModeAndDiffStrings
{
    if (mode == 1)
        modeString = @"Single";
    else if (mode == 2)
        modeString = @"Double";
    
    if (difficulty == 1)
        diffString = @"Easy";
    else if (difficulty == 2)
        diffString = @"Medium";
    else if (difficulty == 3)
        diffString = @"Hard";
    
    return;
}

-(NSString*)updateScoresAndNames
{
    // empty score strings
    names.text = @"";
    scores.text = @"";
    
    // Get scores array stored in user default
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray* highScores = [NSMutableArray arrayWithArray: [defaults arrayForKey: [[NSString alloc] initWithFormat:@"scores mode:%d diff:%d",mode,difficulty]]];
    NSMutableArray *nameList = [NSMutableArray arrayWithArray: [defaults arrayForKey: [[NSString alloc] initWithFormat:@"names mode:%d diff:%d",mode,difficulty]]];
    
    for (int i = 0; i < [nameList count]; i++) {
        int score = [[highScores objectAtIndex: i] intValue];
        NSString* name = [nameList objectAtIndex: i];
        names.text = [names.text stringByAppendingFormat: @"%@\n", name];
        scores.text = [scores.text stringByAppendingFormat: @"%i\n", score];
    }
    
    
    // Get high scores array from "defaults" object
    NSString* scoresToPrint = @"";
    //scoresToPrint = [scoresToPrint stringByAppendingFormat: @"%d %d\n", mode, difficulty];
    scoresToPrint = @"Double Medium\n";
    for (int i = 0; i < [nameList count]; i++) {
        int score = [[highScores objectAtIndex: i] intValue];
        NSString* name = [nameList objectAtIndex: i];
        if ([name length] >10){
            name = [name substringToIndex:10];
        }
        scoresToPrint = [scoresToPrint stringByAppendingFormat: @"%@ %i\n", name, score];
    }
    return scoresToPrint;
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
