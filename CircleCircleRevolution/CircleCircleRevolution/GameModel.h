//
//  GameModel.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameModel : NSObject
{
    int score;
    float percentChange;
    int problemsCorrect;
}

-(id)init;
-(void)incrementScore:(int)increment;
-(int)getScore;
-(float)calculateSpeed;

@end
