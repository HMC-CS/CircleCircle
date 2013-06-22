//
//  DifficultySelectionViewController.m
//  CircleCircleRevolution
//
//  Created by Kathryn Aplin on 6/12/13.
//  Copyright (c) 2013 Kathryn Aplin. All rights reserved.
//

#import "DifficultySelectionViewController.h"
#import "Config.h"

@interface DifficultySelectionViewController ()

@end

@implementation DifficultySelectionViewController

-(id)initWithMode:(int)mode
{
    self = [super init];
    if (self){
        difficultySelectionView = [[DifficultySelectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        difficultySelectionView.pressedDelegate = self;
        [self.view addSubview:difficultySelectionView];
        gameMode = mode;
    }
    return self;
}

-(void) passedDifficulty:(UIButton*)button;
{
    
    if ([button.titleLabel.text isEqualToString:easyMode])
        [self.screenDelegate beginGameWithMode:gameMode andDifficulty:1];
    if ([button.titleLabel.text isEqualToString:mediumMode])
        [self.screenDelegate beginGameWithMode:gameMode andDifficulty:2];
    if ([button.titleLabel.text isEqualToString:hardMode])
        [self.screenDelegate beginGameWithMode:gameMode andDifficulty:3];

    
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

-(void) toMenuFromDifficultySelection:(UIButton*)button
{
    [self.screenDelegate goToScreenFromDifficultySelection:button.titleLabel.text];
}

@end
