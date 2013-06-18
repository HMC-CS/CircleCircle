//
//  GameScoreView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameScoreView : UIImageView
{
    UILabel* scoreLabel;
    UIImageView* scoreBg;
}

-(void) updateScore:(int)score;

@end
