//
//  LifeView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "LifeView.h"

@implementation LifeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        lifeLabel = [[UILabel alloc] initWithFrame:self.bounds];
        lifeLabel.backgroundColor = [UIColor whiteColor];
        lifeLabel.textColor = [UIColor blackColor];
        lifeLabel.textAlignment = NSTextAlignmentCenter;
        lifeLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
        [self addSubview:lifeLabel];
    }
    return self;
}


-(void) updateLife:(int)lives
{
    lifeLabel.text = [NSString stringWithFormat:@"%d lives", lives];
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
