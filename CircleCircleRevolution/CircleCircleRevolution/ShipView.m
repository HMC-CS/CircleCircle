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
        
        NSArray *normalFlamesNames = @[@"fire_s_1.png",@"fire_s_2.png",@"fire_s_3.png",@"fire_s_4.png"];
        NSArray *boostedFlamesNames = @[@"fire_l_1.png",@"fire_l_2.png",@"fire_l_3.png",@"fire_l_4.png"];
        normalFlames = [[NSMutableArray alloc] init];
        boostedFlames = [[NSMutableArray alloc] init];
        for (int i = 0; i<4;i++){
            [normalFlames addObject:[UIImage imageNamed:[normalFlamesNames objectAtIndex:i]]];
            [boostedFlames addObject:[UIImage imageNamed:[boostedFlamesNames objectAtIndex:i]]];
        }
        
        UIImage* flame = [normalFlames objectAtIndex:1];
        
        flames = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,flame.size.width,flame.size.height)];
        flames.animationImages = normalFlames;
        flames.animationDuration = 0.5;
                
        if (gameMode == 1)
        {
            shipBody = [[UIImageView alloc] initWithImage:singleShipImage];
            shipBody.frame = CGRectMake(0, 0, shipBody.image.size.width, shipBody.image.size.height);
            shipBody.backgroundColor = [UIColor clearColor];
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(sgCircleX-50,sgCircleY-50,sgCircleSize+100,sgCircleSize+100)];
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(sgFractionX,sgFractionY,sgFractionWidth,sgFractionHeight) andImage:sgFractionImageName];
            flames.center = CGPointMake(-50,250);
            [self addSubview:flames];
            [flames startAnimating];
            [self addSubview:circleView1];
            [self addSubview:fractionView1];
            [self addSubview:shipBody];
        }
        else if (gameMode == 2)
        {
            shipBody = [[UIImageView alloc] initWithImage:doubleShipImage];
            shipBody.frame = CGRectMake(0, 0, shipBody.image.size.width, shipBody.image.size.height);
            shipBody.backgroundColor = [UIColor clearColor];
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle1X-40,dgCircle1Y-40,dgCircleSize+80,dgCircleSize+80)];
            circleView2 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle2X-40,dgCircle2Y-40,dgCircleSize+80,dgCircleSize+80)];
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(dgFraction1X,dgFraction1Y,dgFractionWidth,dgFractionHeight) andImage:dgFraction1ImageName];
            fractionView2 = [[FractionView alloc] initWithFrame:CGRectMake(dgFraction2X,dgFraction2Y,dgFractionWidth,dgFractionHeight) andImage:dgFraction2ImageName];
            flames.center = CGPointMake(-55,190);
            [self addSubview:flames];
            [flames startAnimating];
            [self addSubview:fractionView1];
            [self addSubview:fractionView2];
            [self addSubview:circleView1];
            [self addSubview:circleView2];

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

-(void) pause
{
    flames.alpha = 0;
}

-(void) resume
{
    flames.alpha = 1;
}

-(void) boost
{
    [flames stopAnimating];
    flames.animationImages = boostedFlames;
    [flames startAnimating];
}

-(void) unboost
{
    [flames stopAnimating];
    flames.animationImages = normalFlames;
    [flames startAnimating];
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
