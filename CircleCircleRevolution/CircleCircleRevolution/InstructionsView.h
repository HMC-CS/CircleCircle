//
//  InstructionsView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>


@class InstructionsView;

@protocol ButtonOnInstructionsPressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface InstructionsView : UIView
{
    UIButton* menuButton;
}

@property (weak,nonatomic)id<ButtonOnInstructionsPressed> pressedDelegate;

@end