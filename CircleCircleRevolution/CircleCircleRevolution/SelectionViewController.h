//
//  SelectionViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectionView.h"

@class CreditsViewController;

@protocol ChangeScreenFromSelect <NSObject>
-(void) goToScreenFromSelect:(NSString*) screen;

@end

@interface SelectionViewController : UIViewController <ButtonOnSelectPressed>

@property (weak,nonatomic) id<ChangeScreenFromSelect> screenDelegate;

@end