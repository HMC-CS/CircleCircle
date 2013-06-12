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
    int gameMode;
    CircleView* _circleView1;
    CircleView* _circleView2;
    FractionView* fractionView1;
    FractionView* fractionView2;
}

-(id)initWithFrame:(CGRect)frame andMode:(int)mode;
-(void)updateFraction1:(NSArray*)currentFraction1 fraction2:(NSArray*)currentFraction2;
-(void)updateCircle1:(float)percent1 circle2:(float)percent2;
-(void)setFeedback1:(float)feedbackPercent1 feedback2:(float)feedbackPercent2;

@property (strong, nonatomic) CircleView* circleView1;
@property (strong, nonatomic) CircleView* circleView2;


@end
