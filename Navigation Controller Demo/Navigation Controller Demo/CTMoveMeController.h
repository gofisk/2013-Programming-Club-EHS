//
//  CTMoveMeController.h
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/30/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTSecondLevelViewController.h"

@interface CTMoveMeController : CTSecondLevelViewController
@property (strong, nonatomic) NSMutableArray *list;
- (IBAction)toggleMove;
@end
