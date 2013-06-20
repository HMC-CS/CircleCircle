//
//  DifficultySelectionView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIEffectDesignerView.h"

@class DifficultySelectionView;

@protocol ButtonOnDifficultySelectionPressed <NSObject>
-(void) passedDifficulty:(UIButton*)button;

@end


@interface DifficultySelectionView : UIView
{
    
}

@property (weak,nonatomic)id<ButtonOnDifficultySelectionPressed> pressedDelegate;

@end
