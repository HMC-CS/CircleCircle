//
//  FractionView.h
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FractionView : UIImageView
{
    UILabel* fractionLabel;
    UIImageView* fractionTab;
}

-(void)updateFraction:(NSArray*)currentFraction;
-(id)initWithFrame:(CGRect)frame andImage:(NSString*)image;

@end
