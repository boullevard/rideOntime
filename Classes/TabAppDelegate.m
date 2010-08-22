//
//  TabAppDelegate.m
//  Tab
//
//  Created by Nabil Mouzannar on 6/19/10.
//  Copyright Boullevard 2010. All rights reserved.
//

#import "TabAppDelegate.h"

@implementation TabAppDelegate


@synthesize window;
@synthesize rootController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	[window addSubview:rootController.view];
	[window makeKeyAndVisible];

	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
	//return status bar ot original color
	[application setStatusBarStyle:UIStatusBarStyleDefault];
}

- (void)dealloc {
    [rootController release];
	[window release];
    [super dealloc];
}


@end
