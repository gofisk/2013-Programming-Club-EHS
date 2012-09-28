//
//  CTDeleteMeController.m
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/30/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTDeleteMeController.h"

@implementation CTDeleteMeController
@synthesize list;

- (IBAction)toggleEdit:(id)sender {
	[self.tableView setEditing:!self.tableView.editing
					  animated:YES];
	
	if (self.tableView.editing)
		[self.navigationItem.rightBarButtonItem setTitle:@"Done"];
	else
		[self.navigationItem.rightBarButtonItem setTitle:@"Edit"];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	if (list == nil) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"operatingsystems"
														 ofType:@"plist"];
		NSMutableArray *array = [[NSMutableArray alloc] initWithContentsOfFile:path];
		self.list = array;
	}
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"Edit"
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(toggleEdit:)];
	self.navigationItem.rightBarButtonItem = editButton;
}

#pragma mark - Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *DeleteMeCellIdentifier = @"DeleteMeCellIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DeleteMeCellIdentifier];
	
	if (cell == nil)
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:DeleteMeCellIdentifier];
	NSInteger row = [indexPath row];
	cell.textLabel.text = (self.list)[row];
	return cell;
}

#pragma mark - Table View Data Source Methods
- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	[self.list removeObjectAtIndex:row];
	[tableView deleteRowsAtIndexPaths:@[indexPath]
					 withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath
							 animated:YES];
}
@end