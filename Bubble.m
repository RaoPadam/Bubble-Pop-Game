//
//  Bubble.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "Bubble.h"

@implementation Bubble

-(id)initWithSpecifications:(UIColor *)thisColor :(NSInteger)thisPoints {
    self = [super init];
    
    if (self) {
        _points = thisPoints;
        _color = thisColor;
    }
    return self;
}

@end
