//
//  CTCheckListController.m
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/28/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTCheckListController.h"

@implementation CTCheckListController
@synthesize list;
@synthesize lastIndexPath;

- (void)viewDidLoad {
	[super viewDidLoad];
	NSArray *array = @[@"Basic",
					  @"FORTRAN",
					  @"C",
					  @"C#",
					  @"C++",
					  @"Objective-C",
					  @"Java",
					  @"HTML",
					  @"CSS",
					  @"JavaScript",
					  @"Perl",
					  @"Python",
					  @"Ruby",
					  @"SQL",
					  @"XML"];
	self.list = array;
}

#pragma mark - Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSInteger row = [indexPath row];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:(self.list)[row]];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:(self.list)[row]];
	} else
		return cell;
	cell.textLabel.text = (self.list)[row];
	cell.accessoryType = UITableViewCellAccessoryNone;
	return cell;
}

#pragma mark - Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
	newCell.accessoryType = (newCell.accessoryType == UITableViewCellAccessoryCheckmark) ? UITableViewCellAccessoryNone : UITableViewCellAccessoryCheckmark;
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
