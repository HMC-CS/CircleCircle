//
//  MenuView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIEffectDesignerView.h"

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
    UIImageView* title;
    AVAudioPlayer* buttonDownSound;
    AVAudioPlayer* buttonUpSound;
}

@property (weak,nonatomic)id<ButtonOnMenuPressed> pressedDelegate;

@end
