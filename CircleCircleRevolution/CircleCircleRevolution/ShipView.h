//
//  ShipView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleView.h"
#import "FractionView.h"

@interface ShipView : UIImageView
{
    CircleView* circleView;
    FractionView* fractionView;
}

-(void)updateFraction:(NSArray*)currentFraction;
-(void)updateCircle:(float)percent;
-(void)setFeedback:(float)feedbackPercent;

@end
