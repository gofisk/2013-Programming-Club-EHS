//
//  CTRowControlsController.h
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/29/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTSecondLevelViewController.h"

@interface CTRowControlsController : CTSecondLevelViewController
@property (strong, nonatomic) NSArray *list;
- (IBAction)buttonTapped:(id)sender;
@end
