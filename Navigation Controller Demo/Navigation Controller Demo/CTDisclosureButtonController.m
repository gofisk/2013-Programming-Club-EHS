//
//  CTDisclosureButtonController.m
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/27/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTDisclosureButtonController.h"
#import "CTAppDelegate.h"
#import "CTDisclosureDetailController.h"

@interface CTDisclosureButtonController ()
@property (strong, nonatomic) CTDisclosureDetailController *childController;
@end

@implementation CTDisclosureButtonController

- (void)viewDidLoad {
	[super viewDidLoad];
	_list = @[@"Toy Story",
					  @"A Bug's Life",
					  @"Toy Story 2",
					  @"Monsters, Inc.",
					  @"Finding Nemo",
					  @"The Incredibles",
					  @"Cars",
					  @"Ratatouille",
					  @"WALL-E",
					  @"Up",
					  @"Toy Story 3",
					  @"Cars 2",
					  @"Brave"];
}

#pragma mark - Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [_list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *DisclosureButtonCellIdentifier = @"DisclosureButtonCellIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DisclosureButtonCellIdentifier];
	
	if (cell == nil)
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:DisclosureButtonCellIdentifier];
	
	NSUInteger row = [indexPath row];
	NSString *rowString = _list[row];
	cell.textLabel.text = rowString;
	cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
	return cell;
}

#pragma - mark Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey, do you see the disclosure button?"
													message:@"If you're trying to drill down, touch that instead"
												   delegate:nil
										  cancelButtonTitle:@"Won't happen again"
										  otherButtonTitles:nil];
	[alert show];
	[tableView deselectRowAtIndexPath:indexPath
							 animated:YES];
}

- (void)tableView:(UITableView *)tableView
accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
	if (_childController == nil)
		_childController = [[CTDisclosureDetailController alloc] initWithNibName:@"CTDisclosureDetail"
																		 bundle:nil];
	_childController.title = @"Disclosure Button Pressed";
	NSUInteger row = [indexPath row];
	NSString *selectedMovie = _list[row];
	NSString *detailMessage = [[NSString alloc] initWithFormat:@"You pressed the disclosure button for %@", selectedMovie];
	_childController.message = detailMessage;
	_childController.title = selectedMovie;
	[self.navigationController pushViewController:_childController
										 animated:YES];
}
@end