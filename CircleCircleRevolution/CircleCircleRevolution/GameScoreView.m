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
{
    int endValue;
    double delta;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        
        scoreBg = [[UIImageView alloc] initWithImage:scoreImage];
        scoreBg.backgroundColor = [UIColor clearColor];
        
        scoreLabel = [[UILabel alloc] initWithFrame:self.bounds];
        scoreLabel.backgroundColor = [UIColor clearColor];
        scoreLabel.textColor = buttonFontNormalColor;
        scoreLabel.shadowColor = buttonFontShadowColor;
        scoreLabel.shadowOffset = CGSizeMake(1,1);
        scoreLabel.textAlignment = NSTextAlignmentCenter;
        scoreLabel.font = fontScoreLabel;
        [self updateScore:0];
        value = 0;
        
        [self addSubview:scoreBg];
        [self addSubview:scoreLabel];
    }
    return self;
}

-(void) updateScore:(int)score;
{
    NSString* scoreString = [NSString stringWithFormat:@"%d", score];
    scoreLabel.text = scoreString;
}

-(void) updateValueBy:(NSNumber*)valueDelta
{
    // update property
    value += [valueDelta intValue];
    [self updateScore:value];
    // are we at the end value? - if count up, else count down
    if ([valueDelta intValue] >0){
        if (value >endValue){
            value = endValue;
            [self updateScore:value];
            return;
        }
    }
    // if not, do it again
    [self performSelector:@selector(updateValueBy:) withObject:valueDelta afterDelay:delta];
}

//count to a given value
-(void) countTo:(int)to withDuration:(float)t
{
    //time for animation
    delta = t/(abs(to-value)+1);
    delta *= 25;
    if (delta < 0.02) delta = 0.02;
    
    // set end value
    endValue = to;
    
    // cancel previous stuff
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    // detect which way counting goes
    if (to-value>0){
        //count up
        [self updateValueBy:@25];
    }
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
