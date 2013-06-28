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
            flames = [UIEffectDesignerView effectWithFile:@"teardropFlamesUnboosted.ped"];
            boostedFlames = [UIEffectDesignerView effectWithFile:@"teardropFlamesBoosted.ped"];
            shipBody = [[UIImageView alloc] initWithImage:singleShipImage];
            shipBody.frame = CGRectMake(0, 0, shipBody.image.size.width, shipBody.image.size.height);
            shipBody.backgroundColor = [UIColor clearColor];
            circleBG1 = [[CircleView alloc] initWithFrame:CGRectMake(sgCircleX-50,sgCircleY-50,sgCircleSize+100,sgCircleSize+100)];
            [circleBG1 update:100];
            
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(sgCircleX,sgCircleY,sgCircleSize,sgCircleSize)];
            [circleView1 setColor:circleFillColor];
            circleView1.userInteractionEnabled = NO;
            circleFeedback1 = [[CircleView alloc] initWithFrame:CGRectMake(sgCircleX,sgCircleY,sgCircleSize,sgCircleSize)];
            [circleFeedback1 setColor:circleFeedbackColor];
            circleFeedback1.userInteractionEnabled = NO;
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(sgFractionX,sgFractionY,sgFractionWidth,sgFractionHeight) andImage:sgFractionImageName];
            flames.center = CGPointMake(45,250);
            boostedFlames.center = CGPointMake(45,250);
            [self addSubview:flames];
            [self addSubview:boostedFlames];
            [boostedFlames.emitter setBirthRate:0];
            [self addSubview:circleBG1];
            [self addSubview:circleView1];
            [self addSubview:circleFeedback1];
            [self addSubview:fractionView1];
            [self addSubview:shipBody];
        }
        else if (gameMode == 2)
        {
            flames = [UIEffectDesignerView effectWithFile:@"smallTeardropFlameUnboosted.ped"];
            boostedFlames = [UIEffectDesignerView effectWithFile:@"smallTeardropFlameBoosted.ped"];
            shipBody = [[UIImageView alloc] initWithImage:doubleShipImage];
            shipBody.frame = CGRectMake(0, 0, shipBody.image.size.width, shipBody.image.size.height);
            shipBody.backgroundColor = [UIColor clearColor];
            
            circleBG1 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle1X-40,dgCircle1Y-39,dgCircleSize+80,dgCircleSize+80)];
            circleBG2 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle2X-40,dgCircle2Y-39,dgCircleSize+80,dgCircleSize+80)];
            [circleBG1 update:100];
            [circleBG2 update:100];
            
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle1X,dgCircle1Y+1,dgCircleSize,dgCircleSize)];
             circleView2 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle2X,dgCircle2Y+1,dgCircleSize,dgCircleSize)];
            circleView1.userInteractionEnabled = NO;
            circleView2.userInteractionEnabled = NO;
            [circleView1 setColor:circleFillColor];
            [circleView2 setColor:circleFillColor];
            
            circleFeedback1 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle1X,dgCircle1Y+1,dgCircleSize,dgCircleSize)];
            circleFeedback2 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle2X,dgCircle2Y+1,dgCircleSize,dgCircleSize)];
            circleFeedback1.userInteractionEnabled=NO;
            circleFeedback2.userInteractionEnabled = NO;
            [circleFeedback1 setColor:circleFeedbackColor];
            [circleFeedback2 setColor:circleFeedbackColor];
            
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(dgFraction1X,dgFraction1Y,dgFractionWidth,dgFractionHeight) andImage:dgFraction1ImageName];
            fractionView2 = [[FractionView alloc] initWithFrame:CGRectMake(dgFraction2X,dgFraction2Y,dgFractionWidth,dgFractionHeight) andImage:dgFraction2ImageName];

            flames.center = CGPointMake(45,185);
            boostedFlames.center = CGPointMake(45,185);
            [self addSubview:flames];
            [self addSubview:boostedFlames];
            [boostedFlames.emitter setBirthRate:0];
            [self addSubview:fractionView1];
            [self addSubview:fractionView2];
            [self addSubview:circleBG1];
            [self addSubview:circleBG2];
            [self addSubview:circleView1];
            [self addSubview:circleView2];
            [self addSubview:circleFeedback1];
            [self addSubview:circleFeedback2];

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
        [circleFeedback1 setDenominator:[[currentFraction1 lastObject] intValue]];
        [circleFeedback1 setPercentFrom:0];
        [circleFeedback1 update:0];


    }
    if (currentFraction2)
    {
        [fractionView2 updateFraction:currentFraction2];
        [circleFeedback2 setDenominator:[[currentFraction2 lastObject] intValue]];
        [circleFeedback2 setPercentFrom:0];
        [circleFeedback2 update:0];


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
        [circleFeedback1 setPercentFrom:0];
        [circleFeedback1 update:0];
    }
    else if (feedbackPercent1>0)
    {
        if (feedbackPercent1 == [circleView1 getPercentTo]){
            [circleFeedback1 setPercentFrom:feedbackPercent1];
        }
        [circleFeedback1 update:feedbackPercent1];
    }
    
    
    if (feedbackPercent2 == 0)
    {
        [circleFeedback2 setPercentFrom:0];
        [circleFeedback2 update:0];

    }
    else if (feedbackPercent2>0)
    {
        if (feedbackPercent2 == [circleView2 getPercentTo]){
            [circleFeedback2 setPercentFrom:feedbackPercent2];
        }
        [circleFeedback2 update:feedbackPercent2];
    }
}

