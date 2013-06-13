//
//  ViewController.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "ViewController.h"
#import "Config.h"

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
    selectionViewController = [[SelectionViewController alloc] init];
    scoreViewController = [[ScoreViewController alloc] init];
    creditsViewController = [[CreditsViewController alloc] init];
    instructionsViewController = [[InstructionsViewController alloc] init];
    
    // Set screenDelegate for changing view controllers
    menuViewController.screenDelegate = self;
    selectionViewController.screenDelegate = self;
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
    if ([screen isEqualToString:toMainMenu])
        [self popToViewController:menuViewController animated:YES];
    else if ([screen isEqualToString:toSelectionScreen])
        [self pushViewController:selectionViewController animated:YES];
    else if ([screen isEqualToString:toHighScores])
        [self pushViewController:scoreViewController animated:YES];
    else if ([screen isEqualToString:toCredits])
        [self pushViewController:creditsViewController animated:YES];
    else if ([screen isEqualToString:toInstructions])
        [self pushViewController:instructionsViewController animated:YES];
    else if ([screen isEqualToString:toSingleGame])
    {
        difficultySelectionViewController = [[DifficultySelectionViewController alloc] initWithMode:1];
        difficultySelectionViewController.screenDelegate = self;
        [self pushViewController:difficultySelectionViewController animated:YES];
    }
    else if ([screen isEqualToString:toDoubleGame])
    {
        difficultySelectionViewController = [[DifficultySelectionViewController alloc] initWithMode:2];
        difficultySelectionViewController.screenDelegate = self;
        [self pushViewController:difficultySelectionViewController animated:YES];

    }
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

-(void)goToScreenFromSelect:(NSString*)screen
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

-(void)goToScreenFromGame1:(NSString*)screen
{
    [self goToScreen:screen];
}

-(void)goToScreenFromGame2:(NSString *)screen
{
    [self goToScreen:screen];
}

-(void)beginGameWithMode:(int)gameMode andDifficulty:(int)difficulty
{
    gameViewController = [[GameViewController alloc] initWithMode:gameMode andDifficulty:difficulty];
    gameViewController.screenDelegate = self;
    [self pushViewController:gameViewController animated:YES];
}


@end
