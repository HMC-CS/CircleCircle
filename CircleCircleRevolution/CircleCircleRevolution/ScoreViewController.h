//
//  ScoreViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScoreView.h"

@class ScoreViewController;

@protocol ChangeScreenFromScore <NSObject>
-(void) goToScreenFromScore:(NSString*) screen;

@end

@interface ScoreViewController : UIViewController <ButtonOnScorePressed>
{
    NSString* playerName;
    UIAlertView* message;
    int lastScore;
    int lastMode;
    int lastDifficulty;
}

@property (weak,nonatomic) id<ChangeScreenFromScore> screenDelegate;

@end

