//
//  InstructionsView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIEffectDesignerView.h"


@class InstructionsView;

@protocol ButtonOnInstructionsPressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface InstructionsView : UIView
{
    UIButton* menuButton;
    
    AVAudioPlayer* buttonDownSound;
    AVAudioPlayer* buttonUpSound;
}

@property (weak,nonatomic)id<ButtonOnInstructionsPressed> pressedDelegate;

@end