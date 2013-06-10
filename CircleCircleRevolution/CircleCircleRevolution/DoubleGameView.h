//
//  DoubleGameView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DoubleGameView;

@protocol ButtonOnGame2Pressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface DoubleGameView : UIView
{
    UIButton* menuButton;
}

@property (weak,nonatomic)id<ButtonOnGame2Pressed> pressedDelegate;

@end