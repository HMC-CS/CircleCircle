//
//  CircleView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        percent = 0;
        feedback = 0;
        color = [UIColor colorWithRed:0 green:128.0/255 blue:128.0/255 alpha:1];
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
    
    if (feedback>percent) {
        [self drawSlice:feedback :[UIColor colorWithRed:200.0/255 green:55.0/255 blue:55.0/255 alpha:1]];
        [self drawSlice:percent :[UIColor colorWithRed:95.0/255 green:211.0/255 blue:95.0/255 alpha:1]];
    }else{
        [self drawSlice:percent :[UIColor colorWithRed:95.0/255 green:211.0/255 blue:95.0/255 alpha:1]];
        [self drawSlice:feedback :[UIColor colorWithRed:200.0/255 green:55.0/255 blue:55.0/255 alpha:1]];
    }
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
    CGContextMoveToPoint(context,width/2.0,height/2.0);
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

// Draws feedback "sweeping" to the correct answer
-(void) setFeedback:(float)newFeedback
{
    if (feedback ==0){
        float startTime = 0;
        float percentChange;
        if (newFeedback>percent) //you underestimated, so fill from where you ended
        {
            feedback = percent;
            percentChange = (newFeedback-percent)/25;
        }
        else //if you over estimated, start from 0
        {
            feedback = 0;
            percentChange = newFeedback/25;
        }
        while (startTime < 1.0) // for 1 second, 25 redraws
        {
            [self performSelector:@selector(updateFeedback:) withObject:[NSNumber numberWithFloat:percentChange] afterDelay:startTime];
            startTime += 0.04;
        }
    }
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

@end
