//
//  GameBoardView.h
//  Bubble_Pop_Game_A2
//
//  Created by Padam Rao on 14/5/17.
//  Copyright © 2017 Padam Rao. All rights reserved.





#import <UIKit/UIKit.h>
#import "BubbleButtonView.h"
@class BubbleButtonView;

@interface GameScreenView : UIView {
    
}

//add bubble
- (BubbleButtonView *)addBubble;

- (IBAction)pause:(id)sender;

//remove bubble from view
- (IBAction)bubblebuttonClicked:(BubbleButtonView *)bubble;
- (id)init;

//show bubble 
- (void) showBubble:(BubbleButtonView *)bubble;


- (id)initWithSpecifications:(UIViewController *)viewController;
@end
