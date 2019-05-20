//
//  GameTransistionViewController.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 16/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "GameTransistionViewController.h"

@interface GameTransistionViewController ()

{
    
    __weak IBOutlet UILabel *textLabel;
    __weak IBOutlet UILabel *count;
    NSTimer *moveTimer;
    NSInteger time;
    NSInteger startTime;
}

@end


@implementation GameTransistionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    time = 3;
    startTime = 60;
    moveTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                 target:self
                                               selector:@selector(countDown)
                                               userInfo:nil
                                                repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)countDown {
    count.text = [NSString stringWithFormat:@"%ld", (long)time];
   
    switch (time) {
        case 2:
            textLabel.text = [NSString stringWithFormat:@"Set"];
            _hint.text = [NSString stringWithFormat:@"Hint: Long press the screen to pause."];
            break;
            case 1:
            _hint.text = [NSString stringWithFormat:@"Hint: Long press the screen to pause."];
            textLabel.text = [NSString stringWithFormat:@"Go"];
        case 0:
            [self performSegueWithIdentifier:@"transistionGameScreen" sender:self];
            break;
    }
//    
//    if (time == 2){
//        textLabel.text = [NSString stringWithFormat:@"Set"];
//        _hint.text = [NSString stringWithFormat:@"Hint: Long press the screen to pause."];
//    } else if (time == 1) {
//        _hint.text = [NSString stringWithFormat:@"Hint: Long press the screen to pause."];
//        textLabel.text = [NSString stringWithFormat:@"Go"];
//    } else if (time == 0) {
//        [self performSegueWithIdentifier:@"transistionGameScreen" sender:self];
//    }
//    
    time--;
    
}




@end
