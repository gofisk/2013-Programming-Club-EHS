//
//  CTDisclosureDetailController.m
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/27/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTDisclosureDetailController.h"

@implementation CTDisclosureDetailController
@synthesize label;
@synthesize message;

- (void)viewWillAppear:(BOOL)animated {
	label.text = message;
	[super viewWillAppear:animated];
}

@end
