//
//  ShipView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "ShipView.h"
#import "Config.h"

@implementation ShipView

- (id)initWithFrame:(CGRect)frame andMode:(int)mode
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        gameMode = mode;
        
        if (gameMode == 1)
        {
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(0,0,self.bounds.size.height,self.bounds.size.height)];
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(200,400,200,200)];
            [self addSubview:circleView1];
            [self addSubview:fractionView1];
        }
        else if (gameMode == 2)
        {
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(0,0,self.bounds.size.width/2,self.bounds.size.width/2)];
            circleView2 = [[CircleView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2,0,self.bounds.size.width/2,self.bounds.size.width/2)];
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(200,400,200,200)];
            fractionView2 = [[FractionView alloc] initWithFrame:CGRectMake(400,400,200,200)];
            [self addSubview:circleView1];
            [self addSubview:circleView2];
            [self addSubview:fractionView1];
            [self addSubview:fractionView2];
        }
    }
    return self;
}

// Updates passed to subviews
-(void) updateFraction1:(NSArray *)currentFraction1 fraction2:(NSArray *)currentFraction2
{
    if (currentFraction1)
    {
        [fractionView1 updateFraction:currentFraction1];
        [circleView1 resetFeedback];
    }
    if (currentFraction2)
    {
        [fractionView2 updateFraction:currentFraction2];
        [circleView2 resetFeedback];
    }
}

-(void)updateCircle1:(float)percent1 circle2:(float)percent2
{
    if (percent1)
    {
        [circleView1 update:percent1];
    }
    if (percent2)
    {
        [circleView2 update:percent2];
    }
}

-(void)setFeedback1:(float)feedbackPercent1 feedback2:(float)feedbackPercent2
{
    
    if (feedbackPercent1 == 0)
    {
        [circleView1 resetFeedback];
    }
    else if (feedbackPercent1>0)
    {
        [circleView1 setFeedback:feedbackPercent1];
    }
    
    
    if (feedbackPercent2 == 0)
    {
        [circleView2 resetFeedback];
    }
    else if (feedbackPercent2>0)
    {
        [circleView2 setFeedback:feedbackPercent2];
    }
}

-(void) setCircleTarget:(id)sender forAction:(SEL)action whichCircle:(int)circleNumber
{
    if (circleNumber ==1)
    {
        [circleView1 setCircleTarget:sender forAction:action];
    }
    if (circleNumber ==2)
    {
        [circleView2 setCircleTarget:sender forAction:action];
    }
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
