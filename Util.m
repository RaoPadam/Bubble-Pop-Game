//
//  Util.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 20/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "Util.h"
#import "ConstantValues.h"


@implementation Util

+ (id)sharedInstance {
    static Util *shareInstance = nil;
    @synchronized(self) {
        if (shareInstance == nil)
            shareInstance = [[self alloc] init];
    }
    return shareInstance;
}



-(void)saveSettings:(NSArray *)value withSettingKey:(NSString *)setting_arry {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:setting_arry];
    [defaults synchronize];
    
}

-(NSArray*) getSettings:(NSArray *)setting_arry {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *arraySettings = [defaults objectForKey:Setting_Key];
    return arraySettings;
}



-(void)savePlayerName:(NSString*)value withKey:(NSString*) key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSArray *arrayOfPlayerNames = [userDefaults objectForKey:key];
    
    if (arrayOfPlayerNames != nil || [arrayOfPlayerNames count] != 0) {
        
        NSMutableArray *arrayOfPlayerNamesMut = [(NSArray*)arrayOfPlayerNames mutableCopy];
        [arrayOfPlayerNamesMut addObject:value];
        NSArray  *arrayOfPlayerNamesN = [NSArray arrayWithArray:arrayOfPlayerNamesMut];
        [userDefaults setObject:arrayOfPlayerNamesN forKey:key];
        
    } else {
        
        NSArray *playerName = [NSArray arrayWithObjects:value, nil];
        [userDefaults setObject:playerName forKey: Player_Name_KEY];
        
    }
    [userDefaults synchronize];
    
}

-(void)savePlayerScore:(NSString*)value  withKey:(NSString*)key{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arrayOfPlayerScores = [userDefaults objectForKey:key];
    
    if (arrayOfPlayerScores != nil || [arrayOfPlayerScores count] != 0) {
        
        NSMutableArray *arrayOfPlayerScoresMut = [(NSArray*)arrayOfPlayerScores mutableCopy];
        [arrayOfPlayerScoresMut addObject: value];
        NSArray  *arrayOfPlayerScoresN = [NSArray arrayWithArray:arrayOfPlayerScoresMut];
        
        [userDefaults setObject:arrayOfPlayerScoresN forKey:key];
        
        
    } else {
        
        NSArray *firsttimescoreArray = [NSArray arrayWithObjects:value, nil];
        [userDefaults setObject:firsttimescoreArray forKey:key];
        
    }
    
    [userDefaults synchronize];
    
}

-(NSArray*)getPlayerName:(NSString*)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arrayOfPlayerNames = [userDefaults objectForKey:key];
    return arrayOfPlayerNames;
}

-(NSArray*)getPlayerScore:(NSString*)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *arrayofplayerscores = [userDefaults objectForKey:key];
    return arrayofplayerscores;
}


@end
