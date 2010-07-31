//
//  TabAppDelegate.m
//  Tab
//
//  Created by Nabil Mouzannar on 6/19/10.
//  Copyright Boullevard 2010. All rights reserved.
//

#import "TabAppDelegate.h"
#import "TouchXML.h"

@implementation TabAppDelegate


@synthesize window;
@synthesize rootController;
@synthesize mReceivedData;
@synthesize requestBody;
@synthesize activityIndicator;
@synthesize imageView;
@synthesize timeStamp;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	/*
	 instead i added the key value in info.plist so that it does not flicker
	Key = UIStatusBarStyle
	Value = UIStatusBarStyleOpaqueBlack
	*/
	//[application setStatusBarStyle:UIStatusBarStyleBlackOpaque];
	
	// NABIL I CHANGED SOMETHING NOWWWWW N epxerimental!!!!
	
	
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mta.info/status/serviceStatus.txt"]];
	//cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:6
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	
	if (!connection){
		NSLog (@"Unable To Connect");
		[self showAlertTitle:@"Network Connection Failure" Text:@"Unable To Connect"];
	}
	[request release];
	
	
	
	activityIndicator = [[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
	activityIndicator.frame=CGRectMake(145, 320, 25, 25);
	activityIndicator.tag  = 1;
	activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
	[self startAnimation];

	[window addSubview:activityIndicator];	
	[window makeKeyAndVisible];

	return YES;
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
	[self stopAnimation];

	NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	NSString *msg = [NSString stringWithFormat: @"Connection failed. Please make sure you are connected to the internet and try again. We will try to display the last updated current status."];
	// - %@",[error localizedDescription]

	//Retrieve xml requestBody if no connection
	self.requestBody = [self retrieveFromUserDefaults];
	self.timeStamp = [self retrieveTimeStampFromUserDefaults];
	
	[self showAlertTitle:@"Network Connection Failure" Text: msg];
	
	[window addSubview:rootController.view];
}



- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	self.requestBody	= [[NSString alloc] initWithData:mReceivedData encoding:NSUTF8StringEncoding];
	self.getInitialTimeStamp;
	[self stopAnimation];

	//SAVE!!
	[self saveToUserDefaults: self.requestBody];
	[self saveTimeStampToUserDefaults: self.timeStamp];
	
	[window addSubview:rootController.view];
	
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

- (NSString *) getTimeStamp {
	return self.timeStamp;
}
/* show the user that loading activity has started */

- (void) startAnimation
{
	[self.activityIndicator startAnimating];
	UIApplication *application = [UIApplication sharedApplication];
	application.networkActivityIndicatorVisible = YES;
}


/* show the user that loading activity has stopped */

- (void) stopAnimation
{
	[self.activityIndicator stopAnimating];
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


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
	//return status bar ot original color
	[application setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)dealloc {
	[mReceivedData release];
    [rootController release];
	[self.activityIndicator release];
	[window release];
    [super dealloc];
}


@end
