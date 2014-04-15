//
//  LineFavorites.m
//  rideOnTime
//
//  Created by Nabil Mouzannar on 11/29/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "LineFavorites.h"
#import "ServiceDetailViewController.h"
#import "FavoriteLinesManager.h"
#import "TabAppDelegate.h"
#import "Flurry.h"

@implementation LineFavorites

@synthesize myHeaderView;
@synthesize timeStampLabel;
@synthesize reloadButton;
@synthesize mReceivedData;
@synthesize requestBody;
@synthesize myEmptyListLabel;
@synthesize tableContents;
@synthesize blogEntries,blogEntries1,blogEntries2,blogEntries3,blogEntries4;

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
    }

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

- (NSString *) getBody {
	return self.requestBody;
}


- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"!!!!!!!!!!!!!!!!!!!  1 LineFavorites : view viewDidLoad");
	appDelegate = (TabAppDelegate *)[[UIApplication sharedApplication] delegate];

	self.tableContents = [[NSMutableArray alloc] init];
	
	// set up the table's header view based on our UIView 'myHeaderView' outlet
//	CGRect newFrame = CGRectMake(0.0, 0.0, favoriteTable.bounds.size.width, 0.0);//
//	self.myHeaderView.backgroundColor = [UIColor clearColor];
//	self.myHeaderView.frame = newFrame;
//	favoriteTable.tableHeaderView = self.myHeaderView;	// note this will override UITableView's 'sectionHeaderHeight' property
  
	myEmptyListLabel = [[[UILabel alloc] initWithFrame:CGRectMake(10, 50, 300, 140)] autorelease];
	myEmptyListLabel.font = [UIFont systemFontOfSize: 20];
	myEmptyListLabel.textAlignment = NSTextAlignmentCenter;
	myEmptyListLabel.lineBreakMode = NSLineBreakByWordWrapping;
	myEmptyListLabel.numberOfLines = 0;
	myEmptyListLabel.textColor = [UIColor blackColor];
	myEmptyListLabel.text = @"Tap on the ADD button above to add your Favorite Line(s).\n\nSwipe your finger across to delete a Favorite Line.";
	myEmptyListLabel.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.5];
	//myEmptyListLabel.center = self.view.center;
	[self.view addSubview:myEmptyListLabel]; 

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	NSLog(@"************ LineFavorites Flurry : view viewWillAppear");
	[Flurry logEvent:@"LineFavorites"];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
	self.timeStampLabel.text = [NSString stringWithFormat: @"Current as of %@", [appDelegate getTimeStamp]];
	//NSLog(@"3 LineFavoritesappDelegate appDelegate appDelegate rowsSelectedArray %@ ", [appDelegate rowsSelectedArray]);
	if([[appDelegate rowsSelectedArray] count] > 0){ //MAKE SURE you get the latest lines info from appdelegate reloadDataWithFavoriteLinesInBulk
		//NSLog(@" 3 there are some rows selected already!! call reloadDataWithFavoriteLinesInBulk: viewDidLoad rowsSelectedArray %@", [appDelegate rowsSelectedArray]);
		[self reloadDataWithFavoriteLinesInBulk: [appDelegate rowsSelectedArray]];
		[self showHideEmptyListLabel: YES];
	}else {
		//meaning if there are no favorite lines display a message to use the + sign
		
		[self showHideEmptyListLabel: NO];

		
	}

	//getlines
	[favoriteTable reloadData];

}

