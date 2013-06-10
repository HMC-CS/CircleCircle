//
//  CreditsView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CreditsView;

@protocol ButtonOnCreditsPressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface CreditsView : UIView
{
    UIButton* menuButton;
}

@property (weak,nonatomic)id<ButtonOnCreditsPressed> pressedDelegate;

@end
