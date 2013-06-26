//
//  ScoreView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "ScoreSubview.h"
#import "UIEffectDesignerView.h"


@class ScoreView;

@protocol ButtonOnScorePressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface ScoreView : UIView
{
    UIButton* menuButton;
    
    UIView* subview11;
    UIView* subview12;
    UIView* subview13;
    UIView* subview21;
    UIView* subview22;
    UIView* subview23;
    
    AVAudioPlayer* buttonDownSound;
    AVAudioPlayer* buttonUpSound;
}

-(void) updateScoresLabel;


@property (weak,nonatomic)id<ButtonOnScorePressed> pressedDelegate;

@end