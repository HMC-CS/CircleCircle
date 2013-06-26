//
//  FractionModel.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "FractionModel.h"

@implementation FractionModel

-(id) init
{
    lastFraction = [NSArray arrayWithObjects:nil];
    return self;
}


-(NSArray*) getFractionWithMinD:(int) minDenominator andMaxD:(int) maxDenominator
{
    int denominator = (arc4random() % ((maxDenominator +1)-minDenominator)) + minDenominator;
    int numerator = (arc4random() % (denominator -1)) +1;
    
    NSArray* newFraction = [NSArray arrayWithObjects:
                            [NSNumber numberWithInteger:numerator],
                            [NSNumber numberWithInteger:denominator],
                            nil];
    
    if ([newFraction isEqualToArray:lastFraction])
    {
        return [self getFractionWithMinD:minDenominator andMaxD:maxDenominator];
    }
    else
    {
        lastFraction = newFraction;
        return newFraction;
    }
}

-(NSArray*) getFractionGivenDifficulty:(int)difficulty
{
    if (difficulty == 1){
        return [self getFractionWithMinD:2 andMaxD:4];
    }else if (difficulty ==2){
        return [self getFractionWithMinD:2 andMaxD:8];
    }else{
        return [self getFractionWithMinD:2 andMaxD:12];
    }
}

@end
