//
//  GameBoardView.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "GameScreenView.h"

@implementation GameScreenView {
    MainGameViewController * controller;
}


- (id)initWithCoder:(NSCoder*)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    return self;
}

- (id)init {
    
    [NSException raise:@"Invalid inititalization." format:@"Must initialzie with view controller."];
    return nil;
}


- (id)initWithSpecifications:(MainGameViewController *) viewController {
    self = [super init];
    if (self) {
        
        controller = viewController;
    }
    return self;
    
}

//add bubble to view
- (BubbleButtonView *)addBubble {
    
    BubbleButtonView * bubble = [[BubbleButtonView alloc] init];
    [bubble addTarget:self action:@selector(bubblebuttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:bubble];
    
    return bubble;
    
}

//show bubble
- (void) showBubble:(BubbleButtonView *)bubble {
    [self addSubview:bubble];
}





- (IBAction)pause:(id)sender {
    [controller pauseActions];
    
}


- (IBAction)bubblebuttonClicked:(BubbleButtonView *)bubble {
    [controller buttonClick:bubble];
    [bubble removeFromSuperview];
    
}

@end
