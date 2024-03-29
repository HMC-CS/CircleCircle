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
   
    // To reset the default scores, uncomment these two lines for one run of the app
    // NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    // [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    [[NSUserDefaults standardUserDefaults] setInteger:-1 forKey:@"lastGameScore"];

    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"soundShouldPlay"];
    
    NSError* error;
    bgMusicPlayer = [[AVAudioPlayer alloc]
                                    initWithContentsOfURL:bgMusicURL error:&error];
    bgMusicPlayer.numberOfLoops = -1;
    [bgMusicPlayer prepareToPlay];
    [bgMusicPlayer play];
    bgMusicPlayer.volume = 0;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
        bgMusicPlayer.volume = 1;
    }
    
    
    buttonSFX = [[AVAudioPlayer alloc]
                 initWithContentsOfURL:buttonSFXURL error:&error];
    
    
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
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
        [buttonSFX prepareToPlay];
        [buttonSFX play];
    }
    if ([screen isEqualToString:toMainMenu])
    {
        [self popToViewController:menuViewController animated:YES];
        gameViewController = nil;
    }
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
        NSAssert(FALSE,@"Invalid screen.");
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

-(void) goToScreenFromDifficultySelection:(NSString*)screen
{
    [self goToScreen:screen];
}

-(void)beginGameWithMode:(int)gameMode andDifficulty:(int)difficulty
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
        [buttonSFX prepareToPlay];
        [buttonSFX play];
    }
    gameViewController = [[GameViewController alloc] initWithMode:gameMode andDifficulty:difficulty];
    gameViewController.screenDelegate = self;
    [self pushViewController:gameViewController animated:YES];
}

-(void) toggleSound
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
        [[NSUserDefaults standardUserDefaults] setBool:FALSE forKey:@"soundShouldPlay"];
        bgMusicPlayer.volume = 0;
    }
    else {
        [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:@"soundShouldPlay"];
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"soundShouldPlay"]){
            bgMusicPlayer.volume = 1;
        }
    }
}
@end
