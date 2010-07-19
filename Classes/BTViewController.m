//
//  touchXMLViewController.m
//  touchXML
//
//  Created by Nabil Mouzannar on 6/21/10.
//  Copyright Boullevard 2010. All rights reserved.
//

#import "BTViewController.h"
#import "ServiceDetailViewController.h"
#import "TouchXML.h"
#import "TabAppDelegate.h"

@implementation BTViewController

@synthesize blogEntries;

// grabRSSFeed function that takes a string (blogAddress) as a parameter and
// fills the global blogEntries with the entries
-(void) grabRSSFeed:(NSString *)blogAddress {
	
    // Initialize the blogEntries MutableArray that we declared in the header
    blogEntries = [[NSMutableArray alloc] init];	
	
    // Convert the supplied URL string into a usable URL object
	//NSURL *url = [NSURL URLWithString: blogAddress];
	//work locally uncomment the aboe line to work online again
	//NSString *path = [[NSBundle mainBundle] pathForResource:@"serviceStatus" ofType:@"xml"];
    //NSURL *url = [NSURL fileURLWithPath:path];
	
	
    // Create a new rssParser object based on the TouchXML "CXMLDocument" class, this is the
    // object that actually grabs and processes the RSS data
  //  CXMLDocument *rssParser = [[[CXMLDocument alloc] initWithContentsOfURL:url options:0 error:nil] autorelease];
	appDelegate = (TabAppDelegate *)[[UIApplication sharedApplication] delegate];
	//NSLog(@" myTabDelegate.requestBody = %@", [appDelegate getBody]);
	CXMLDocument *rssParser = [[[CXMLDocument alloc] initWithXMLString:[appDelegate getBody] options:0 error:nil] autorelease];
	
	
	
    // Create a new Array object to be used with the looping of the results from the rssParser
    NSArray *resultNodes = NULL;
	
    // Set the resultNodes Array to contain an object for every instance of an  node in our RSS feed
    resultNodes = [[rssParser rootElement] nodesForXPath:@"//service/BT/line" error:nil];
	
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
						//NSLog(@"key: %@ ,value: %@ ", [[resultElement childAtIndex:counter] name] , [[resultElement childAtIndex:counter] stringValue]);
						
						
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
		//NSLog(@"!blogEntries %@", blogEntries);
		[blogItem release];
		
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [blogEntries count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	NSString *currentTimeStamp = [NSString stringWithFormat: @"As of %@", appDelegate.getTimeStamp];
	return currentTimeStamp;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UILabel *nameLabel = nil;
	UILabel *statusLabel = nil;
//	UILabel *timeLabel = nil;
//	UILabel *dateLabel = nil;
	NSString *newStringStatus;
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
      
		
		nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(8, 11, 100, 20)] autorelease];
		nameLabel.tag = 1;
		nameLabel.font = [UIFont boldSystemFontOfSize:14];
		nameLabel.adjustsFontSizeToFitWidth = YES;
		[cell.contentView addSubview:nameLabel];
		
		statusLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 15, 170, 14)] autorelease];
		statusLabel.tag = 2;
		statusLabel.font = [UIFont boldSystemFontOfSize:16];
		[cell.contentView addSubview:statusLabel];
/*		
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
*/
 } else{
		
		//lineImage = (UIImageView *)[cell.contentView viewWithTag:1];
		nameLabel = (UILabel *)[cell.contentView viewWithTag:1];			
		statusLabel = (UILabel *)[cell.contentView viewWithTag:2];
	//	dateLabel = (UILabel *)[cell.contentView viewWithTag:3];
	//	timeLabel = (UILabel *)[cell.contentView viewWithTag:4];
	}
	
	blogEntryIndex = [indexPath indexAtPosition: [indexPath length] -1];
	
	newStringStatus = [[[blogEntries objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([newStringStatus isEqualToString: @"GOOD SERVICE"]){
		statusLabel.textColor = [UIColor colorWithRed: 0 green: 0.6 blue: 0 alpha:1];//getRGB values and divide by 255
		//nameLabel.textColor = [UIColor colorWithRed: 0.37 green: 0.61 blue: 0.47 alpha:1];
	//	dateLabel.textColor = [UIColor grayColor];
	//	timeLabel.textColor = [UIColor grayColor];
		
	}else if ([newStringStatus isEqualToString: @"PLANNED WORK"] ||
			  [newStringStatus isEqualToString: @"DELAYS"]){
		statusLabel.textColor = [UIColor redColor];
		//nameLabel.textColor = [UIColor redColor];
	//	dateLabel.textColor = [UIColor grayColor];
	//	timeLabel.textColor = [UIColor grayColor];
		
	}else if ([newStringStatus isEqualToString: @"SERVICE CHANGE"]){
		statusLabel.textColor = [UIColor orangeColor];
		//nameLabel.textColor = [UIColor orangeColor];
	//	dateLabel.textColor = [UIColor grayColor];		
	//	timeLabel.textColor = [UIColor grayColor];
		
	}
	
	nameLabel.text = [[blogEntries objectAtIndex: blogEntryIndex] objectForKey: @"name"];
	statusLabel.text = [[[blogEntries objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
//	dateLabel.text = [NSString stringWithFormat: @"Last Updated %@", [[blogEntries objectAtIndex: blogEntryIndex] objectForKey: @"Date"]];
//	timeLabel.text = [[blogEntries objectAtIndex: blogEntryIndex] objectForKey: @"Time"];

	//show do not show accessory
	if ([newStringStatus isEqualToString: @"PLANNED WORK"] || 
		[newStringStatus isEqualToString: @"SERVICE CHANGE"] ||
		[newStringStatus isEqualToString: @"DELAYS"]){
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;//UITableViewCellAccessoryDetailDisclosureButton
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
	}else {
		cell.accessoryType = UITableViewCellAccessoryNone;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
	}
	
	return cell;	
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Navigation logic -- create and push a new view controller
	NSString *newStringStatus = [[[blogEntries objectAtIndex: indexPath.row] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	//NSLog(@"newStringStatus = %@",newStringStatus);
	if ([newStringStatus isEqualToString: @"PLANNED WORK"] || 
		[newStringStatus isEqualToString: @"SERVICE CHANGE"] ||
		[newStringStatus isEqualToString: @"DELAYS"]){
		
		if(serviceDetailController == nil)
			serviceDetailController = [[ServiceDetailViewController alloc] initWithNibName:@"ServiceDetailView" bundle:[NSBundle mainBundle]];
		
		serviceDetailController.aLine = [blogEntries objectAtIndex: indexPath.row];
		
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
    // Check if blogEntries has already been filled, if not
    // then send the request
    if([blogEntries count] == 0) {
        // Create the feed string, in this case I have used dBlog
        NSString *blogAddress = @"http://mta.info/status/serviceStatus.txt";//http://dblog.com.au/feed/";
		
        // Call the grabRSSFeed function with the above
        // string as a parameter
        [self grabRSSFeed:blogAddress];
		
        // Call the reloadData function on the blogTable, this
        // will cause it to refresh itself with our new data
        [table reloadData];
	}
}
/*
 - (void)viewWillDisappear:(BOOL)animated {
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 }
 */

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[blogEntries release];
	[CXMLDocument release];
    [super dealloc];
}


@end

