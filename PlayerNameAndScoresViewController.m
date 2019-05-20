//
//  PlayerNameAndScoresViewController.m
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 15/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.
//

#import "PlayerNameAndScoresViewController.h"
#import "Util.h"
#import "ConstantValues.h"



@interface PlayerNameAndScoresViewController ()

@end

@implementation PlayerNameAndScoresViewController {
    
    
    NSArray *arrayPlayers;
    NSArray *arrayPlayerScores;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arrayOfPlayerNames = [[Util sharedInstance]getPlayerName:Player_Name_KEY];
    NSArray *arrayOfPlayerScores = [[Util sharedInstance]getPlayerScore:Player_Score_KEY];
    
    arrayPlayers = arrayOfPlayerNames;
    arrayPlayerScores = arrayOfPlayerScores;
    NSLog(@"%@", arrayOfPlayerNames);
    NSLog(@"%@", arrayOfPlayerScores);
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayPlayers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [arrayPlayers objectAtIndex:indexPath.row];
    
    cell.detailTextLabel.text = [arrayPlayerScores objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
