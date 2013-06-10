//
//  GameViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameView.h"

@class CreditsViewController;

@protocol ChangeScreenFromGame <NSObject>
-(void) goToScreenFromGame:(NSString*) screen;

@end

@interface GameViewController : UIViewController <ButtonOnGamePressed>

@property (weak,nonatomic) id<ChangeScreenFromGame> screenDelegate;

@end