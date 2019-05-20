//
//  Color.h
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Color : UIColor

@property UIColor *color;
@property NSInteger points;


-(id)initWithSpecifications:(UIColor *)color :(NSInteger)points ;

-(NSInteger)getPoints;
-(UIColor *)getColor;


@end
