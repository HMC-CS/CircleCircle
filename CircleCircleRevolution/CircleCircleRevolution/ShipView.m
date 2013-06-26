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
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(sgCircleX-50,sgCircleY-50,sgCircleSize+100,sgCircleSize+100)];
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(sgFractionX,sgFractionY,sgFractionWidth,sgFractionHeight) andImage:sgFractionImageName];
            flames.center = CGPointMake(45,250);
            boostedFlames.center = CGPointMake(45,250);
            [self addSubview:flames];
            [self addSubview:boostedFlames];
            [boostedFlames.emitter setBirthRate:0];
            [self addSubview:circleView1];
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
            circleView1 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle1X-40,dgCircle1Y-40,dgCircleSize+80,dgCircleSize+80)];
            circleView2 = [[CircleView alloc] initWithFrame:CGRectMake(dgCircle2X-40,dgCircle2Y-40,dgCircleSize+80,dgCircleSize+80)];
            fractionView1 = [[FractionView alloc] initWithFrame:CGRectMake(dgFraction1X,dgFraction1Y,dgFractionWidth,dgFractionHeight) andImage:dgFraction1ImageName];
            fractionView2 = [[FractionView alloc] initWithFrame:CGRectMake(dgFraction2X,dgFraction2Y,dgFractionWidth,dgFractionHeight) andImage:dgFraction2ImageName];

            flames.center = CGPointMake(30,185);
            boostedFlames.center = CGPointMake(30,185);
            [self addSubview:flames];
            [self addSubview:boostedFlames];
            [boostedFlames.emitter setBirthRate:0];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
