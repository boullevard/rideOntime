//
//  MapTableViewController.h
//  rideOnTime
//
//  Created by Nabil Mouzannar on 7/31/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MapDetailViewController;

@interface MapTableViewController : UITableViewController {
	
		// This is the outlet for the blog view, it will allow the data from the controller to be used in a view
		IBOutlet UITableView *table;
		
		// mapEntries is used to store the data retrieved from the RSS feed before being added to the view
		NSMutableArray *mapEntries;
		
	NSArray *boroughs;	
		MapDetailViewController *mapDetailController;
	

		int blogEntryIndex;
		
	}
	
	@property (nonatomic, retain) NSMutableArray *mapEntries; 
@property (nonatomic, retain) NSArray *boroughs;
	

	@end
