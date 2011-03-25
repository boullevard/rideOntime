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

@interface RailsViewController : UIViewController <UITableViewDelegate>{
   TabAppDelegate *appDelegate;
	
	// This is the outlet for the blog view, it will allow the data from the controller to be used in a view
    IBOutlet UITableView *blogTable;
    // blogEntries is used to store the data retrieved from the RSS feed before being added to the view
    NSMutableArray *blogEntries;
	NSMutableArray *blogEntries1;
	NSMutableArray *blogEntries2;
	NSMutableArray *blogEntries3;
	NSMutableArray *blogEntries4;
	
	NSDictionary *tableContents;
	NSArray *sortedKeys;

	ServiceDetailViewController *serviceDetailController;
	
	int blogEntryIndex;
	IBOutlet UIBarButtonItem * reloadButton;
	IBOutlet UILabel * timeStampLabel;
	
	NSMutableData *mReceivedData;
	NSString *requestBody;
	NSString *timeStamp;
	BOOL IS_FIRSTTIME;
	BOOL exists;
	NSString *myImagePath;
	
}
@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;
@property (nonatomic, retain) NSMutableArray *blogEntries; 
@property (nonatomic, retain) NSMutableArray *blogEntries1; 
@property (nonatomic, retain) NSMutableArray *blogEntries2; 
@property (nonatomic, retain) NSMutableArray *blogEntries3; 
@property (nonatomic, retain) NSMutableArray *blogEntries4; 
@property (nonatomic, retain) IBOutlet UIBarButtonItem *reloadButton;

@property (nonatomic, retain) NSMutableData *mReceivedData;
@property (nonatomic, retain) NSString *requestBody;
@property (nonatomic, retain) NSString *timeStamp;

@property (nonatomic, retain) IBOutlet UILabel * timeStampLabel;

- (void) showAlertTitle:(NSString *) Title Text: (NSString *) Text;
- (void) startAnimation;
- (void) stopAnimation;

- (NSString *) getBody;
- (void) getInitialTimeStamp;

- (UIImage *)imageForLine:(NSString *)name;
- (IBAction)refreshData:(id)sender;
- (void) enableReloadButton;
- (void) disableReloadButton;
- (void)refreshDataApplicationDidBecomeActive;
- (void)saveRequestBodyToUserDefaults:(NSString*)value;
-(NSString*)retrieveRequestBodyFromUserDefaults;
 @end
