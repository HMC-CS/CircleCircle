//
//  MenuView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuView;

@protocol ButtonOnMenuPressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface MenuView : UIView
{
    UIButton* gameButton;
    UIButton* creditsButton;
    UIButton* scoreButton;
    UIButton* instructionsButton;
}

@property (weak,nonatomic)id<ButtonOnMenuPressed> pressedDelegate;

@end
