//
//  CTFirstLevelController.m
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/27/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTFirstLevelController.h"
#import "CTSecondLevelViewController.h"
#import "CTDisclosureButtonController.h"
#import "CTCheckListController.h"
#import "CTRowControlsController.h"
#import "CTMoveMeController.h"
#import "CTDeleteMeController.h"

@implementation CTFirstLevelController
@synthesize controllers;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"First Level";
	NSMutableArray *array = [@[] mutableCopy];
	
	//Disclosure Button
	CTDisclosureButtonController *disclosureButtonController = [[CTDisclosureButtonController alloc] initWithStyle:UITableViewStylePlain];
	disclosureButtonController.title = @"Disclosure Buttons";
	disclosureButtonController.rowImage = [UIImage imageNamed:@"disclosureButtonControllerIcon.png"];
	[array addObject:disclosureButtonController];
	
	//Checklist
	CTCheckListController *checkListController = [[CTCheckListController alloc] initWithStyle:UITableViewStylePlain];
	checkListController.title = @"Check Your Languages";
	checkListController.rowImage = [UIImage imageNamed:@"checkmarkControllerIcon.png"];
	[array addObject:checkListController];
	
	//Row Controls
	CTRowControlsController *rowControlsController = [[CTRowControlsController alloc] initWithStyle:UITableViewStylePlain];
	rowControlsController.title = @"Row Controls";
	rowControlsController.rowImage = [UIImage imageNamed:@"rowControlsIcon.png"];
	[array addObject:rowControlsController];
	
	//Move Me
	CTMoveMeController *moveMeController = [[CTMoveMeController alloc] initWithStyle:UITableViewStylePlain];
	moveMeController.title = @"Order Best to Worst";
	moveMeController.rowImage = [UIImage imageNamed:@"moveMeIcon.png"];
	[array addObject:moveMeController];
	
	//Delete Me
	CTDeleteMeController *deleteMeController = [[CTDeleteMeController alloc] initWithStyle:UITableViewStylePlain];
	deleteMeController.title = @"Delete An OS";
	deleteMeController.rowImage = [UIImage imageNamed:@"deleteMeIcon.png"];
	[array addObject:deleteMeController];
	
	self.controllers = array;
}

#pragma mark - Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [self.controllers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *FirstLevelCell = @"First Level Cell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FirstLevelCell];
	
	if (cell == nil)
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FirstLevelCell];
	
	//Configure the cell
	NSUInteger row = [indexPath row];
	CTSecondLevelViewController *controller = controllers[row]; //[controllers objectAtIndex:row]
	cell.textLabel.text = controller.title;
	cell.imageView.image = controller.rowImage;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	return cell;
}

#pragma mark - Table View Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	CTSecondLevelViewController *nextController = controllers[row];
	[self.navigationController pushViewController:nextController animated:YES];
}

@end