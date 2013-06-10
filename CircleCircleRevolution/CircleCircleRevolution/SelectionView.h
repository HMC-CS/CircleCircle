//
//  SelectionView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectionView;

@protocol ButtonOnSelectPressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface SelectionView : UIView
{
    UIButton* singleButton;
    UIButton* doubleButton;
    UIButton* menuButton;
}

@property (weak,nonatomic)id<ButtonOnSelectPressed> pressedDelegate;

@end
