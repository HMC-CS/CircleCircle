//
//  FeedbackLinesView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/26/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedbackLinesView : UIView
{
    int denominator;
}

-(id)initWithFrame:(CGRect)frame;
-(void)setDenominator:(int)denom;

@end
