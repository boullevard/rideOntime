//
//  TabAppDelegate.h
//  Tab
//
//  Created by Nabil Mouzannar on 6/19/10.
//  Copyright Boullevard 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TouchXML.h"


@interface TabAppDelegate : NSObject <UIApplicationDelegate, UIAlertViewDelegate> {
    UIWindow *window;
	UITabBarController *rootController;
	NSDictionary *linesData; 
	NSDictionary *newlinesData;
	NSString *timeStamp;
	NSMutableArray *rowsSelectedArray;
	UINavigationController *navController;
	UIViewController *tableViewController; // to access railsViewController or LineFavorites
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;
@property (nonatomic, retain) NSDictionary *linesData;
@property (nonatomic, retain) NSDictionary *newlinesData;
@property (nonatomic, retain) NSString *timeStamp;
@property (nonatomic, retain) NSMutableArray *rowsSelectedArray;

@property (nonatomic, retain) UINavigationController *navController;
@property (nonatomic, retain) UIViewController *tableViewController;

	
- (void) setLinesData: (NSDictionary *)dictionary;
- (NSDictionary *) getLinesData;

- (void) setTimeStamp: (NSString *)time;
- (NSString *) getTimeStamp; 

-(void)saveToUserDefaults:(NSMutableArray*)value;
-(void)saveLinesDataToUserDefaults:(NSDictionary*)value; //same as the one saveToUserDefaults in railsViewController
-(NSString*)retrieveLinesDataFromUserDefaults;
-(NSMutableArray*)retrieveFromUserDefaults;
- (NSMutableArray *) getLinesDataBasedOnRowSelectedArray:(NSArray *)value;
-(void)saveTimeStampToUserDefaults:(NSString*)myString;
-(NSString*)retrieveTimeStampFromUserDefaults;

- (void) addObjectTorowSelectedArray: (NSInteger) value;
- (void) deleteFromRowSelectedArray: (NSInteger) value;

@end

