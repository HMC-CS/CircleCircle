//
//  GameModel.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "GameModel.h"
#import "Config.h"

@implementation GameModel

-(id)init
{
    score = 0;
    percentChange = startingPercentChange;
    problemsCorrect = 0;
    lives = 3;
    backgroundChange = startingBackgroundChange;
    return self;

}

-(void)incrementScore:(int)increment
{
    score += increment;
    if (increment >0){
        problemsCorrect += 1;
        if (problemsCorrect % numProblemCorrectForIncrease == 0 && problemsCorrect != 0 && percentChange < maximumPercentChange)
        {
            percentChange += percentChangeIncrease;
            backgroundChange += backgroundChangeIncrease;
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
