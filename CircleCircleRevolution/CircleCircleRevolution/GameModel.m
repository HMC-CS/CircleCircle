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
    lives = 3;
    backgroundChange = 1.0;
    return self;

}

-(void)incrementScore:(int)increment
{
    score += increment;
    if (increment >0){
        problemsCorrect += 1;
        if (problemsCorrect % 3 == 0 && problemsCorrect != 0 && percentChange < 0.5)
        {
            percentChange += .2;
            backgroundChange += 5;
        }

    }
}

-(int)getScore
{
    return score;
}

-(float)calculateSpeed
{
    return percentChange;
}

-(void) increaseLife
{
    lives ++;
}

-(void) decreaseLife
{
    lives --;
}

-(int)getLives
{
    return lives;
}

-(float)getBackgroundChange
{
    return backgroundChange;
}

@end
