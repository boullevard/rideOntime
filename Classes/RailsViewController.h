//
//  BusTableViewController.h
//  TabsExample
//
//  Created by Nabil Mouzannar on 6/22/10.
//  Copyright 2010 Boullevard. All rights reserved.
//

#import <UIKit/UIKit.h>


#import "TouchXML.h"

@class TabAppDelegate,ServiceDetailViewController;

@interface RailsViewController : UITableViewController {
    // This is the outlet for the blog view, it will allow the data from the controller to be used in a view
    IBOutlet UITableView *blogTable;
	
    // blogEntries is used to store the data retrieved from the RSS feed before being added to the view
    NSMutableArray *blogEntries;
	    NSMutableArray *blogEntries1;
	
	NSDictionary *tableContents;
	NSArray *sortedKeys;
	
    // loadSwirlie will display a loading overlay while the data is downloaded from the RSS feed.
    UIActivityIndicatorView *loadSwirlie;
	
	ServiceDetailViewController *serviceDetailController;
	
	TabAppDelegate *appDelegate;
	
	int blogEntryIndex;
	
}
@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;
@property (nonatomic, retain) NSMutableArray *blogEntries; 
@property (nonatomic, retain) NSMutableArray *blogEntries1; 


- (UIImage *)imageForLine:(NSString *)name;
@end
