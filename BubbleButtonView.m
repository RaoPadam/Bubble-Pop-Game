//
//  Bubble.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.

#import "BubbleButtonView.h"

@implementation BubbleButtonView


- (id)init {
    self = [self initWithFrame:CGRectMake(10, 10, 60, 60)];
    
    if (self){
        [self setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"pop.png"] forState:UIControlStateHighlighted];
        _bubblebtn = [[Bubble alloc] init];
        
    }
    return self;
}


-(id)initWithSpecifications:(NSInteger)numbBubbles {
    
    
    self = [self initWithFrame:CGRectMake(10, 10, 60, 60)];
    
    if (self){
        [self setBackgroundImage:[UIImage imageNamed:@"circle.png"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage imageNamed:@"pop.png"] forState:UIControlStateHighlighted];
        _bubblebtn = [[Bubble alloc] init];
        
    }
    return self;
}

-(void)changePosition:(CGRect)viewFrame {
    
    CGRect buttonFrame = self.frame;
    int randomX_coordinate = arc4random() % (int)(viewFrame.size.width - buttonFrame.size.width);
    int randomY_coordinate = arc4random() % (int)(viewFrame.size.height - buttonFrame.size.height);
    
    
    buttonFrame.origin.x = randomX_coordinate;
    buttonFrame.origin.y = randomY_coordinate;
    self.frame = buttonFrame;
}

-(void)changeColor:(Color *)color {
    _bubblebtn.color = color.color;
    _bubblebtn.points = color.points;
    
    
    
    [self setTintColor:color.color];
    UIImage * image = [self.currentBackgroundImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self setBackgroundImage:image forState:UIControlStateNormal];
    
}


@end
