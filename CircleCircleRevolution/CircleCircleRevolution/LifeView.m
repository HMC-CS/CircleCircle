//
//  LifeView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "LifeView.h"
#import "Config.h"

@implementation LifeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        lifeBorder = [[UIImageView alloc] initWithImage:lifeBorderImage];
        lifeBorder.backgroundColor = [UIColor clearColor];
        
        bottomFilled = bottomLifeFilled;
        bottomEmpty = bottomLifeEmpty;
        middleFilled = middleLifeFilled;
        middleEmpty = middleLifeEmpty;
        topFilled = topLifeFilled;
        topEmpty = topLifeEmpty;
        
        
        life1 = [[UIImageView alloc] initWithImage:bottomFilled];
        life1.backgroundColor = [UIColor clearColor];
        
        life2 = [[UIImageView alloc] initWithImage:middleFilled];
        life2.backgroundColor = [UIColor clearColor];
        
        life3 = [[UIImageView alloc] initWithImage:topFilled];
        life3.backgroundColor = [UIColor clearColor];
        
        [self addSubview:life1];
        [self addSubview:life2];
        [self addSubview:life3];
        [self addSubview:lifeBorder];
    }
    return self;
}


-(void) updateLife:(int)lives
{
    if (lives == 2)
        [life3 setHidden:YES];
    if (lives == 1)
        [life2 setHidden:YES];
    if (lives == 0)
        [life1 setHidden:YES];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
