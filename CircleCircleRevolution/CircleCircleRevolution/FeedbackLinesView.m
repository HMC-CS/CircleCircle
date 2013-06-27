//
//  FeedbackLinesView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/26/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "FeedbackLinesView.h"

@implementation FeedbackLinesView

- (id)initWithFrame:(CGRect)frame denominator:(int)denom
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        CGContextRef context = UIGraphicsGetCurrentContext();
        float linePos = -M_PI_2;
        int denominator = denom;
        int width = self.bounds.size.width;
        int height = self.bounds.size.height;
        CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:18/255.0 green:14/255.0 blue:14/255.0 alpha:1].CGColor);
        
        for (int i=0; i<denominator; i++)
        {
            CGContextMoveToPoint(context,width/2.0,height/2.0);
            CGContextSetLineWidth(context, 4.0);
            CGContextAddLineToPoint(context,width/2.0+cosf(linePos)*width/2.0,height/2.0+sinf(linePos)*height/2.0);
            CGContextStrokePath(context);
            
            linePos += M_PI*2/denominator;
        }
        self.alpha = 0;
    }
    return self;
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