- (void) showHideEmptyListLabel: (BOOL) value{
	myEmptyListLabel.hidden = value;
	if (!value){ //if value equal NO then also clear timestamp
		self.timeStampLabel.text = @"";
		[self disableReloadButton];
	}else {
		[self enableReloadButton];
	}

}
#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
     return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.tableContents count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UIImageView *lineImage = nil;
	UILabel *nameLabel = nil;
	UILabel *statusLabel = nil;
	NSString *newStringStatus;
    static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  	blogEntryIndex = [indexPath indexAtPosition: [indexPath length] -1];
	
	NSFileManager *fileManager = [NSFileManager defaultManager];

	
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
        
		myImagePath = [[NSBundle mainBundle] pathForResource: [[self.tableContents objectAtIndex: blogEntryIndex] objectForKey: @"name"] ofType:@"png"];
		exists = [fileManager fileExistsAtPath:myImagePath];
	
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
		myImagePath = [[NSBundle mainBundle] pathForResource: [[self.tableContents objectAtIndex: blogEntryIndex] objectForKey: @"name"] ofType:@"png"];
		exists = [fileManager fileExistsAtPath:myImagePath];
		
		lineImage = (UIImageView *)[cell.contentView viewWithTag:1];
		nameLabel = (UILabel *)[cell.contentView viewWithTag:2];			
		statusLabel = (UILabel *)[cell.contentView viewWithTag:3];
	}
	if (exists){
		NSString *lineImageName = [[self.tableContents objectAtIndex: blogEntryIndex] objectForKey: @"name"];
		lineImage.image = [self imageForLine:lineImageName];
		lineImage.hidden = NO;
		nameLabel.hidden = YES;
		nameLabel.text = [[self.tableContents objectAtIndex: blogEntryIndex] objectForKey: @"name"];
		statusLabel.text = [[[self.tableContents objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}else {
		lineImage.hidden = YES;
		nameLabel.text = [[self.tableContents objectAtIndex: blogEntryIndex] objectForKey: @"name"];
		nameLabel.hidden = NO;
		statusLabel.text = [[[self.tableContents objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	}
	
	newStringStatus = [[[self.tableContents objectAtIndex: blogEntryIndex] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([newStringStatus isEqualToString: @"GOOD SERVICE"]){
		statusLabel.textColor = [UIColor colorWithRed: 0 green: 0.6 blue: 0 alpha:1];//getRGB values and divide by 255
	}else if ([newStringStatus isEqualToString: @"PLANNED WORK"] ||
			  [newStringStatus isEqualToString: @"DELAYS"] ||
			  [newStringStatus isEqualToString: @"SUSPENDED"]||
              [newStringStatus isEqualToString: @"SANDY REROUTE"]){
		statusLabel.textColor = [UIColor redColor];		
	}else if ([newStringStatus isEqualToString: @"SERVICE CHANGE"]){
		statusLabel.textColor = [UIColor orangeColor];
	}
	
	//show do not show accessory
	if ([newStringStatus isEqualToString: @"PLANNED WORK"] || 
		[newStringStatus isEqualToString: @"SERVICE CHANGE"] ||
		[newStringStatus isEqualToString: @"DELAYS"] || 
		[newStringStatus isEqualToString: @"SUSPENDED"]||
        [newStringStatus isEqualToString: @"SANDY REROUTE"]){
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
	}else {
		cell.accessoryType = UITableViewCellAccessoryNone;
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
	}
	return cell;	
}



#pragma mark -
#pragma mark Table view delegate

 // Override to support editing the list
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
	 
	// Update the array and table view.
	 [self.tableContents removeObjectAtIndex:indexPath.row];
	 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
	 
	 // i also need to delete the tow from rowSelected
	[appDelegate deleteFromRowSelectedArray:indexPath.row];
	 
	} 
	 if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Navigation logic -- create and push a new view controller

	NSString *newStringStatus = [[[self.tableContents objectAtIndex: indexPath.row] objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([newStringStatus isEqualToString: @"PLANNED WORK"] || 
		[newStringStatus isEqualToString: @"SERVICE CHANGE"] ||
		[newStringStatus isEqualToString: @"DELAYS"]||
		[newStringStatus isEqualToString: @"SUSPENDED"]||
        [newStringStatus isEqualToString: @"SANDY REROUTE"]||
        [newStringStatus isEqualToString: @"SANDY REROUTE"]){
		
	if(serviceDetailController == nil)
		serviceDetailController = [[ServiceDetailViewController alloc] initWithNibName:@"ServiceDetailView" bundle:[NSBundle mainBundle]];
		serviceDetailController.aLine = [self.tableContents objectAtIndex: indexPath.row];
		[self.navigationController pushViewController:serviceDetailController animated:YES];
	}
}


- (UIImage *)imageForLine:(NSString *)name {	
	NSString *newStringStatus = [name stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	return [UIImage imageNamed:[NSString stringWithFormat: @"%@.png", newStringStatus]];
}

- (IBAction)refreshData:(id)sender
{
	[self disableReloadButton];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://web.mta.info/status/serviceStatus.txt"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:6];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	if (!connection){
		NSLog (@"Unable To Connect");
		[self showAlertTitle:@"Network Connection Failure" Text:@"Unable To Connect"];
	}
	[request release];
	
	UIApplication *application = [UIApplication sharedApplication];
	application.networkActivityIndicatorVisible = YES;
}

- (void)refreshDataApplicationDidBecomeActive
{
	[self disableReloadButton];
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://web.mta.info/status/serviceStatus.txt"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:6];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	if (!connection){
		NSLog (@"Unable To Connect");
		[self showAlertTitle:@"Network Connection Failure" Text:@"Unable To Connect"];
	}
	[request release];
	
	UIApplication *application = [UIApplication sharedApplication];
	application.networkActivityIndicatorVisible = YES;
}


- (void) disableReloadButton{
	NSLog(@"disableReloadButton  !");
	reloadButton.enabled = NO;
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
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
	NSString *msg = [NSString stringWithFormat: @"Connection failed. Please make sure you are connected to the internet and try again. We will try to display the last updated current status."];
	// - %@",[error localizedDescription]
	//load the table!!
	[self showOffLineTableData];		
	[self stopAnimation];
	//self.timeStampLabel.text = [NSString stringWithFormat: @"Current as of %@", self.timeStamp];
	//NSLog(@"from ERROR: self.timeStampLabel.text %@",self.timeStampLabel.text);
	[self showAlertTitle:@"Network Connection Failure" Text: msg];
	
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
	self.requestBody	= [[NSString alloc] initWithData:mReceivedData encoding:NSUTF8StringEncoding];
	self.getInitialTimeStamp; //from inside this class
	//load the table!!
	[self showTableData];	
	[self stopAnimation];
	
	[connection release];
	[requestBody release];
	mReceivedData = nil;
	
}

- (void) getInitialTimeStamp{
	CXMLDocument *rssParser = [[[CXMLDocument alloc] initWithXMLString:[self getBody] options:0 error:nil] autorelease];
	NSArray *resultsTimeStamp = [[rssParser rootElement] nodesForXPath:@"//service/timestamp" error:nil];

	//save timeStamp to appDelegate so that LineFavorites class can display it 
	[appDelegate setTimeStamp: [[resultsTimeStamp objectAtIndex:0] stringValue]];
	
}


- (void) showOffLineTableData{
	NSLog(@"showOffLineTableData");
	[self enableReloadButton];
	
	if([[appDelegate rowsSelectedArray] count] > 0){ //MAKE SURE you get the latest lines info from appdelegate reloadDataWithFavoriteLinesInBulk
		//update the timestamp
		self.timeStampLabel.text = [NSString stringWithFormat: @"Current as of %@", [appDelegate getTimeStamp]];
		[self reloadDataWithFavoriteLinesInBulk: [appDelegate rowsSelectedArray]];
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

	// save data to appdelegate
	[appDelegate setLinesData: temp];
	
	[temp release];
	[self enableReloadButton];
	
	if([[appDelegate rowsSelectedArray] count] > 0){ //MAKE SURE you get the latest lines info from appdelegate reloadDataWithFavoriteLinesInBulk
		//update the timestamp
		self.timeStampLabel.text = [NSString stringWithFormat: @"Current as of %@", [appDelegate getTimeStamp]];
		[self reloadDataWithFavoriteLinesInBulk: [appDelegate rowsSelectedArray]];
	}	
}	

/* show the user that loading activity has started */

- (void) startAnimation
{
	UIApplication *application = [UIApplication sharedApplication];
	application.networkActivityIndicatorVisible = YES;
}


/* show the user that loading activity has stopped */

- (void) stopAnimation {
	UIApplication *application = [UIApplication sharedApplication];
	application.networkActivityIndicatorVisible = NO;
}

- (void) showAlertTitle:(NSString *) Title Text: (NSString *) Text {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:Title 
													message:Text
												   delegate:self
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	[alert show];
	[alert release];
}


- (IBAction) addLine:(id)sender {
	//open a model view
	//in modal view have a drop down list to select a line
	//on select - add that line to the array here
	// reload data
	// Create the root view controller for the navigation controller
	// The new view controller configures a Cancel and Done button for the
	// navigation bar.
	favoriteLinesManager = [[FavoriteLinesManager alloc] initWithNibName:@"FavoriteLinesManager" bundle:nil];
		
	// Create the navigation controller and present it modally.
	UINavigationController *modalNavigationController = [[UINavigationController alloc] initWithRootViewController:favoriteLinesManager];

	modalNavigationController.navigationBar.barStyle = UIBarStyleDefault;
	modalNavigationController.title = @"Choose A Line";
	
	//ACTION: Done
	favoriteLinesManager.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelAction:)] autorelease];
	
	//ACTION: Cancel
	favoriteLinesManager.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)] autorelease];

	[self presentViewController:modalNavigationController animated:YES completion:nil];

	
	// The navigation controller is now owned by the current view controller
	// and the root view controller is owned by the navigation controller,
	// so both objects should be released to prevent over-retention.
	[modalNavigationController release];
	[favoriteLinesManager release];
}

// Tell the delegate about the done action.
- (void)doneAction:(id)sender {	
	//NSLog(@"done modal view rowSelected %d",rowSelected);
	rowSelected = [favoriteLinesManager getPickerRowSelected];
	
	//before you add a row check to see if it exists
	//if rowSelected is in rowSelectedArray then do NOT call reloadDataWithFavoriteLines
	//CHECK FOR DUPLICATES of numbers in side the arrayt
	if (![[appDelegate rowsSelectedArray] containsObject:[NSNumber numberWithInt:rowSelected]]) {
		NSLog(@"the row selected does not exists in the array adddd it!!!");
		[appDelegate addObjectTorowSelectedArray:rowSelected];
		[self reloadDataWithFavoriteLinesInBulk: [appDelegate rowsSelectedArray]];
	}
	
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Tell the delegate about the cancellation.
- (void)cancelAction:(id)sender {
	NSLog(@"cancel modal view");
	[self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void) reloadDataWithFavoriteLinesInBulk:(NSArray*)value { 
	//if rowselected are like 0, and 3 - i want to add only row 0 and 3 from the subway array to tmy tableContents
	self.tableContents = [appDelegate getLinesDataBasedOnRowSelectedArray: value];	
	[favoriteTable reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Support all orientations except upside-down
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//For Later to do likefoursquare drag to refresh
#pragma mark Scrolling Overrides
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//	NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	/*
	if (reloading) return;
	
	if (checkForRefresh) {
		if (refreshHeaderView.isFlipped
			&amp;&amp; scrollView.contentOffset.y &gt; -65.0f
			&amp;&amp; scrollView.contentOffset.y &lt; 0.0f
			&amp;&amp; !reloading) {
			[refreshHeaderView flipImageAnimated:YES];
			[refreshHeaderView setStatus:kPullToReloadStatus];
			[popSound play];
			
		} else if (!refreshHeaderView.isFlipped
				   &amp;&amp; scrollView.contentOffset.y &lt; -65.0f) {
			[refreshHeaderView flipImageAnimated:YES];
			[refreshHeaderView setStatus:kReleaseToReloadStatus];
			[psst1Sound play];
		}
	}
	 */
	//NSLog(@"scrollViewDidScroll");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
				  willDecelerate:(BOOL)decelerate {
	/*
	if (reloading) return;
	
	if (scrollView.contentOffset.y &lt;= - 65.0f) {
		if([self.tableView.dataSource respondsToSelector:
			@selector(reloadTableViewDataSource)]){
			[self showReloadAnimationAnimated:YES];
			[psst2Sound play];
			[self reloadTableViewDataSource];
		}
	}
	checkForRefresh = NO;
	 */
	//NSLog(@"scrollViewDidEndDragging");
}



#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
	//self.myHeaderView = nil;
	NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!! lineFavorites viewDidUnload ");
}


- (void)dealloc {
	[self.tableContents release];
	//[myHeaderView release];
	[blogEntries release];
	[blogEntries1 release];
	[blogEntries2 release];
	[blogEntries3 release];
	[blogEntries4 release];
	[CXMLDocument release];
	[mReceivedData release];
	[serviceDetailController release];
    [super dealloc];
}

@end

