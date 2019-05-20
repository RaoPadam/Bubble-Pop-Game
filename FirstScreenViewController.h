//
//  FirstScreenViewController.h
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 15/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstScreenViewController : UIViewController {
    __weak IBOutlet UITextField *nameFieldPlayer;
    __weak IBOutlet UIButton *playButton;
}

- (IBAction)buttonClick:(id)sender;

@end

