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

@synthesize blogEntries,blogEntries1,blogEntries2,blogEntries3,blogEntries4;
@synthesize tableContents;
@synthesize reloadButton;
@synthesize sortedKeys;
@synthesize mReceivedData;
@synthesize requestBody;
@synthesize timeStampLabel;
@synthesize timeStamp;

// grabRSSFeed function that takes a string (nodeAddress) as a parameter and
// fills the global listData with the entries
-(void) grabRSSFeed:(NSString *)nodeAddress {
	
    // Initialize the blogEntries MutableArray that we declared in the header
    blogEntries = [[NSMutableArray alloc] init];	
	
	CXMLDocument *rssParser = [[[CXMLDocument alloc] initWithXMLString:[self getBody] options:0 error:nil] autorelease];

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
	////
	nodeAddress = @"//service/bus/line";
	blogEntries1 = [[NSMutableArray alloc] init];	
	CXMLDocument *rssParser1 = [[[CXMLDocument alloc] initWithXMLString:[self getBody] options:0 error:nil] autorelease];
	resultNodes = NULL;
	resultNodes = [[rssParser1 rootElement] nodesForXPath:nodeAddress error:nil];
	
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
		[blogItem release];
	}

	////
	nodeAddress = @"//service/LIRR/line";
	blogEntries2 = [[NSMutableArray alloc] init];	
	CXMLDocument *rssParser2 = [[[CXMLDocument alloc] initWithXMLString:[self getBody] options:0 error:nil] autorelease];
    resultNodes = NULL;
    resultNodes = [[rssParser2 rootElement] nodesForXPath:nodeAddress error:nil];
    for (CXMLElement *resultElement in resultNodes) {
		NSMutableDictionary *blogItem = [[NSMutableDictionary alloc] init];
        int counter;
        for(counter = 0; counter < [resultElement childCount]; counter++) {
			if ([[resultElement childAtIndex:counter] stringValue] != nil){
				if ([[[resultElement childAtIndex:counter] name] isEqualToString: @"text"] ){
					NSString *newStringStatus = [[[resultElement childAtIndex:counter] stringValue] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
					if ([newStringStatus length] > 0){
						[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
					}
				}else{
					[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
				}
			}else{
				[blogItem setObject:@"!~~~!" forKey:[[resultElement childAtIndex:counter] name]]; // !~~~! for nothing, nil, null
			}
		}
        [blogEntries2 addObject:[blogItem copy]];
		[blogItem release];
    }
	
	////
	nodeAddress = @"//service/MetroNorth/line";
	blogEntries3 = [[NSMutableArray alloc] init];	
	CXMLDocument *rssParser3 = [[[CXMLDocument alloc] initWithXMLString:[self getBody] options:0 error:nil] autorelease];
    resultNodes = NULL;
    resultNodes = [[rssParser3 rootElement] nodesForXPath:nodeAddress error:nil];
    for (CXMLElement *resultElement in resultNodes) {
		NSMutableDictionary *blogItem = [[NSMutableDictionary alloc] init];
        int counter;
        for(counter = 0; counter < [resultElement childCount]; counter++) {
			if ([[resultElement childAtIndex:counter] stringValue] != nil){
				if ([[[resultElement childAtIndex:counter] name] isEqualToString: @"text"] ){
					NSString *newStringStatus = [[[resultElement childAtIndex:counter] stringValue] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
					if ([newStringStatus length] > 0){
						[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
					}
				}else{
					[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
				}
			}else{
				[blogItem setObject:@"!~~~!" forKey:[[resultElement childAtIndex:counter] name]]; // !~~~! for nothing, nil, null
			}
		}
        [blogEntries3 addObject:[blogItem copy]];
		[blogItem release];
    }
	
	
	////
	nodeAddress = @"//service/BT/line";
	blogEntries4 = [[NSMutableArray alloc] init];	
	CXMLDocument *rssParser4 = [[[CXMLDocument alloc] initWithXMLString:[self getBody] options:0 error:nil] autorelease];
    resultNodes = NULL;
    resultNodes = [[rssParser4 rootElement] nodesForXPath:nodeAddress error:nil];
    for (CXMLElement *resultElement in resultNodes) {
		NSMutableDictionary *blogItem = [[NSMutableDictionary alloc] init];
        int counter;
        for(counter = 0; counter < [resultElement childCount]; counter++) {
			if ([[resultElement childAtIndex:counter] stringValue] != nil){
				if ([[[resultElement childAtIndex:counter] name] isEqualToString: @"text"] ){
					NSString *newStringStatus = [[[resultElement childAtIndex:counter] stringValue] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
					if ([newStringStatus length] > 0){
						[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
					}
				}else{
					[blogItem setObject:[[resultElement childAtIndex:counter] stringValue] forKey:[[resultElement childAtIndex:counter] name]];
				}
			}else{
				[blogItem setObject:@"!~~~!" forKey:[[resultElement childAtIndex:counter] name]]; // !~~~! for nothing, nil, null
			}
		}
        [blogEntries4 addObject:[blogItem copy]];
		[blogItem release];
    }
	
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	 return [self.sortedKeys count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [self.sortedKeys objectAtIndex:section];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSArray *listData =[self.tableContents objectForKey: [self.sortedKeys objectAtIndex:section]];
	return [listData count];
	
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UIImageView *lineImage = nil;
	UILabel *nameLabel = nil;
	UILabel *statusLabel = nil;
	NSString *newStringStatus;
	NSString *newNameString;
    static NSString *CellIdentifier = @"Cell";
    	
	NSArray *listData =[self.tableContents objectForKey:
						[self.sortedKeys objectAtIndex:[indexPath section]]];
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  	blogEntryIndex = [indexPath indexAtPosition: [indexPath length] -1];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	
		lineImage = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"123.png"]] autorelease];
		CGRect imageFrame = lineImage.frame;
		imageFrame.origin = CGPointMake(8, 11);
		lineImage.frame = imageFrame;
		lineImage.tag = 1;
			[cell.contentView addSubview:lineImage];
		
		nameLabel = [[[UILabel alloc] initWithFrame:CGRectMake(8, 11, 100, 20)] autorelease];
		nameLabel.tag = 2;
		nameLabel.font = [UIFont boldSystemFontOfSize:14];
		nameLabel.adjustsFontSizeToFitWidth = YES;
		[cell.contentView addSubview:nameLabel];
		
		statusLabel = [[[UILabel alloc] initWithFrame:CGRectMake(140, 15, 170, 14)] autorelease];
		statusLabel.tag = 3;
		statusLabel.font = [UIFont boldSystemFontOfSize:16];
		[cell.contentView addSubview:statusLabel];
	} else{
		newNameString = [[[listData objectAtIndex: blogEntryIndex] objectForKey: @"name"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
		//if ([newNameString isEqualToString: @"123"]){
			NSLog(@"SHOU add image");
	//	lineImage.image
		
			lineImage = (UIImageView *)[cell.contentView viewWithTag:1];
			nameLabel = (UILabel *)[cell.contentView viewWithTag:2];			
			statusLabel = (UILabel *)[cell.contentView viewWithTag:3];
		//}else {
		//	nameLabel = (UILabel *)[cell.contentView viewWithTag:1];			
		//	statusLabel = (UILabel *)[cell.contentView viewWithTag:2];
		//}

		
	}
	
	newStringStatus = [[[listData objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([newStringStatus isEqualToString: @"GOOD SERVICE"]){
		statusLabel.textColor = [UIColor colorWithRed: 0 green: 0.6 blue: 0 alpha:1];//getRGB values and divide by 255
		
	}else if ([newStringStatus isEqualToString: @"PLANNED WORK"] ||
			  [newStringStatus isEqualToString: @"DELAYS"] ||
			  [newStringStatus isEqualToString: @"SUSPENDED"]){
		statusLabel.textColor = [UIColor redColor];		
	}else if ([newStringStatus isEqualToString: @"SERVICE CHANGE"]){
		statusLabel.textColor = [UIColor orangeColor];
	}
	
	newNameString = [[[listData objectAtIndex: blogEntryIndex] objectForKey: @"name"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	//if ([newNameString isEqualToString: @"123"]){
	//	lineImage.image = [UIImage imageNamed: @"123.png"];
	//}
	nameLabel.text = [[listData objectAtIndex: blogEntryIndex] objectForKey: @"name"];
	statusLabel.text = [[[listData objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];

	//show do not show accessory
	if ([newStringStatus isEqualToString: @"PLANNED WORK"] || 
		[newStringStatus isEqualToString: @"SERVICE CHANGE"] ||
		[newStringStatus isEqualToString: @"DELAYS"] || 
		[newStringStatus isEqualToString: @"SUSPENDED"]){
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
	}else {
		cell.accessoryType = UITableViewCellAccessoryNone;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
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
		[newStringStatus isEqualToString: @"DELAYS"]||
		[newStringStatus isEqualToString: @"SUSPENDED"]){
		
		if(serviceDetailController == nil)
			serviceDetailController = [[ServiceDetailViewController alloc] initWithNibName:@"ServiceDetailView" bundle:[NSBundle mainBundle]];
		
		serviceDetailController.aLine = [listData objectAtIndex: indexPath.row];
		
		[self.navigationController pushViewController:serviceDetailController animated:YES];
	}
}


- (UIImage *)imageForLine:(NSString *)name {	
	NSLog(@"name %@", name);
	return [UIImage imageNamed:[NSString stringWithFormat: @"%@.png", name]];
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
	NSLog(@"view viewDidAppear");

	if([blogEntries count] == 0) {
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mta.info/status/serviceStatus.txt"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:6];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];	
	if (!connection){
		NSLog (@"Unable To Connect");
		[self showAlertTitle:@"Network Connection Failure" Text:@"Unable To Connect"];
	}
	[request release];
	
	
	[self startAnimation];
	}
}

- (void) showTableData{
	// Create the feed string, in this case I have used dBlog
	NSString *nodeAddress = @"//service/subway/line";
	[self grabRSSFeed:nodeAddress];
	
	NSDictionary *temp =[[NSDictionary alloc]
						 initWithObjectsAndKeys:blogEntries,@"Subway",blogEntries1,@"Bus",blogEntries2,@"LIRR",blogEntries3,@"Metro-North",
						 blogEntries4,@"Bridges And Tunnels",
						 nil
						 ];
	self.tableContents =temp;
	[temp release];
	self.sortedKeys = [self.tableContents allKeys];//[[self.tableContents allKeys] sortedArrayUsingSelector:@selector(compare:)];
	
	[blogEntries release];
	[blogEntries1 release];
	[blogEntries2 release];
	[blogEntries3 release];
	[blogEntries4 release];
	
	[self enableReloadButton];
	
	// Call the reloadData function on the blogTable, this
	// will cause it to refresh itself with our new data

	[blogTable reloadData];
}	
- (IBAction)reloadData:(id)sender
{
	NSLog(@"RELOAD Data!");
	reloadButton.enabled = NO;
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mta.info/status/serviceStatus.txt"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:6];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	if (!connection){
		NSLog (@"Unable To Connect");
		[self showAlertTitle:@"Network Connection Failure" Text:@"Unable To Connect"];
	}
	[request release];
	
	UIApplication *application = [UIApplication sharedApplication];
	application.networkActivityIndicatorVisible = YES;
	
	
}

- (void) enableReloadButton{
	NSLog(@"enableReloadButton  !");
	reloadButton.enabled = YES;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
	self.mReceivedData = [[NSMutableData alloc] init];
	if ([(NSHTTPURLResponse*)response statusCode] == 404)  {// 404 is page not found
		NSLog(@"Connection failed!");
		NSString *msg = [NSString stringWithFormat: @"Connection failed. We will try to display the last updated current status."];
		[self showAlertTitle:@"Network Connection Failure" Text: msg];
		[connection cancel];
		[connection release];
	}
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	[mReceivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	
	[connection release];
	mReceivedData = nil;

	
	NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	NSString *msg = [NSString stringWithFormat: @"Connection failed. Please make sure you are connected to the internet and try again. We will try to display the last updated current status."];
	// - %@",[error localizedDescription]
	
	//Retrieve xml requestBody if no connection
	self.requestBody = [self retrieveFromUserDefaults];
	self.timeStamp = [self retrieveTimeStampFromUserDefaults];
	
	//tODO load the table!!
	[self showTableData];	
	[self stopAnimation];
	self.timeStampLabel.text = [NSString stringWithFormat: @"Current as of %@", self.timeStamp];
	
	[self showAlertTitle:@"Network Connection Failure" Text: msg];

}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	self.requestBody	= [[NSString alloc] initWithData:mReceivedData encoding:NSUTF8StringEncoding];
	self.getInitialTimeStamp;
	
	//SAVE!!
	[self saveToUserDefaults: self.requestBody];
	[self saveTimeStampToUserDefaults: self.timeStamp];
	
	//tODO load the table!!
	[self showTableData];	
	[self stopAnimation];
	self.timeStampLabel.text = [NSString stringWithFormat: @"Current as of %@", self.timeStamp];
	
	[connection release];
	[requestBody release];
	mReceivedData = nil;
	
}

-(void)saveToUserDefaults:(NSString*)myString
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	
	if (standardUserDefaults) {
		[standardUserDefaults setObject:myString forKey:@"Prefs"];
		[standardUserDefaults synchronize];
	}
}

-(NSString*)retrieveFromUserDefaults
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSString *val = nil;
	
	if (standardUserDefaults) 
		val = [standardUserDefaults objectForKey:@"Prefs"];
	
	return val;
}

-(void)saveTimeStampToUserDefaults:(NSString*)myString
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	
	if (standardUserDefaults) {
		[standardUserDefaults setObject:myString forKey:@"Timestamp"];
		[standardUserDefaults synchronize];
	}
}

-(NSString*)retrieveTimeStampFromUserDefaults
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSString *val = nil;
	
	if (standardUserDefaults) 
		val = [standardUserDefaults objectForKey:@"Timestamp"];
	
	return val;
}
- (NSString *) getBody {
	return self.requestBody;
}

- (void) getInitialTimeStamp{
	CXMLDocument *rssParser = [[[CXMLDocument alloc] initWithXMLString:[self getBody] options:0 error:nil] autorelease];
	NSArray *resultsTimeStamp = [[rssParser rootElement] nodesForXPath:@"//service/timestamp" error:nil];
	self.timeStamp = [[resultsTimeStamp objectAtIndex:0] stringValue];
}

/* show the user that loading activity has started */

- (void) startAnimation
{
	UIApplication *application = [UIApplication sharedApplication];
	application.networkActivityIndicatorVisible = YES;
}


/* show the user that loading activity has stopped */

- (void) stopAnimation
{
	UIApplication *application = [UIApplication sharedApplication];
	application.networkActivityIndicatorVisible = NO;
}

- (void) showAlertTitle:(NSString *) Title Text: (NSString *) Text
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Title 
													message:Text
												   delegate:self
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
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
	[mReceivedData release];
    [super dealloc];
}


@end

