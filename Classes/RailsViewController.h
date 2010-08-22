//
//  BusTableViewController.h
//  TabsExample
//
//  Created by Nabil Mouzannar on 6/22/10.
//  Copyright 2010 Boullevard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchXML.h"

@class ServiceDetailViewController;

@interface RailsViewController : UIViewController <UITableViewDelegate>{
    // This is the outlet for the blog view, it will allow the data from the controller to be used in a view
    IBOutlet UITableView *blogTable;
	IBOutlet UIView *myView;
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
-(void)saveToUserDefaults:(NSString*)myString;
-(NSString*)retrieveFromUserDefaults;
-(void)saveTimeStampToUserDefaults:(NSString*)myString;
-(NSString*)retrieveTimeStampFromUserDefaults;

- (NSString *) getBody;
- (void) getInitialTimeStamp;
- (NSString *) getTimeStamp;
- (void) reloadData;


- (UIImage *)imageForLine:(NSString *)name;
- (IBAction)reloadData:(id)sender;
- (void) enableReloadButton;

@end
