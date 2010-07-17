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
	NSMutableData *mReceivedData;
	NSString *requestBody;
	NSString *timeStamp;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	IBOutlet UIImageView *imageView;
	NSString *currentTimestamp;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;
@property (nonatomic, retain) NSMutableData *mReceivedData;
@property (nonatomic, retain) NSString *requestBody;
@property (nonatomic, retain) NSString *timeStamp;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

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

@end

