//
//  CTCheckListController.h
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/28/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTSecondLevelViewController.h"

@interface CTCheckListController : CTSecondLevelViewController
@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSIndexPath *lastIndexPath;
@end
