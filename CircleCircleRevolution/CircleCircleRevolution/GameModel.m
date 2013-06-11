//
//  GameModel.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

-(id)init
{
    score = 0;
    percentChange = 0.1;
    problemsCorrect = 0;
    return self;
}

-(void)incrementScore:(int)increment
{
    score += increment;
    problemsCorrect += 1;
}

-(int)getScore
{
    return score;
}

-(float)calculateSpeed
{
    if (problemsCorrect % 3 == 0 && problemsCorrect != 0 && percentChange < 0.5)
    {
        percentChange += .2;
    }
    return percentChange;
}

@end
