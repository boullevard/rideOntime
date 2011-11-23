//
//  TabAppDelegate.m
//  Tab
//
//  Created by Nabil Mouzannar on 6/19/10.
//  Copyright Boullevard 2010. All rights reserved.
//

#import "TabAppDelegate.h"
#import "FlurryAnalytics.h"


@implementation TabAppDelegate


@synthesize window;
@synthesize rootController;
@synthesize navController, tableViewController;
@synthesize linesData, newlinesData, timeStamp, rowsSelectedArray;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    //added to boullevard/rideOntime does this work
    // Override point for customization after application launch
	// NSSetUncaughtExceptionHandler(&onUncaughtException);
	//Flurry analytics
	//old delete
    //[FlurryAPI startSession:@"JAZA3I6RV59MBFAW6UNM"];
                          //    JAZA3I6RV59MBFAW6UNM
	//[FlurryAPI countPageViews: rootController];
    
    //new Flurry v3.0.0
    [FlurryAnalytics startSession:@"JAZA3I6RV59MBFAW6UNM"];
                                  //JAZA3I6RV59MBFAW6UNM
	//init stuff 
	self.newlinesData = [[NSDictionary alloc] init];
	rowsSelectedArray = [[NSMutableArray alloc] init];
	
	//on initial start i want to grab the rowsSelectedArray from saveToUserDefaults
	rowsSelectedArray = self.retrieveFromUserDefaults;
	NSLog(@"Look for this rowsSelectedArray %@", rowsSelectedArray);
    //	[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"linesData"]; //clear rowSelectedArray from NSUserDefaults
   
	//NSLog(@"%@",[[UIDevice currentDevice] model]);
	//NSLog(@"%@",[[UIDevice currentDevice] systemVersion]);
    // Look for the bundle’s version number.
   // NSBundle* mainBundle;
    
    // Get the main bundle for the app.
   // mainBundle = [NSBundle mainBundle];
    
   // NSString *rideOnTimeNYCVersionNumber = [mainBundle objectForInfoDictionaryKey:@"CFBundleVersion"];
   // NSLog(@"rideOnTimeNYCVersionNumber %@",rideOnTimeNYCVersionNumber);

	
  	[window addSubview:rootController.view];
	[window makeKeyAndVisible];
	return YES;
}
/*
void onUncaughtException(NSException* exception) {
	[FlurryAnalytics logError:@"Uncaught" message:@"Crash!" exception:exception];
} 
 */
- (void) setLinesData: (NSDictionary *) dictionary{
	if (dictionary != linesData){
		[dictionary retain];
		[linesData release];
		linesData = dictionary;
		self.newlinesData = dictionary;
		[self saveLinesDataToUserDefaults: dictionary];
		//NSLog(@"------------------   setLinesData  FIRST ---------------------- self.newlinesData %@ ",[self.newlinesData objectForKey:@"Subway"]);
	}
}

- (NSDictionary *) getLinesData{
//	NSLog(@"getLinesData SECOND :--------------------");
//	NSLog(@"getLinesData: self.newlinesData %@ ", [self.newlinesData objectForKey:@"Subway"] );
	//return linesData;
	//return [self retrieveLinesDataFromUserDefaults];
	if ([self.newlinesData count] == 0){
		self.newlinesData  = [self retrieveLinesDataFromUserDefaults]; //set the newlinesdData
	}
	return self.newlinesData;
}

- (NSMutableArray *) getLinesDataBasedOnRowSelectedArray:(NSArray *)value{	
	NSInteger valueSize = [value count];	
	NSDictionary *chosenLine = [[[NSDictionary alloc] init] autorelease];
	NSMutableArray *myFavoriteSubwayList = [[[NSMutableArray alloc] init] autorelease];
	
	//check first time if user opens app directly from Favorite Lines
	if ([self.newlinesData count] == 0){
		self.newlinesData  = [self retrieveLinesDataFromUserDefaults]; //set the newlinesdData
	}
	//NSLog(@"self.newlinesData %@ ",self.newlinesData);
	NSArray *subwayList = [self.newlinesData objectForKey:@"Subway"];	
	NSArray *busList = [self.newlinesData objectForKey:@"Bus"];	
	NSArray *lirrList = [self.newlinesData objectForKey:@"LIRR"];	
	NSArray *metroNorthList = [self.newlinesData objectForKey:@"Metro-North"];
	NSArray *bridgesAndTunnelsList = [self.newlinesData objectForKey:@"Bridges And Tunnels"];
	
	//NSLog(@"subwayList count %d , busList count %d , lirrList count %d , metroNorthList count %d , bridgesAndTunnelsList count %d ", [subwayList count], [busList count], [lirrList count],[metroNorthList count],[bridgesAndTunnelsList count]);
	for (int i = 0; i < valueSize; i++) {
		NSString *myValue = [value objectAtIndex:i];
		//NSLog(@"if myValue is greater than 11 thisis the index for the usbway array then look up from thebusList array %@ : ", myValue);
		
		switch ([myValue intValue]) {
			case 0:
			case 1:
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
				chosenLine = [subwayList objectAtIndex: [myValue intValue]];// i had to cast from string to int to make it work
			
				break;
			case 11:
			case 12:
			case 13:
			case 14:
			case 15:
			case 16:
			case 17:
			case 18:
			case 19:
			case 20:
			case 21:			
				chosenLine = [busList objectAtIndex: [myValue intValue] - 11]; //BUS
	
				break;
			case 22:
			case 23:
			case 24:
			case 25:
			case 26:
			case 27:
			case 28:
			case 29:
			case 30:
			case 31:
			case 32:			
				chosenLine = [lirrList objectAtIndex: [myValue intValue] - 11 - 11]; //LIRR -11 for the subway and -11 for the ubs list
				
				break;
			case 33:
			case 34:
			case 35:
			case 36:
			case 37:
			case 38:
			case 39:
			case 40:
			case 41:			
				chosenLine = [metroNorthList objectAtIndex: [myValue intValue] - 11 - 11 - 11]; //Metro-North -11 for the subway and -11 for the ubs list - 9 for lirr
				
				break;
			case 42:
			case 43:
			case 44:
			case 45:
			case 46:
			case 47:
			case 48:
			case 49:
			case 50:			
				chosenLine = [bridgesAndTunnelsList objectAtIndex: [myValue intValue] - 11 - 11 - 11 - 9]; //Bridges And Tunnels -11 for the subway and -11 for the ubs list - 9 for lirr - 9 for metro north
			
				break;
			default:
				NSLog(@"[myValue intValue] DOES NOT Match Anything in the lines list %d : ",[myValue intValue]);
				break;
		}
	
		[myFavoriteSubwayList addObject: chosenLine];
	
	}
	return myFavoriteSubwayList;
}

