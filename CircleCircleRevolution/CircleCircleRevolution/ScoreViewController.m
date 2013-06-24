//
//  ScoreViewController.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/7/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [NSUserDefaults resetStandardUserDefaults];

        [self checkUserDefaultsExist];
        ScoreView* score = [[ScoreView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        score.pressedDelegate = self;
        self.view = score;
        playerName = @"";
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

-(void)checkUserDefaultsExist
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([[NSUserDefaults standardUserDefaults] objectForKey: @"scores mode:1 diff:1"] == nil) {
     
        NSLog(@"into loop");
        NSArray* highScores = [NSArray arrayWithObjects: [NSNumber numberWithInt: 9801], [NSNumber numberWithInt: 5625], [NSNumber numberWithInt: 1728], [NSNumber numberWithInt: 1089], [NSNumber numberWithInt: 1], nil];
        NSArray* nameList = [NSArray arrayWithObjects: [NSString stringWithFormat: @"Peter Wiggin"], [NSString stringWithFormat: @"Mr Rock"], [NSString stringWithFormat: @"Voldemort"], [NSString stringWithFormat: @"Ender"], [NSString stringWithFormat: @"Mr Steel"], nil];
        
        for (int diff = 1; diff<4;diff++){
            for (int mode = 1; mode<3;mode++){
                [defaults setObject: highScores forKey: [[NSString alloc]initWithFormat:@"scores mode:%d diff:%d",mode,diff]];
                [defaults setObject: nameList forKey: [[NSString alloc]initWithFormat:@"names mode:%d diff:%d",mode,diff]];
            }
            
        }

        [defaults synchronize];

    }
}


-(void) promptForName
{
    message = [[UIAlertView alloc] initWithTitle:@"Nicely played! What's your name?"
                                         message:nil
                                        delegate:self
                               cancelButtonTitle:@"Save name"
                               otherButtonTitles:nil, nil];
    
    [message setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [message show];
    return;
}

- (void) alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        playerName = [message textFieldAtIndex:0].text;
        if ([playerName isEqualToString:@""]){
            playerName = @"??????";
        }
        [self insertNewHighScore:lastScore andName:playerName];
        [[NSUserDefaults standardUserDefaults] setInteger:-1 forKey:@"lastGameScore"];
    }
}

-(void)insertNewHighScore: (int)score andName: (NSString *)name
{

    // Get scores array stored in user default
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // Get high scores array from defaults
    NSMutableArray *highScores = [NSMutableArray arrayWithArray: [defaults arrayForKey: [[NSString alloc]initWithFormat:@"scores mode:%d diff:%d",lastMode,lastDifficulty]]];
    NSMutableArray *nameList = [NSMutableArray arrayWithArray: [defaults arrayForKey: [[NSString alloc]initWithFormat:@"names mode:%d diff:%d",lastMode,lastDifficulty]]];
    
    for (int i = 0; i < [highScores count]; i++) {
        if (score >= [[highScores objectAtIndex: i] intValue]) {
            // Insert new high score and push all others down            
            [highScores insertObject: [NSNumber numberWithInt: score] atIndex: i];
            [nameList insertObject: [NSString stringWithFormat: @"%@", name] atIndex: i];            
            // Remove last score
            [highScores removeLastObject];
            [nameList removeLastObject];
            
            [defaults setObject: highScores forKey: [[NSString alloc]initWithFormat:@"scores mode:%d diff:%d",lastMode,lastDifficulty]];
            [defaults setObject: nameList forKey: [[NSString alloc]initWithFormat:@"names mode:%d diff:%d",lastMode,lastDifficulty]];
            [defaults synchronize];
            
            [(ScoreView*)self.view updateScoresLabel];
            
            break;
        }
    }
}

-(void) viewDidAppear:(BOOL)animated
{
    lastScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"lastGameScore"];
    if (lastScore > 0){
        lastMode = [[NSUserDefaults standardUserDefaults] integerForKey:@"lastGameMode"];
        lastDifficulty = [[NSUserDefaults standardUserDefaults] integerForKey:@"lastGameDifficulty"];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSMutableArray *highScores = [NSMutableArray arrayWithArray: [defaults arrayForKey:[[NSString alloc]initWithFormat:@"scores mode:%d diff:%d",lastMode,lastDifficulty]]];
        
        int lowestHighScore = [[highScores objectAtIndex:4] intValue];
        if (lastScore >= lowestHighScore){
            [self promptForName];
        }
    }
}


// Protocol for communicating with ViewController
-(void) passedButtonPress:(UIButton*)button
{
    if (self.screenDelegate)
    {
        NSString* screenTitle = button.titleLabel.text;
        [self.screenDelegate goToScreenFromScore:screenTitle];
    }
}

@end
