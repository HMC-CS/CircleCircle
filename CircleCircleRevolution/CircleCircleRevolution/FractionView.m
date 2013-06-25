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

- (id)initWithFrame:(CGRect)frame andImage:(NSString*)image
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        fractionTab = [[UIImageView alloc] initWithImage:[UIImage imageNamed:image]];
        fractionTab.backgroundColor = [UIColor clearColor];
        
        fractionLabel = [[UILabel alloc] initWithFrame:self.bounds];
        fractionLabel.backgroundColor = [UIColor clearColor];
        fractionLabel.textColor = buttonFontNormalColor;
        fractionLabel.shadowOffset = CGSizeMake(1,1);
        fractionLabel.shadowColor = buttonFontShadowColor;
        fractionLabel.textAlignment = NSTextAlignmentCenter;
        fractionLabel.font = fontFractionLabel;
        
        [self addSubview:fractionTab];
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
