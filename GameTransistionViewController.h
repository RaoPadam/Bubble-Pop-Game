//
//  GameTransistionViewController.h
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 16/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameTransistionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *hint;
-(void)countDown;

@end
