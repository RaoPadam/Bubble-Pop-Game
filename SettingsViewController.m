//
//  SettingsViewController.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 16/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "SettingsViewController.h"
#import "Util.h"
#import "ConstantValues.h"



@interface SettingsViewController ()


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SaveAndPlay:(id)sender {
    
    
    NSString *stringValueBubbleCount = _bubbleCountLabel.text;
    NSInteger bubblevalue = [stringValueBubbleCount intValue];
    
    NSString *stringValuetime = _timeCountLabel.text;
    NSInteger timevalue = [stringValuetime intValue];
    
    if (bubblevalue > 9 && bubblevalue < 26 && timevalue > 9 && timevalue < 121 ) {
        
        
        
        UIAlertController * alert=[UIAlertController
                                   
                                   alertControllerWithTitle:@"Save and Play" message:@"These would be default settings now.Feel free to comeback and change."preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        
                                        NSArray  *settingsArry = [[NSArray alloc] initWithObjects:_bubbleCountLabel.text,_timeCountLabel.text,nil];
                                        
                                        [[Util sharedInstance]saveSettings: settingsArry withSettingKey:Setting_Key];
                                        
                                        
                                        [self performSegueWithIdentifier:@"SaveToHome" sender:self];
                                        
                                        
                                    }];
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"No, thanks"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
                                       
                                       NSLog(@"you pressed No, thanks button");
                                       // call method whatever u need
                                       
                                   }];
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        [self presentViewController:alert animated:YES completion:nil];
        
        
        
        
        
    } else {
        
        
        UIAlertController * alert=[UIAlertController
                                   
                                   alertControllerWithTitle:@"Error" message:@"Plese provide both bubble count (10 - 25) and time (10 - 120)."preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Ok"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        
                                    }];
        [alert addAction:yesButton];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }
    
    
}


@end
