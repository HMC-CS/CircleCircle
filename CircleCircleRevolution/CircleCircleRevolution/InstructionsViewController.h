//
//  InstructionsViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstructionsView.h"

@class InstructionsViewController;

@protocol ChangeScreenFromInstructions <NSObject>
-(void) goToScreenFromInstructions:(NSString*) screen;

@end

@interface InstructionsViewController : UIViewController <ButtonOnInstructionsPressed>

@property (weak,nonatomic) id<ChangeScreenFromInstructions> screenDelegate;

@end