//
//  CTRowControlsController.m
//  Navigation Controller Demo
//
//  Created by Adam Markon on 8/29/12, updated 9/23/12.
//  Copyright (c) 2012 EHS Code Team. All rights reserved.
//

#import "CTRowControlsController.h"

@implementation CTRowControlsController
@synthesize list;

- (IBAction)buttonTapped:(id)sender {
	UIButton *senderButton = (UIButton *)sender;
	UITableViewCell *buttonCell = (UITableViewCell *)[senderButton superview];
	NSUInteger buttonRow = [[self.tableView indexPathForCell:buttonCell] row];
	NSString *buttonTitle = list[buttonRow];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Tapped The Button"
													message:[NSString stringWithFormat:@"You tapped the button for %@", buttonTitle]
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	NSArray *array = @[@"One Fish",
					  @"Two Fish",
					  @"Red Fish",
					  @"Blue Fish",
					  @"Horton",
					  @"Lorax",
					  @"Whoville",
					  @"Green Eggs",
					  @"Green Ham",
					  @"Sam I Am",
					  @"Cat in the Hat",
					  @"Thing One",
					  @"Thing Two"];
	self.list = array;
}

#pragma mark - Table Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
	return [list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *ControlRowIdentifier = @"ControlRowIdentifier";
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ControlRowIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									  reuseIdentifier:ControlRowIdentifier];
	UIImage *buttonUpImage = [UIImage imageNamed:@"button_up.png"];
	UIImage *buttonDownImage = [UIImage imageNamed:@"button_down.png"];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.frame = CGRectMake(0.0,
							  0.0,
							  buttonUpImage.size.width,
							  buttonUpImage.size.height);
	[button	setBackgroundImage:buttonUpImage
					  forState:UIControlStateNormal];
	[button setBackgroundImage:buttonDownImage
					  forState:UIControlStateHighlighted];
	[button setTitle:@"Tap"
			forState:UIControlStateNormal];
	[button addTarget:self
			   action:@selector(buttonTapped:)
	 forControlEvents:UIControlEventTouchUpInside];
	cell.accessoryView = button;
	}
	NSUInteger row = [indexPath row];
	NSString *rowTitle = list[row];
	cell.textLabel.text = rowTitle;
	
	return cell;
}

#pragma mark - Table Delegate Methods
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	NSString *rowTitle = list[row];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You tapped the row."
													message:[NSString stringWithFormat:@"You tapped %@", rowTitle]
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[tableView deselectRowAtIndexPath:indexPath
							 animated:YES];
}
@end
