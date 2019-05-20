//
//  Color.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "Color.h"

@implementation Color


-(id)initWithSpecifications:(UIColor *)initColor :(NSInteger)initPoints  {
    self = [self init];
    if (self) {
       
        _points = initPoints;
        _color = initColor;
        
    }
    return self;
}


-(NSInteger)getPoints {
    return _points;
    
}


-(UIColor *)getColor {
    return _color;
    
}




-(BOOL) isEqual:(id)otherColor {
    if (otherColor == self)
        return YES;
    if (!otherColor || ![otherColor isKindOfClass:[self class]])
        return NO;
    return [self isEqualToColor:otherColor];
}

-(BOOL) isEqualToColor:(Color*)otherColor {
    if (self == otherColor)
        return YES;
    
    return _color == otherColor.color && _points == otherColor.points ;
}
@end
