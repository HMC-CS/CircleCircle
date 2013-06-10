//
//  ViewController.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationBarHidden = YES;
    
    // Initialize all child view controllers
    menuViewController = [[MenuViewController alloc] init];
    gameViewController = [[GameViewController alloc] init];
    scoreViewController = [[ScoreViewController alloc] init];
    creditsViewController = [[CreditsViewController alloc] init];
    instructionsViewController = [[InstructionsViewController alloc] init];
    
    // Set screenDelegate for changing view controllers
    menuViewController.screenDelegate = self;
    gameViewController.screenDelegate = self;
    scoreViewController.screenDelegate = self;
    creditsViewController.screenDelegate = self;
    instructionsViewController.screenDelegate = self;

    [self pushViewController:menuViewController animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)goToScreen:(NSString *)screen
{
    if ([screen isEqualToString:@"Menu"])
        [self popToViewController:menuViewController animated:YES];
    else if ([screen isEqualToString:@"Game"])
        [self pushViewController:gameViewController animated:YES];
    else if ([screen isEqualToString:@"Score"])
        [self pushViewController:scoreViewController animated:YES];
    else if ([screen isEqualToString:@"Credits"])
        [self pushViewController:creditsViewController animated:YES];
    else if ([screen isEqualToString:@"Instructions"])
        [self pushViewController:instructionsViewController animated:YES];
    else
        NSLog(@"Invalid screen.");
}



// Delegation helpers
-(void)goToScreenFromMenu:(NSString*)screen
{
    [self goToScreen:screen];
}

-(void)goToScreenFromCredits:(NSString*)screen
{
    [self goToScreen:screen];
}

-(void)goToScreenFromGame:(NSString*)screen
{
    [self goToScreen:screen];
}

-(void)goToScreenFromScore:(NSString*)screen
{
    [self goToScreen:screen];
}

-(void)goToScreenFromInstructions:(NSString*)screen
{
    [self goToScreen:screen];
}


@end
