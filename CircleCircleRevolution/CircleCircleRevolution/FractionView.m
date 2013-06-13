//
//  FractionView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "FractionView.h"
#import "Config.h"

@implementation FractionView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        fractionLabel = [[UILabel alloc] initWithFrame:self.bounds];
        fractionLabel.backgroundColor = [UIColor clearColor];
        fractionLabel.textColor = [UIColor blackColor];
        fractionLabel.textAlignment = NSTextAlignmentCenter;
        fractionLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(72.0)];
        
        [self addSubview:fractionLabel];
    }
    return self;
}

-(void)updateFraction:(NSArray*)currentFraction
{
    NSString* fractionString = [NSString stringWithFormat:@"%d/%d", [currentFraction[0] intValue], [currentFraction[1] intValue]];
    fractionLabel.text = fractionString;    
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
