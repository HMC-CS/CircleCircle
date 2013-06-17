//
//  ScoreView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ScoreView;

@protocol ButtonOnScorePressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface ScoreView : UIView
{
    UIButton* menuButton;
    UILabel* scoresLabel;
}

-(void) updateScoresLabel;


@property (weak,nonatomic)id<ButtonOnScorePressed> pressedDelegate;

@end