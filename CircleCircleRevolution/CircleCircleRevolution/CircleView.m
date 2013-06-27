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
        percent = 0;
        feedback = 0;
        color = circleBGColor;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    //background circle
    [color setFill];
    CGRect rectangle = CGRectMake(0, 0, width, height);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextFillPath(context);
    
    CGContextRestoreGState(context);
    
    if (feedback>=percent) {
        [self drawSlice:feedback :circleFeedbackColor];
        [self drawSlice:percent :circleFillColor];
    }else{
        [self drawSlice:percent :circleFillColor];
        [self drawSlice:feedback :circleFeedbackColor];
    }
    
//    if (feedback != 0 && !feedbackLinesView)
//    {
    if (feedback != 0)
        feedbackLinesView = [[FeedbackLinesView alloc] initWithFrame:self.frame denominator:denominator];
//        [UIView animateWithDuration:20
//                              delay:0
//                            options:UIViewAnimationOptionCurveEaseOut
//                         animations:^(void){
//                             feedbackLinesView.alpha = 0;
//                             feedbackLinesView.alpha = 1;}
//                         completion:NULL];
//    }
    
//        float linePos = -M_PI_2;
//        CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:18/255.0 green:14/255.0 blue:14/255.0 alpha:1].CGColor);
//        for (int i=0; i<denominator; i++)
//        {
//            CGContextMoveToPoint(context,width/2.0,height/2.0);
//            CGContextSetLineWidth(context, 4.0);
//            CGContextAddLineToPoint(context,width/2.0+cosf(linePos)*width/2.0,height/2.0+sinf(linePos)*height/2.0);
//            CGContextStrokePath(context);
//            
//            linePos += M_PI*2/denominator;
//        }
//    }
}


// helper code for drawing the "slices"
-(void) drawSlice: (float) thePerc : (UIColor *) sColor
{
    //get and save context
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    int width = self.bounds.size.width;
    int height = self.bounds.size.height;
    
    //create and fill a slice
    [sColor setFill];
    double amtToFill = M_PI*2*.010*thePerc;
    double startAngleAtTop = -M_PI_2;
    double endAngle = amtToFill + startAngleAtTop;
    CGContextMoveToPoint(context,width/2.0,height/2.0);
    CGContextAddArc(context, width/2.0, height/2.0, height/2.0, startAngleAtTop, endAngle, false);
    //CGContextMoveToPoint(context,width/2.0,height/2.0);
    CGContextFillPath(context);
    
}




-(void) update: (float) per
{
    percent = per;
    [self setNeedsDisplay];
    
}

// changes the background color (the "red" circle)
-(void) setColor:(UIColor *)newColor
{
    color = newColor;
}

-(void)updateFeedback:(NSNumber*)percentChange
{
    
    feedback+=[percentChange floatValue];
    [self setNeedsDisplay];
}


-(void) resetFeedback
{
    feedback = 0;
}


-(void) setFeedback:(float)newFeedback
{
    feedback = newFeedback;
    [self setNeedsDisplay];
}




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
