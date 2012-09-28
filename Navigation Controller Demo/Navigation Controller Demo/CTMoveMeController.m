//
//  CTMoveMeController.m
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/30/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTMoveMeController.h"

@implementation CTMoveMeController
@synthesize list;

- (IBAction)toggleMove {
	[self.tableView setEditing:!self.tableView.editing animated:YES];
	
	if (self.tableView.editing)
		[self.navigationItem.rightBarButtonItem setTitle:@"Done"];
	else
		[self.navigationItem.rightBarButtonItem setTitle:@"Move"];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	if (list == nil) {
		NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
								 @"Adam Markon",
								 @"∆ Striker",
								 @"Derrick Lockwood",
								 @"Mr. Behnke",
								 @"Dr. Polly Reikowski",
								 @"Dr. Pete Zak",
								 @"Barack Obama",
								 @"Mitt Romney",
								 @"Joe Biden",
								 @"Paul Ryan", nil];
		self.list = array;
	}
	
	UIBarButtonItem *moveButton = [[UIBarButtonItem alloc] initWithTitle:@"Move"
																   style:UIBarButtonItemStyleBordered
																  target:self
																  action:@selector(toggleMove)];
	self.navigationItem.rightBarButtonItem = moveButton;
}

#pragma mark - Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *MoveCellIdentifier = @"MoveCellIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MoveCellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:MoveCellIdentifier];
		cell.showsReorderControl = YES;
	}
	NSUInteger row = [indexPath row];
	cell.textLabel.text = list[row];
	
	return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
		   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
	return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
	  toIndexPath:(NSIndexPath *)destinationIndexPath {
	NSUInteger fromRow = [sourceIndexPath row];
	NSUInteger toRow = [destinationIndexPath row];
	
	id object = list[fromRow];
	[list removeObjectAtIndex:fromRow];
	[list insertObject:object
			   atIndex:toRow];
}
@end
