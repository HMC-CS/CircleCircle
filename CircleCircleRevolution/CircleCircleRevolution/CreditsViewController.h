//
//  CreditsViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreditsView.h"

@class CreditsViewController;

@protocol ChangeScreenFromCredits <NSObject>
-(void) goToScreenFromCredits:(NSString*) screen;

@end

@interface CreditsViewController : UIViewController <ButtonOnCreditsPressed>

@property (weak,nonatomic) id<ChangeScreenFromCredits> screenDelegate;

@end
