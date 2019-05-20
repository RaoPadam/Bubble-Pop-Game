//
//  ViewController.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "MainGameViewController.h"
#import "AppDelegate.h"
#import "Util.h"
#import "ConstantValues.h"


@class GameBoardView;

@interface MainGameViewController () <UICollisionBehaviorDelegate>

@end

@implementation MainGameViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"1");
    
    NSArray *arrayOfPlayerScores = [[Util sharedInstance] getPlayerScore:Player_Score_KEY];
    
    NSLog(@"2");
    
    NSLog(@"%@", arrayOfPlayerScores);
    
    NSLog(@"3");
    
    
    NSMutableArray *mutarrayOfPlayerScores = [(NSArray*)arrayOfPlayerScores mutableCopy];
    NSNumber * max = [mutarrayOfPlayerScores valueForKeyPath:@"@max.intValue"];
    NSString *maxvalueString = [max stringValue];
    if (maxvalueString == (id)[NSNull null] || maxvalueString.length == 0 ) {
        maxvalueString = @"0";
    }
    
    [highscoreLabel setText:[NSString stringWithFormat:@"High Score: %@", maxvalueString]];
    NSArray *arraySettings = [[Util sharedInstance]getSettings:Setting_Key];
    
    NSLog(@"4");
    
    
    if (arraySettings != nil || [arraySettings count] != 0) {
        
        NSString *bubble = arraySettings[0];
        numb_of_bubbles = [bubble integerValue];
        NSLog(@"num of bubbles%ld", (long)numb_of_bubbles);
        NSString *timev = arraySettings[1];
        startofTime= [timev integerValue];
        
    } else {
        
        numb_of_bubbles = Default_Bubble_Count;
        startofTime = Default_Game_Time;
        
    }
    
    bubble_max_speed = DEFAULT_GAME_SPEED;
    time = startofTime;
    
    NSLog(@"5");
    
    
    [timeLabel setText:[NSString stringWithFormat:@"Time: %ld", (long)time]];
    
    red = [[Color alloc] initWithSpecifications:[UIColor redColor] :1 ];
    green = [[Color alloc] initWithSpecifications:[UIColor greenColor] :5 ];
    blue = [[Color alloc] initWithSpecifications:[UIColor blueColor] :8 ];
    black = [[Color alloc] initWithSpecifications:[UIColor blackColor] :10 ];
    pink = [[Color alloc] initWithSpecifications:[UIColor colorWithRed:255.0f/255.0f green:204.0f/255.0f blue:255.0f/255.0f alpha:1] :2 ];
    
    
    animateUI = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    buttonsArray = [[NSMutableArray alloc] init];
    [buttonsArray removeAllObjects];
    
    for (int i = 0; i < numb_of_bubbles; i++){
        BubbleButtonView * button_view = [self createNewButton];
        [buttonsArray addObject:button_view];
        [button_view removeFromSuperview];
        
        
    }
    [self changeBubbleColor];
    
    moveTimer = [NSTimer scheduledTimerWithTimeInterval:3
                                                 target:self
                                               selector:@selector(timerIncreaseSpeed)
                                               userInfo:nil
                                                repeats:YES];
    
    countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(countdownTimer)
                                                    userInfo:nil
                                                     repeats:YES];
    
    collisionBhvr = [[UICollisionBehavior alloc]initWithItems:buttonsArray];
    collisionBhvr.translatesReferenceBoundsIntoBoundary = YES;
    [animateUI addBehavior:collisionBhvr];
    
}