- (void) setTimeStamp: (NSString *) value{
	if (value != timeStamp)
    {
        [value retain];
        [timeStamp release];
        timeStamp = value;
		[self saveTimeStampToUserDefaults : value];
    }
}

- (NSString *) getTimeStamp{
	if (!timeStamp){
		return [self retrieveTimeStampFromUserDefaults];
	}else {
		return timeStamp;	
	}
}



- (void) addObjectTorowSelectedArray: (NSInteger) value {
	//TODO : something is wrong with rowsSelectedArray - i m loosing  the allo init im doign above thats why i m checking initally for the count then recreating it
	if ([rowsSelectedArray count] == 0){
		rowsSelectedArray = [[NSMutableArray alloc] init];
	}
	[rowsSelectedArray addObject:[NSNumber numberWithInt:value]];
	NSLog (@"!!!!! addObjectTorowSelectedArray rowsSelectedArray  %@ ",rowsSelectedArray  );
}

- (void) deleteFromRowSelectedArray: (NSInteger) value {
	[rowsSelectedArray removeObjectAtIndex: value];
}

-(void)saveToUserDefaults:(NSMutableArray*)value {
	NSLog(@"saveToUserDefaults value %@ : ", value);
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	
	if (standardUserDefaults) {
		[standardUserDefaults setObject:value forKey:@"rowSelectedArray"];
		[standardUserDefaults synchronize];
	}
}

-(NSString*)retrieveFromUserDefaults {
	NSUserDefaults *standardUserDefaults = [[NSUserDefaults standardUserDefaults] retain];
	NSString *val = nil;
	
	if (standardUserDefaults) 
		val = [standardUserDefaults objectForKey:@"rowSelectedArray"];
  //  [standardUserDefaults release];
	return val;
}

-(void)saveLinesDataToUserDefaults:(NSDictionary*)value //removed the one saveToUserDefaults in railsViewController
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	
	if (standardUserDefaults) {
		[standardUserDefaults setObject:value forKey:@"linesData"];
		[standardUserDefaults synchronize];
	}
}

-(NSDictionary*)retrieveLinesDataFromUserDefaults
{
	NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	NSDictionary *val = nil;
	
	if (standardUserDefaults) 
		val = [standardUserDefaults objectForKey:@"linesData"];
	
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


//APLICATION STUFF
- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
	// Save data if appropriate
	[self saveToUserDefaults: rowsSelectedArray];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
	// Save data if appropriate
	[self saveToUserDefaults: rowsSelectedArray];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
	
	//TODO add a settings screen
	//rootController.selectedIndex = 2;
	
	//call a method in railsView or LineFavorites to do a refresh

	@try { //BUG: this try..catch does not work in the Simulator
		navController = (UINavigationController *) rootController.selectedViewController;
		tableViewController = (UITableViewController *) navController.topViewController;
		[tableViewController refreshDataApplicationDidBecomeActive];
	}
	@catch (NSException *exception) {
		NSLog(@"TabAppDelegare: Caught %@: %@", [exception name], [exception reason]);
	}
	
	@finally {
		//NSLog(@" FINALLY dont do anything");
	}

}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
	[self saveToUserDefaults: rowsSelectedArray];

	//return status bar ot original color
	[application setStatusBarStyle:UIStatusBarStyleDefault];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}

- (void)dealloc {
	self.newlinesData = nil;
	[self.newlinesData release];
	rowsSelectedArray = nil;
	[rowsSelectedArray release];
	
	linesData = nil;
	[linesData release];
    
	[rootController release];
	[window release];
    [super dealloc];
}


@end
