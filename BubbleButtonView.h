//
//  Bubble.h
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//
#import "UIKit/UIKit.h"
#import <Foundation/Foundation.h>
#import "MainGameViewController.h" 
#import "Color.h"
#import "Bubble.h"
@class BubbleView; 

@interface BubbleButtonView : UIButton


@property Bubble *bubblebtn;

-(id)initWithSpecifications:(NSInteger)numbBubbles;

-(void)changePosition:(CGRect)viewFrame;
-(void)changeColor:(Color *)color;

@end
