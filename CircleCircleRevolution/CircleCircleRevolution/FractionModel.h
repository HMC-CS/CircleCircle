//
//  FractionModel.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FractionModel : NSObject
{
    NSArray* lastFraction;
    
}

-(id) init;
-(NSArray*) getFractionWithMinD:(int) minDenominator andMaxD:(int) maxDenominator;

-(NSArray*) getFractionGivenDifficulty:(int)difficulty;

@end
