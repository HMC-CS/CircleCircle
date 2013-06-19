//
//  LifeView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LifeView : UIView
{
    UIImageView* lifeBorder;
    UIImageView* life1;
    UIImageView* life2;
    UIImageView* life3;
    
    UIImage* bottomFilled;
    UIImage* bottomEmpty;
    UIImage* middleFilled;
    UIImage* middleEmpty;
    UIImage* topFilled;
    UIImage* topEmpty;
}

-(void)updateLife:(int)lives;

@end
