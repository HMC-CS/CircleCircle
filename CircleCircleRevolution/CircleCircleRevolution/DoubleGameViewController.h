//
//  DoubleGameViewController.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoubleGameView.h"

@class DoubleGameViewController;

@protocol ChangeScreenFromGame2 <NSObject>
-(void) goToScreenFromGame2:(NSString*) screen;

@end

@interface DoubleGameViewController : UIViewController <ButtonOnGame2Pressed>

@property (weak,nonatomic) id<ChangeScreenFromGame2> screenDelegate;

@end