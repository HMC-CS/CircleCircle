//
//  SingleGameViewController.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/10/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingleGameView.h"

@class SingleGameViewController;

@protocol ChangeScreenFromGame1 <NSObject>
-(void) goToScreenFromGame1:(NSString*) screen;

@end

@interface SingleGameViewController : UIViewController <ButtonOnGame1Pressed>

@property (weak,nonatomic) id<ChangeScreenFromGame1> screenDelegate;

@end