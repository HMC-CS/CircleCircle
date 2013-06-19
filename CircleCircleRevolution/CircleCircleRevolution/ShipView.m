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
            shipBody = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ship_body_single.png"]];
            shipBody.frame = CGRectMake(0, 0, shipBody.image.size.width, shipBody.image.size.height);
            shipBody.backgroundColor = [UIColor clearColor];
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(174,67,320,320)];
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(223,398,220,194) andImage:@"ship_fraction_single.png"];
            [self addSubview:circleView1];
            [self addSubview:fractionView1];
            [self addSubview:shipBody];
        }
        else if (gameMode == 2)
        {
            shipBody = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ship_body_double.png"]];
            shipBody.frame = CGRectMake(0, 0, shipBody.image.size.width, shipBody.image.size.height);
            shipBody.backgroundColor = [UIColor clearColor];
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(136,44,249,249)];
            circleView2 = [[CircleView alloc] initWithFrame:CGRectMake(518,44,249,249)];
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(244,284,170,220) andImage:@"ship_fraction_double_1.png"];
            fractionView2 = [[FractionView alloc] initWithFrame:CGRectMake(481,280,170,220) andImage:@"ship_fraction_double_2.png"];
            [self addSubview:circleView1];
            [self addSubview:circleView2];
            [self addSubview:fractionView1];
            [self addSubview:fractionView2];
            [self addSubview:shipBody];
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
