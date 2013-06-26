//
//  ScoreSubview.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/25/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreSubview : UIView
{
    UILabel* header;
    UILabel* names;
    UILabel* scores;
    
    int mode;
    int difficulty;
    NSString* modeString;
    NSString* diffString;
}

-(id)initWithFrame:(CGRect)frame andMode:(int)m andDifficulty:(int)d;
-(NSString*)updateScoresAndNames;

@end
