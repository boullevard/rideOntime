//
//  MapTableViewController.m
//  rideOnTime
//
//  Created by Nabil Mouzannar on 7/31/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "MapTableViewController.h"
#import "MapDetailViewController.h"

@implementation MapTableViewController

//@synthesize mapEntries;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [boroughs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	static NSString *MyIdentifier = @"MyIdentifier";
	
	// Try to retrieve from the table view a now-unused cell with the given identifier.
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
	
	// If no cell is available, create a new one using the given identifier.
	if (cell == nil) {
		// Use the default cell style.
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier] autorelease];
	}
	//NSLog(@"indexPath.row %d ",indexPath.row);
//NSLog (@">>>>> view DidAppear mapEntries %d",[mapEntries count]);
	// Set up the cell.
	//NSString *mapName = [mapEntries objectAtIndex:indexPath.row];
	//cell.textLabel.text = mapName;
	//NSLog(@"mapName %@ ", mapName);

	
	NSString *mapName = [boroughs objectAtIndex:indexPath.row];
	cell.textLabel.text = mapName;
//	NSLog(@"mapName %@ ", mapName);
//	for (NSString *borough in boroughs) {
//		NSLog(@"%@", borough);	//in alphabetical order
//	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"didSelectRowAtIndexPath");
		if(mapDetailController == nil)
			mapDetailController = [[MapDetailViewController alloc] initWithNibName:@"MapDetailViewController" bundle:[NSBundle mainBundle]];
		
	//	mapDetailController.pdf = [boroughs objectAtIndex: indexPath.row];
		
		[self.navigationController pushViewController:mapDetailController animated:YES];
	
}


- (void)viewDidLoad {
	[super viewDidLoad];
	// Uncomment the following line to add the Edit button to the navigation bar.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	NSLog(@"viewDidAppear");
	// Initialize the blogEntries MutableArray that we declared in the header
    mapEntries = [[NSMutableArray alloc] init];
	[mapEntries addObject:@"Subway"];
	[mapEntries addObject:@"Bus"];
				  //WithObjects:@"Subway Map", @"Bus", @"Metro North Map", @"LIRR Map", nil];
//	NSLog (@"view DidAppear mapEntries %@",mapEntries);
//	NSLog (@"[mapEntries count] %@",[mapEntries count]);
	// Call the reloadData function on the blogTable, this
	// will cause it to refresh itself with our new data
	//[table reloadData];
	
	////
	boroughs = [NSArray arrayWithObjects:
						 @"Subway!",
						 @"Brooklyn",
						 @"Manhattan",
						 @"Queens",
						 @"Staten Island",
						 nil
						 ];
	
	

	////
	}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[mapEntries release];
	[boroughs release];
    [super dealloc];
}


@end

