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
@synthesize circleView1 = _circleView1;
@synthesize circleView2 = _circleView2;


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
            _circleView1 = [[CircleView alloc] initWithFrame:self.bounds];
            fractionView1 = [[FractionView alloc] init];//WithFrame:CGRectMake(200,400,200,200)];
            [self addSubview:_circleView1];
            [self addSubview:fractionView1];
        }
        else if (gameMode == 2)
        {
            _circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(0,0,self.bounds.size.width/2,self.bounds.size.height)];
            _circleView2 = [[CircleView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2,0,self.bounds.size.width/2,self.bounds.size.height)];
            fractionView1 = [[FractionView alloc] init];//WithFrame:CGRectMake(200,400,200,200)];
            fractionView2 = [[FractionView alloc] init];//WithFrame:CGRectMake(400,400,200,200)];
            [self addSubview:_circleView1];
            [self addSubview:_circleView2];
            [self addSubview:fractionView1];
            [self addSubview:fractionView2];
        }
        
        
    }
    return self;
}

-(void) updateFraction1:(NSArray *)currentFraction1 fraction2:(NSArray *)currentFraction2
{
    if (currentFraction1)
    {
        [fractionView1 updateFraction:currentFraction1];
        [_circleView1 resetFeedback];
    }
    if (currentFraction2)
    {
        [fractionView2 updateFraction:currentFraction2];
        [_circleView2 resetFeedback];
    }
}

-(void)updateCircle1:(float)percent1 circle2:(float)percent2
{
    if (percent1)
    {
        [_circleView1 update:percent1];
    }
    if (percent2)
    {
        [_circleView2 update:percent2];
    }
}

-(void)setFeedback1:(float)feedbackPercent1 feedback2:(float)feedbackPercent2
{
    
    if (feedbackPercent1 == 0)
    {
        [_circleView1 resetFeedback];
    }
    else if (feedbackPercent1)
    {
        [_circleView1 setFeedback:feedbackPercent1];
    }
    if (feedbackPercent2 == 0)
    {
        [_circleView2 resetFeedback];
    }
    if (feedbackPercent2)
    {
        [_circleView2 setFeedback:feedbackPercent2];
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
