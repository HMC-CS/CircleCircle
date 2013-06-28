//
//  CircleView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "CircleView.h"
#import "Config.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        percentFrom = 0;
        percentTo = 0;
        
        color = circleBGColor;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [self drawSliceFrom:percentFrom to:percentTo withColor:color];
    
    /*[self drawSliceFrom:MAX(percent,feedback) to:100 withColor:color];
    
    if (feedback>=percent) {
        [self drawSliceFrom:percent to:feedback withColor:circleFeedbackColor];
        [self drawSliceFrom:0 to:percent withColor:circleFillColor];
    }else{
        [self drawSliceFrom:feedback to:percent withColor:circleFillColor];
        [self drawSliceFrom:0 to:feedback withColor:circleFeedbackColor];
    }
    
    if (feedback != 0)
        feedbackLinesView = [[FeedbackLinesView alloc] initWithFrame:self.frame denominator:denominator];*/
    
    if (denominator != 0 && percentTo != 0){
        feedbackLinesView = [[FeedbackLinesView alloc] initWithFrame:self.frame denominator:denominator];
    }
}

-(void) drawSliceFrom:(float)percent1 to:(float)percent2 withColor:(UIColor *) sColor
{
    //get and save context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    //create and fill a slice
    [sColor setFill];
    double amtToFill = M_PI*2*0.01*(percent2-percent1);
    double startAngle = -M_PI_2+percent1*0.01*2*M_PI;
    double endAngle = amtToFill + startAngle;
    CGContextMoveToPoint(context,width/2.0,height/2.0);
    CGContextAddArc(context, width/2.0, height/2.0, height/2.0, startAngle, endAngle, false);
    CGContextFillPath(context);
    
}




-(void) update: (float) per
{
    percentTo = per;
    [self setNeedsDisplay];
}

-(void) setPercentFrom:(float) newPercentFrom
{
    percentFrom = newPercentFrom;
}

-(float) getPercentTo
{
    return percentTo;
}

// changes the background color (the "red" circle)
-(void) setColor:(UIColor *)newColor
{
    color = newColor;
}

/*-(void)updateFeedback:(NSNumber*)percentChange
{
    
    feedback+=[percentChange floatValue];
    [self setNeedsDisplay];
}*/


/*-(void) resetFeedback
{
    feedback = 0;
}*/


/*-(void) setFeedback:(float)newFeedback
{
    feedback = newFeedback;
    [self setNeedsDisplay];
}*/




-(void) setCircleTarget:(id)sender forAction:(SEL)action
{
    target = sender;
    selector = action;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (target && selector)
    {
        [target performSelector:selector];
    }
}

-(void) setDenominator:(int)denom
{
    denominator = denom;
}

@end
