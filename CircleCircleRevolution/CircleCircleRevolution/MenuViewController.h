//
//  MenuViewController.h
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuView.h"

@class MenuViewController;

@protocol ChangeScreenFromMenu <NSObject>
-(void) goToScreenFromMenu:(NSString*) screen;

@end

@interface MenuViewController : UIViewController <ButtonOnMenuPressed>

@property (weak,nonatomic) id<ChangeScreenFromMenu> screenDelegate;

@end
