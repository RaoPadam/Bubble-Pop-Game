//
//  FirstScreenViewController.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 15/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "FirstScreenViewController.h"
#import "Util.h"
#import "ConstantValues.h"



@interface FirstScreenViewController ()

@end

@implementation FirstScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)enditingEnded{
    [self.view endEditing:YES];
    
}
- (IBAction)buttonClick:(id)sender {
    
    if ([nameFieldPlayer.text length] > 0) {
        
        
        [[Util sharedInstance]savePlayerName:nameFieldPlayer.text withKey: Player_Name_KEY];
        
        
        [self performSegueWithIdentifier:@"GameScreen" sender:self];
    }
    else {
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Invalid Name"
                                     message:[NSString stringWithFormat:@"Please enter a name to begin."]
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"Enter Again"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}
- (IBAction)scoreBoardBtnClick:(id)sender {
    
    [self performSegueWithIdentifier:@"showScoreBoard" sender:self];
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    if ( [segue.identifier isEqualToString:@"GameScreen"]){
        
        
        
        
    }
    
    
}
@end
