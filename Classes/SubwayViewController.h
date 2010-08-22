//
//  touchXMLViewController.h
//  touchXML
//
//  Created by Nabil Mouzannar on 6/21/10.
//  Copyright Boullevard 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchXML.h"

@class TabAppDelegate,SubwayServiceDetailViewController;

@interface SubwayViewController : UITableViewController {
    // This is the outlet for the blog view, it will allow the data from the controller to be used in a view
    IBOutlet UITableView *blogTable;
	
    // blogEntries is used to store the data retrieved from the RSS feed before being added to the view
    NSMutableArray *blogEntries;

	//details view
	SubwayServiceDetailViewController *subwayServiceDetailViewController;

	//cell selected
	int blogEntryIndex;
	
	TabAppDelegate *appDelegate;
	
	IBOutlet UIButton *reload;
}

@property (nonatomic, retain) NSMutableArray *blogEntries; 
@property (nonatomic, retain) IBOutlet UIButton *reload;


- (UIImage *)imageForLine:(NSString *)name;
- (IBAction)reloadData:(id)sender;
@end