- (BubbleButtonView *)createNewButton{
    
    BubbleButtonView * bubbleView = [[BubbleButtonView alloc] init];
    [bubbleView addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bubbleView];
    
    do {
        [bubbleView changePosition:self.view.frame];
    }
    
    while ([self checkButtonOverlapping:buttonsArray button:bubbleView]);
    
    
    UIDynamicItemBehavior *bubble_button_Behavior = [[UIDynamicItemBehavior alloc] initWithItems:buttonsArray];
    
    bubble_button_Behavior.friction = 0;
    bubble_button_Behavior.resistance = 0;
    bubble_button_Behavior.angularResistance = 0;
    bubble_button_Behavior.elasticity = 1;
    bubble_button_Behavior.allowsRotation = NO;
    [animateUI addBehavior:bubble_button_Behavior];
    
    
    UIPushBehavior *push_behaviour = [[UIPushBehavior alloc] initWithItems:@[bubbleView] mode:UIPushBehaviorModeInstantaneous];
    
    int is_negative = (arc4random() % 2);
    int other_is_negative = (arc4random() % 2);
    
    float x_direction = (arc4random() % bubble_max_speed) / 4.0;
    float y_direction = (arc4random() % bubble_max_speed) / 4.0;
    
    
    if (is_negative && other_is_negative){
        [push_behaviour setPushDirection:CGVectorMake(-x_direction, -y_direction)];
    }
    else if (!is_negative && other_is_negative) {
        [push_behaviour setPushDirection:CGVectorMake(x_direction, -y_direction)];
        
    }
    else if (is_negative && !other_is_negative) {
        [push_behaviour setPushDirection:CGVectorMake(-x_direction, y_direction)];
        
    }
    else {
        [push_behaviour setPushDirection:CGVectorMake(x_direction, y_direction)];
        
    }
    
    [push_behaviour setActive:YES];
    [animateUI addBehavior:push_behaviour];
    
    
    
    
    return bubbleView;
    
}

-(BOOL)checkButtonOverlapping:(NSArray *)array button:(BubbleButtonView *)btn {
    for (BubbleButtonView *this_btn in [array copy]) {
        if (this_btn == btn){continue;}
        if (CGRectIntersectsRect(this_btn.frame, btn.frame)) return YES;
    }
    return NO;
}

- (void)changeBubbleColor{
    for (BubbleButtonView * clickMe in buttonsArray) {
        
        bool was_hidden = false;
        bool hide = (bool)(arc4random() % 2);
        
        if(![clickMe superview]) {
            was_hidden = true;
        }
        
        
        if (!was_hidden && hide) {
            [clickMe removeFromSuperview];
            
        }
        else if (!hide){
            
            [self.view addSubview:clickMe];
            
            
            int colorNumber = arc4random_uniform(101) % 100;
            
            
            if (was_hidden){
                
                
                
                if (colorNumber < 40){
                    //Color red
                    [clickMe changeColor:red];
                    
                }
                else if (colorNumber < 70){
                    //pink
                    [clickMe changeColor:pink];
                    
                }
                else if (colorNumber < 85){
                    //Color green
                    [clickMe changeColor:green];
                    
                }
                else if (colorNumber < 95){
                    //  Color blue
                    [clickMe changeColor:blue];
                    
                }
                else {
                    //  Color black
                    [clickMe changeColor:black];
                }
                
                
            }
        }
        
    }
}


- (IBAction)buttonClick:(BubbleButtonView *)sender {
    
    float poppoints = 1;
    float currentscore;
    
    
    
    if (last_bubble_point == sender.bubblebtn.points){
        NSLog(@"HERE 1.5");
        poppoints = 1.5;
        
        currentscore = score + (sender.bubblebtn.points * poppoints);
        score += (int)(sender.bubblebtn.points * poppoints);
        
    } else {
        
        
        currentscore = score + (sender.bubblebtn.points * poppoints);
        
    }
    
    
    score = (int) currentscore;
    last_bubble_point = sender.bubblebtn.points;
    
    
    
    
    [scoreLabel setText:[NSString stringWithFormat:@"Score: %ld", (long)score]];
    
    [sender removeFromSuperview];
    
}

