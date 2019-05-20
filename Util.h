//
//  Util.h
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 20/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

+(id)sharedInstance;

-(void)saveSettings:(NSArray*)value withSettingKey:(NSString*)setting_arry;
-(NSArray*)getSettings:(NSString*)setting_arry;

-(void)savePlayerName:(NSString*)value withKey:(NSString*)player_key;
-(NSArray*)getPlayerName:(NSString*)player_name;

-(void)savePlayerScore:(NSString*)value withKey:(NSString*)player_key;
-(NSArray*)getPlayerScore:(NSString*)player_score;




@end
