//
//  ServiceAdvisoryViewController.h
//  rideOnTime
//
//  Created by Nabil Mouzannar on 8/3/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ServiceAdvisoryDetailViewController;

@interface ServiceAdvisoryViewController : UITableViewController <NSXMLParserDelegate>{
	
	IBOutlet UITableView *newsTable;
	
	UIActivityIndicatorView * activityIndicator;
	
	CGSize cellSize;
	
	NSXMLParser * rssParser;
	
	NSMutableArray * stories;
	
	NSString *line;
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
	
	ServiceAdvisoryDetailViewController *serviceAdvisoryDetailViewController;
}
@property (nonatomic, retain) NSString *line ;
- (void)parseXMLFileAtURL:(NSString *)URL;
- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath;
@end
