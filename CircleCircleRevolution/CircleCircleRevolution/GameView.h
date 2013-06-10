//
//  GameView.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameView;

@protocol ButtonOnGamePressed <NSObject>
-(void) passedButtonPress:(UIButton*)button;

@end

@interface GameView : UIView
{
    UIButton* menuButton;
}

@property (weak,nonatomic)id<ButtonOnGamePressed> pressedDelegate;

@end
