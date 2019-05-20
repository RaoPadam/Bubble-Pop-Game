//
//  ViewController.h
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BubbleButtonView.h"
#import "Bubble.h"
#import "BubbleButtonView.h"
#import "Color.h"
#import "GameScreenView.h"
@class GameScreenView;
@class BubbleButtonView;

@interface MainGameViewController : UIViewController {

__weak IBOutlet UILabel *highscoreLabel;
__weak IBOutlet UILongPressGestureRecognizer *pauseGesture;

IBOutlet UILabel * timeLabel;
IBOutlet UILabel * scoreLabel;
IBOutlet GameScreenView *gameScreenView;

UICollisionBehavior* collisionBhvr;
UIDynamicAnimator* animateUI;

NSMutableArray * buttonsArray;


NSInteger time;
NSInteger startofTime;
NSTimer * moveTimer;
NSTimer * countdownTimer;

NSInteger score;
NSInteger numb_of_bubbles;
NSInteger bubble_max_speed;

NSInteger last_bubble_point;

//Color of bubbles_button
Color *green;
Color *blue;
Color *pink;
Color *red;
Color *black;

}


//creates new bubble  objects
-(BubbleButtonView *)createNewButton;
- (void)changeBubbleColor;
- (IBAction)buttonClick:(id)sender;


- (void)timerIncreaseSpeed;
- (void)countdownTimer;
-(BOOL)checkButtonOverlapping:(NSArray *)array button:(BubbleButtonView *)btn;


-(void) pauseActions;


@end
