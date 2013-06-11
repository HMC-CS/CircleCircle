//
//  ShipView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "ShipView.h"

@implementation ShipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        
        fractionView = [[FractionView alloc] init];
        [self addSubview:fractionView];
        
        circleView = [[CircleView alloc] initWithFrame:self.bounds];
        [self addSubview:circleView];
        
        
    }
    return self;
}

-(void) updateFraction:(NSArray *)currentFraction
{
    [fractionView updateFraction:currentFraction];
}

-(void)updateCircle:(float)percent
{
    [circleView update:percent];
}
-(void)setFeedback:(float)feedbackPercent
{
    [circleView setFeedback:feedbackPercent];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