- (void)countdownTimer{
    if (time == 0){
        [countdownTimer invalidate];
        [moveTimer invalidate];
        
        
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Game Over"
                                     message:[NSString stringWithFormat:@"Score: %ld", (long)score]
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok_btn = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action)
                                 {
                                     
                                     NSString *scoreString = [NSString stringWithFormat: @"%ld", (long)score];
                                     
                                     
                                     [[Util sharedInstance]savePlayerScore:(scoreString) withKey:(Player_Score_KEY)];
                                     
                                     
                                     [alert dismissViewControllerAnimated:YES completion:nil];
                                     [self performSegueWithIdentifier:@"ShowScoreboard" sender:self];
                                     
                                 }];
        
        [alert addAction:ok_btn];
        
        
        [self presentViewController:alert animated:YES completion:nil];
        
        
        
    }
    
    [timeLabel setText:[NSString stringWithFormat:@"Time: %ld", (long)time]];
    time --;
    [self changeBubbleColor];
    
    
}





- (void)timerIncreaseSpeed{
    
    for (BubbleButtonView * clickMe in buttonsArray) {
        
        float x_direction = 0;
        float y_direction = 0;
        int x_negative = (arc4random() % 2);
        int y_negative = (arc4random() % 2);
        
        UIPushBehavior *push_behviour = [[UIPushBehavior alloc] initWithItems:@[clickMe] mode:UIPushBehaviorModeInstantaneous];
        
        
        if (bubble_max_speed != 0 ){
            
            x_direction = (arc4random() % bubble_max_speed) / 4.0 + (startofTime - time) * 0.01;
            y_direction = arc4random() % bubble_max_speed / 4.0 + (startofTime - time) * 0.01;
        }
        
        
        if (x_negative && y_negative){
            [push_behviour setPushDirection:CGVectorMake(-x_direction, -y_direction)];
        }
        else if (!x_negative && y_negative) {
            [push_behviour setPushDirection:CGVectorMake(x_direction, -y_direction)];
            
        }
        else if (x_negative && !y_negative) {
            [push_behviour setPushDirection:CGVectorMake(-x_direction, y_direction)];
            
        }
        else {
            [push_behviour setPushDirection:CGVectorMake(x_direction, y_direction)];
            
        }
        [animateUI addBehavior:push_behviour];
        
        
        [push_behviour setActive:YES];
        
    }
    
    
}


//preform ui alerts when game is paused
-(void) pauseActions {
    [moveTimer invalidate];
    [countdownTimer invalidate];
    
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Pause"
                                 message:[NSString stringWithFormat:@"Score: %ld", (long)score]
                                 preferredStyle:UIAlertControllerStyleAlert];
    
    //go back to main screen
    UIAlertAction* main_screen = [UIAlertAction
                                  actionWithTitle:@"Quit"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  {
                                      
                                      NSString *scoreString = [NSString stringWithFormat: @"%ld", (long)score];
                                      
                                      [[Util sharedInstance]savePlayerScore:(scoreString) withKey:(Player_Score_KEY)];
                                      
                                      
                                      [alert dismissViewControllerAnimated:YES completion:nil];
                                      [self performSegueWithIdentifier:@"ShowScoreboard" sender:self];
                                      
                                  }];
    
    
    UIAlertAction* ok_btn = [UIAlertAction
                             actionWithTitle:@"Resume"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 moveTimer = [NSTimer scheduledTimerWithTimeInterval:3
                                                                              target:self
                                                                            selector:@selector(timerIncreaseSpeed)
                                                                            userInfo:nil
                                                                             repeats:YES];
                                 
                                 countdownTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                                                   target:self
                                                                                 selector:@selector(countdownTimer)
                                                                                 userInfo:nil
                                                                                  repeats:YES];
                                 
                                 
                             }];
    
    
    [alert addAction:main_screen];
    
    [alert addAction:ok_btn];
    
    [self presentViewController:alert animated:YES completion:nil];
}



-(IBAction)pause:(id)sender{
    [self pauseActions];
    
}



@end
