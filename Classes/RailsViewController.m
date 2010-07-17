//
//  touchXMLViewController.m
//  touchXML
//
//  Created by Nabil Mouzannar on 6/21/10.
//  Copyright Boullevard 2010. All rights reserved.
//

#import "RailsViewController.h"
#import "ServiceDetailViewController.h"
#import "TouchXML.h"
#import "TabAppDelegate.h"

@implementation RailsViewController

@synthesize blogEntries;
@synthesize blogEntries1;
@synthesize tableContents;
@synthesize sortedKeys;

// grabRSSFeed function that takes a string (nodeAddress) as a parameter and
// fills the global listData with the entries
-(void) grabRSSFeed:(NSString *)nodeAddress {
	
    // Initialize the blogEntries MutableArray that we declared in the header
    blogEntries = [[NSMutableArray alloc] init];	
	
	appDelegate = (TabAppDelegate *)[[UIApplication sharedApplication] delegate];
	CXMLDocument *rssParser = [[[CXMLDocument alloc] initWithXMLString:[appDelegate getBody] options:0 error:nil] autorelease];

    // Create a new Array object to be used with the looping of the results from the rssParser
    NSArray *resultNodes = NULL;
	
    // Set the resultNodes Array to contain an object for every instance of an  node in our RSS feed
    resultNodes = [[rssParser rootElement] nodesForXPath:nodeAddress error:nil];
	
    // Loop through the resultNodes to access each items actual data
    for (CXMLElement *resultElement in resultNodes) {
		
        // Create a temporary MutableDictionary to store the items fields in, which will eventually end up in blogEntries
        NSMutableDictionary *blogItem = [[NSMutableDictionary alloc] init];
		
        // Create a counter variable as type "int"
        int counter;
		
        // Loop through the children of the current  node
        for(counter = 0; counter < [resultElement childCount]; counter++) {
			if ([[resultElement childAtIndex:counter] stringValue] != nil){
				if ([[[resultElement childAtIndex:counter] name] isEqualToString: @"text"] ){
					NSString *newStringStatus = [[[resultElement childAtIndex:counter] stringValue] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
					
					if ([newStringStatus length] > 0){
						// Add each field to the blogItem Dictionary with the node name as key and node value as the value
						[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
					}
				}else{
					[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
				}
			}else{
				[blogItem setObject:@"!~~~!" forKey:[[resultElement childAtIndex:counter] name]]; // !~~~! for nothing, nil, null
				
				
			}
		}
		
		// Add the blogItem to the global blogEntries Array so that the view can access it.
        [blogEntries addObject:[blogItem copy]];
		//NSLog(@">>>>> blog item text %@", [[blogEntries objectAtIndex: 0] objectForKey: @"text"]);

    }
}

-(void) grabRSSFeed1:(NSString *)nodeAddress {
	
    // Initialize the blogEntries MutableArray that we declared in the header
    blogEntries1 = [[NSMutableArray alloc] init];	
	
	appDelegate = (TabAppDelegate *)[[UIApplication sharedApplication] delegate];
	CXMLDocument *rssParser = [[[CXMLDocument alloc] initWithXMLString:[appDelegate getBody] options:0 error:nil] autorelease];
	
    // Create a new Array object to be used with the looping of the results from the rssParser
    NSArray *resultNodes = NULL;
	
    // Set the resultNodes Array to contain an object for every instance of an  node in our RSS feed
    resultNodes = [[rssParser rootElement] nodesForXPath:nodeAddress error:nil];
	
    // Loop through the resultNodes to access each items actual data
    for (CXMLElement *resultElement in resultNodes) {
		
        // Create a temporary MutableDictionary to store the items fields in, which will eventually end up in blogEntries
        NSMutableDictionary *blogItem = [[NSMutableDictionary alloc] init];
		
        // Create a counter variable as type "int"
        int counter;
		
        // Loop through the children of the current  node
        for(counter = 0; counter < [resultElement childCount]; counter++) {
			if ([[resultElement childAtIndex:counter] stringValue] != nil){
				if ([[[resultElement childAtIndex:counter] name] isEqualToString: @"text"] ){
					NSString *newStringStatus = [[[resultElement childAtIndex:counter] stringValue] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
					
					if ([newStringStatus length] > 0){
						// Add each field to the blogItem Dictionary with the node name as key and node value as the value
						[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
					}
				}else{
					[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
				}
			}else{
				[blogItem setObject:@"!~~~!" forKey:[[resultElement childAtIndex:counter] name]]; // !~~~! for nothing, nil, null
				
				
			}
		}
		
		// Add the blogItem to the global blogEntries Array so that the view can access it.
        [blogEntries1 addObject:[blogItem copy]];
		//NSLog(@">>>>> blog item text %@", [[blogEntries objectAtIndex: 0] objectForKey: @"text"]);
			[blogItem release];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	 return [self.sortedKeys count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *titleAndCurrentTimeStamp = [NSString stringWithFormat: @"%@ %@", [self.sortedKeys objectAtIndex:section], appDelegate.getTimeStamp];	return titleAndCurrentTimeStamp;
	return titleAndCurrentTimeStamp;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSArray *listData =[self.tableContents objectForKey:
						[self.sortedKeys objectAtIndex:section]];
	return [listData count];
	
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	UILabel *nameLabel = nil;
	UILabel *statusLabel = nil;
	UILabel *timeLabel = nil;
	UILabel *dateLabel = nil;
	NSString *newStringStatus;
    static NSString *CellIdentifier = @"Cell";
    
	NSArray *listData =[self.tableContents objectForKey:
						[self.sortedKeys objectAtIndex:[indexPath section]]];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		// cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
				
		nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(8, 8, 100, 20)] autorelease];
		nameLabel.tag = 1;
		nameLabel.font = [UIFont boldSystemFontOfSize:14];
		[cell.contentView addSubview:nameLabel];
		
		statusLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 8, 170, 14)] autorelease];
		statusLabel.tag = 2;
		statusLabel.font = [UIFont boldSystemFontOfSize:16];
		[cell.contentView addSubview:statusLabel];
		
		dateLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 28, 170, 10)] autorelease];
		dateLabel.tag = 3;
		dateLabel.font = [UIFont boldSystemFontOfSize:10];
		dateLabel.textColor = [UIColor grayColor];
		[cell.contentView addSubview:dateLabel];
		
		timeLabel = [[[UILabel alloc] initWithFrame:CGRectMake(240, 28, 170, 10)] autorelease];
		timeLabel.tag = 4;
		timeLabel.font = [UIFont boldSystemFontOfSize:10];
		timeLabel.textColor = [UIColor grayColor];
		[cell.contentView addSubview:timeLabel];
    } else{
		
		nameLabel = (UILabel *)[cell.contentView viewWithTag:1];			
		statusLabel = (UILabel *)[cell.contentView viewWithTag:2];
		dateLabel = (UILabel *)[cell.contentView viewWithTag:3];
		timeLabel = (UILabel *)[cell.contentView viewWithTag:4];
	}
	
	blogEntryIndex = [indexPath indexAtPosition: [indexPath length] -1];
	
	newStringStatus = [[[listData objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([newStringStatus isEqualToString: @"GOOD SERVICE"]){
		statusLabel.textColor = [UIColor colorWithRed: 0 green: 0.6 blue: 0 alpha:1];//getRGB values and divide by 255
		//nameLabel.textColor = [UIColor colorWithRed: 0.37 green: 0.61 blue: 0.47 alpha:1];
		dateLabel.textColor = [UIColor grayColor];
		timeLabel.textColor = [UIColor grayColor];
		
	}else if ([newStringStatus isEqualToString: @"PLANNED WORK"] ||
			  [newStringStatus isEqualToString: @"DELAYS"]){
		statusLabel.textColor = [UIColor redColor];
		//nameLabel.textColor = [UIColor redColor];
		dateLabel.textColor = [UIColor grayColor];
		timeLabel.textColor = [UIColor grayColor];
		
	}else if ([newStringStatus isEqualToString: @"SERVICE CHANGE"]){
		statusLabel.textColor = [UIColor orangeColor];
		//nameLabel.textColor = [UIColor orangeColor];
		dateLabel.textColor = [UIColor grayColor];		
		timeLabel.textColor = [UIColor grayColor];
		
	}
	
//	NSUInteger row = [indexPath row];
//	cell.textLabel.text = [listData objectAtIndex:row];
	
	nameLabel.text = [[listData objectAtIndex: blogEntryIndex] objectForKey: @"name"];
	statusLabel.text = [[[listData objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	dateLabel.text = [NSString stringWithFormat: @"Last Updated %@", [[listData objectAtIndex: blogEntryIndex] objectForKey: @"Date"]];
	timeLabel.text = [[listData objectAtIndex: blogEntryIndex] objectForKey: @"Time"];
	
	//show do not show accessory
	if ([newStringStatus isEqualToString: @"PLANNED WORK"] || 
		[newStringStatus isEqualToString: @"SERVICE CHANGE"] ||
		[newStringStatus isEqualToString: @"DELAYS"]){
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//UITableViewCellAccessoryDetailDisclosureButton
	}else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	
	
	return cell;	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
		
	NSArray *listData =[self.tableContents objectForKey:
						[self.sortedKeys objectAtIndex:[indexPath section]]];
	// Navigation logic -- create and push a new view controller
	NSString *newStringStatus = [[[listData objectAtIndex: indexPath.row] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([newStringStatus isEqualToString: @"PLANNED WORK"] || 
		[newStringStatus isEqualToString: @"SERVICE CHANGE"] ||
		[newStringStatus isEqualToString: @"DELAYS"]){
		
		if(serviceDetailController == nil)
			serviceDetailController = [[ServiceDetailViewController alloc] initWithNibName:@"ServiceDetailView" bundle:[NSBundle mainBundle]];
		
		serviceDetailController.aLine = [listData objectAtIndex: indexPath.row];
		
		[self.navigationController pushViewController:serviceDetailController animated:YES];
	}
}

- (UIImage *)imageForLine:(NSString *)name {	
	NSString *newStringStatus = [name stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	return [UIImage imageNamed:[NSString stringWithFormat: @"%@.gif", newStringStatus]];
}




- (void)viewDidLoad {
	[super viewDidLoad];
	// Uncomment the following line to add the Edit button to the navigation bar.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



/*
 // Override to support editing the list
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support conditional editing of the list
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support rearranging the list
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the list
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // Check if listData has already been filled, if not
    // then send the request
    if([blogEntries count] == 0) {

		// Create the feed string, in this case I have used dBlog
        NSString *nodeAddress = @"//service/LIRR/line";//@"http://mta.info/status/serviceStatus.txt";
		
        // Call the grabRSSFeed function with the above
        // string as a parameter
        [self grabRSSFeed:nodeAddress];
	
			
		nodeAddress = @"//service/MetroNorth/line";
		 [self grabRSSFeed1:nodeAddress];
		
		NSDictionary *temp =[[NSDictionary alloc]
							 initWithObjectsAndKeys:blogEntries,@"Long Island Rail Road",blogEntries1,@"Metro-North Rail Road",nil];
		self.tableContents =temp;
		[temp release];
		self.sortedKeys =[[self.tableContents allKeys]
						  sortedArrayUsingSelector:@selector(compare:)];
		[blogEntries release];
		[blogEntries1 release];
	//	[arrTemp3 release];
		
		// Call the reloadData function on the blogTable, this
        // will cause it to refresh itself with our new data
        [blogTable reloadData];
		
    }
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
	[tableContents release];
	[sortedKeys release];
	[blogEntries release];
	[CXMLDocument release];
    [super dealloc];
}


@end

