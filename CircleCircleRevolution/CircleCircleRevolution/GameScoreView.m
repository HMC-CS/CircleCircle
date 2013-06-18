//
//  GameScoreView.m
//  CircleCircleRevolution
//
//  Created by Buike Ndefo-Dahl on 6/11/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "GameScoreView.h"
#import "Config.h"

@implementation GameScoreView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        scoreLabel = [[UILabel alloc] initWithFrame:self.bounds];
        scoreLabel.backgroundColor = [UIColor whiteColor];
        scoreLabel.textColor = [UIColor blackColor];
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        scoreLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(36.0)];
        
        [self addSubview:scoreLabel];
    }
    return self;
}

-(void) updateScore:(int)score;
{
    NSString* scoreString = [NSString stringWithFormat:@"%d", score];
    scoreLabel.text = scoreString;
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