-(void) setCircleTarget:(id)sender forAction:(SEL)action whichCircle:(int)circleNumber
{
    if (circleNumber ==1)
    {
        [circleBG1 setCircleTarget:sender forAction:action];
    }
    if (circleNumber ==2)
    {
        [circleBG2 setCircleTarget:sender forAction:action];
    }
}

-(void) pause
{
    flames.alpha = 0;
    boostedFlames.alpha = 0;
}

-(void) resume
{
    flames.alpha = 1;
    boostedFlames.alpha = 1;
}

-(void) boost
{
    [flames.emitter setBirthRate:0];
    [boostedFlames.emitter setBirthRate:1];

}

-(void) unboost
{

    [flames.emitter setBirthRate:1];
    [boostedFlames.emitter setBirthRate:0];

}

-(void)showGlowOnCircle:(int)circleNum isCorrect:(BOOL)isRight
{
    if (gameMode ==1){
        UIImageView* glow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CircleGlowL.png"]];
        if (!isRight){
            glow.image = [UIImage imageNamed:@"CircleGlowLRed.png"];
        }
        glow.center = circleView1.center;
        [self addSubview:glow];
        [UIView animateWithDuration:1.0 animations:^(void) { glow.alpha = 0;
            glow.alpha = 1;
            glow.alpha = 0;}];
    }
    else if (gameMode == 2){
        UIImageView* glow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CircleGlowS.png"]];
        if (!isRight){
            glow.image = [UIImage imageNamed:@"CircleGlowSRed.png"];
        }
        if (circleNum ==1){
            glow.center = circleView1.center;
            [self addSubview:glow];
            [UIView animateWithDuration:1.0 animations:^(void) { glow.alpha = 0;
                glow.alpha = 1;
                glow.alpha = 0;}];
        }
        else if (circleNum ==2){
            glow.center = circleView2.center;
            [self addSubview:glow];
            [UIView animateWithDuration:1.0
                             animations:^(void) {
                                 glow.alpha = 0;
                                 glow.alpha = 1;
                                 glow.alpha = 0;}];
        }
    }
}

-(void) showFeedback:(NSString*)feedbackTerm onCircleNumber:(int)circleNum
{
    // determine which feedback to display
    UIImageView *feedbackView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[[NSString alloc] initWithFormat:@"%@Text.png",feedbackTerm]]];
    
    [self addSubview:feedbackView];
    
    if (gameMode ==2 && [feedbackTerm isEqualToString:@"Awesome"]){
        feedbackView.frame = CGRectMake(0,0,feedbackView.bounds.size.width*.75,feedbackView.bounds.size.height*.75);
    }
    
    if (circleNum ==1){
        feedbackView.center = circleView1.center;
    }
    else if (circleNum ==2){
        feedbackView.center = circleView2.center;
    }
    
    [UIView animateWithDuration:.25
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         feedbackView.alpha = 0;
                         feedbackView.alpha = 1;}
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1
                                                delay:0
                                              options:UIViewAnimationOptionCurveEaseIn
                                           animations:^(void){
                                               feedbackView.alpha = 1;
                                               feedbackView.alpha=0;}
                                           completion:^(BOOL finished){
                                               [feedbackView removeFromSuperview];}];}];
                         
    
}

-(void) setCircleDenominator:(int)denom forCircleNumber:(int)num
{
    if (num == 1)
    {
        [circleView1 setDenominator:num];
    }
    else if (num == 2)
    {
        [circleView2 setDenominator:num];
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
