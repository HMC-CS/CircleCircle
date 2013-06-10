//
//  GameViewController.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        GameView* game = [[GameView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        game.pressedDelegate = self;
        self.view = game;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Protocol for communicating with ViewController
-(void) passedButtonPress:(UIButton*)button
{
    if (self.screenDelegate)
    {
        NSString* screenTitle = button.titleLabel.text;
        [self.screenDelegate goToScreenFromGame:screenTitle];
    }
}

@end
