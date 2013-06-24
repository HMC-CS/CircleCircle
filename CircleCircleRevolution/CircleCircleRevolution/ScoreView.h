//
//  ScoreView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIEffectDesignerView.h"


@class ScoreView;

@protocol ButtonOnScorePressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface ScoreView : UIView
{
    UIButton* menuButton;
    UILabel* scoresLabel11;
    UILabel* scoresLabel12;
    UILabel* scoresLabel13;
    UILabel* scoresLabel21;
    UILabel* scoresLabel22;
    UILabel* scoresLabel23;
    
}

-(void) updateScoresLabel;


@property (weak,nonatomic)id<ButtonOnScorePressed> pressedDelegate;

@end