//
//  CircleView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleView : UIView
{
    float percent;
    UIColor* color;
    float feedback;
    
    id target;
    SEL selector;
}

-(void) update: (float) per;
-(void) setColor: (UIColor*) newColor;
-(void) setFeedback: (float) newFeedback;
-(void) resetFeedback;
-(void) setCircleTarget:(id)sender forAction:(SEL)action;

@end
