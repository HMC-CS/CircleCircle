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
    return self;
}


-(NSArray*) getFractionWithMinD:(int) minDenominator andMaxD:(int) maxDenominator
{
    int denominator = (arc4random() % ((maxDenominator +1)-minDenominator)) + minDenominator;
    int numerator = (arc4random() % (denominator -1)) +1;
    
    return [NSArray arrayWithObjects:
            [NSNumber numberWithInteger:numerator],
            [NSNumber numberWithInteger:denominator],
            nil];
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
