//
//  LineFavorites.h
//  rideOnTime
//
//  Created by Nabil Mouzannar on 11/29/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabAppDelegate.h"

@class TabAppDelegate,ServiceDetailViewController,FavoriteLinesManager;

@interface LineFavorites : UIViewController <UITableViewDelegate>{
	TabAppDelegate *appDelegate;
	
	UIView *myHeaderView;
	
	IBOutlet UILabel * timeStampLabel;
	IBOutlet UIBarButtonItem * reloadButton;
	
	// This is the outlet for the blog view, it will allow the data from the controller to be used in a view
    IBOutlet UITableView *favoriteTable;
	NSMutableArray *tableContents;
	NSUInteger blogEntryIndex;
	BOOL exists;
	NSString *myImagePath;
	ServiceDetailViewController *serviceDetailController;
	FavoriteLinesManager *favoriteLinesManager;
	NSUInteger rowSelected;
	
	//connection
	NSMutableData *mReceivedData;
	NSString *requestBody;
	
	//parse
	// blogEntries is used to store the data retrieved from the RSS feed before being added to the view
    NSMutableArray *blogEntries;
	NSMutableArray *blogEntries1;
	NSMutableArray *blogEntries2;
	NSMutableArray *blogEntries3;
	NSMutableArray *blogEntries4;

	UILabel *myEmptyListLabel;

}

@property (nonatomic, retain) IBOutlet UIView *myHeaderView;


@property (nonatomic, retain) IBOutlet UILabel * timeStampLabel;
@property (nonatomic, retain) IBOutlet UILabel *myEmptyListLabel;

@property (nonatomic,retain) NSMutableArray *tableContents;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *reloadButton;

//connection
@property (nonatomic, retain) NSMutableData *mReceivedData;
@property (nonatomic, retain) NSString *requestBody;

// parse
@property (nonatomic, retain) NSMutableArray *blogEntries; 
@property (nonatomic, retain) NSMutableArray *blogEntries1; 
@property (nonatomic, retain) NSMutableArray *blogEntries2; 
@property (nonatomic, retain) NSMutableArray *blogEntries3; 
@property (nonatomic, retain) NSMutableArray *blogEntries4; 

- (UIImage *)imageForLine:(NSString *)name;

- (IBAction) addLine:(id)sender;
- (IBAction) refreshData:(id)sender;
- (void) enableReloadButton;
- (void) disableReloadButton;
- (void) reloadDataWithFavoriteLinesInBulk:(NSArray*)value;

- (void) showAlertTitle:(NSString *) Title Text: (NSString *) Text;
- (void) startAnimation;
- (void) stopAnimation;

- (NSString *) getBody;
- (void) getInitialTimeStamp;

-(void) showHideEmptyListLabel: (BOOL) value;
- (void)refreshDataApplicationDidBecomeActive;
- (void) showTableData;
- (void) showOffLineTableData;
@end
