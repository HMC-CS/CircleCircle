//
//  DifficultySelectionViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/12/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DifficultySelectionView.h"

@class DifficultySelectionViewController;

@protocol BeginGameFromDifficulySelection <NSObject>
-(void) beginGameWithMode:(int) gameMode andDifficulty:(int)difficulty;

@end

@interface DifficultySelectionViewController : UIViewController <ButtonOnDifficultySelectionPressed>
{
    DifficultySelectionView* difficultySelectionView;
    int gameMode;
}

@property (weak,nonatomic) id<BeginGameFromDifficulySelection> screenDelegate;

-(id)initWithMode:(int)mode;

@end
